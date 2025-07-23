using FluentAssertions;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Moq;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using Xunit;
using YurttaYe.Web.Middleware;

namespace YurttaYe.Tests.UnitTests.Middleware
{
    public class ApiKeyMiddlewareTests
    {
        private readonly Mock<RequestDelegate> _mockNext;
        private readonly Mock<IConfiguration> _mockConfiguration;
        private readonly Mock<IConfigurationSection> _mockConfigSection;
        private readonly ApiKeyMiddleware _middleware;
        private readonly DefaultHttpContext _httpContext;

        public ApiKeyMiddlewareTests()
        {
            _mockNext = new Mock<RequestDelegate>();
            _mockConfiguration = new Mock<IConfiguration>();
            _mockConfigSection = new Mock<IConfigurationSection>();
            _middleware = new ApiKeyMiddleware(_mockNext.Object, _mockConfiguration.Object);
            _httpContext = new DefaultHttpContext();
            _httpContext.Response.Body = new MemoryStream();
        }

        [Fact]
        public async Task InvokeAsync_Should_Call_Next_When_Path_Is_Not_Api()
        {
            // Arrange
            _httpContext.Request.Path = "/home";

            // Act
            await _middleware.InvokeAsync(_httpContext);

            // Assert
            _mockNext.Verify(next => next(_httpContext), Times.Once);
        }

        [Fact]
        public async Task InvokeAsync_Should_Return_401_When_Api_Key_Header_Is_Missing()
        {
            // Arrange
            _httpContext.Request.Path = "/api/city";

            // Act
            await _middleware.InvokeAsync(_httpContext);

            // Assert
            _httpContext.Response.StatusCode.Should().Be(401);
            _mockNext.Verify(next => next(_httpContext), Times.Never);
            
            var responseBody = await GetResponseBodyAsync();
            responseBody.Should().Be("API Key is missing");
        }

        [Fact]
        public async Task InvokeAsync_Should_Return_401_When_Api_Key_Is_Invalid()
        {
            // Arrange
            _httpContext.Request.Path = "/api/city";
            _httpContext.Request.Headers["X-API-Key"] = "INVALID_KEY";
            
            _mockConfigSection.Setup(x => x.Value).Returns("YOUR_API_KEY_HERE");
            _mockConfiguration.Setup(x => x.GetSection("ApiSettings:ApiKey"))
                .Returns(_mockConfigSection.Object);

            // Act
            await _middleware.InvokeAsync(_httpContext);

            // Assert
            _httpContext.Response.StatusCode.Should().Be(401);
            _mockNext.Verify(next => next(_httpContext), Times.Never);
            
            var responseBody = await GetResponseBodyAsync();
            responseBody.Should().Be("Invalid API Key");
        }

        [Fact]
        public async Task InvokeAsync_Should_Return_401_When_Api_Key_Is_Null_In_Config()
        {
            // Arrange
            _httpContext.Request.Path = "/api/city";
            _httpContext.Request.Headers["X-API-Key"] = "YOUR_API_KEY_HERE";
            
            _mockConfigSection.Setup(x => x.Value).Returns((string?)null);
            _mockConfiguration.Setup(x => x.GetSection("ApiSettings:ApiKey"))
                .Returns(_mockConfigSection.Object);

            // Act
            await _middleware.InvokeAsync(_httpContext);

            // Assert
            _httpContext.Response.StatusCode.Should().Be(401);
            _mockNext.Verify(next => next(_httpContext), Times.Never);
            
            var responseBody = await GetResponseBodyAsync();
            responseBody.Should().Be("Invalid API Key");
        }

        [Fact]
        public async Task InvokeAsync_Should_Call_Next_When_Api_Key_Is_Valid()
        {
            // Arrange
            _httpContext.Request.Path = "/api/city";
            _httpContext.Request.Headers["X-API-Key"] = "YOUR_API_KEY_HERE";
            
            _mockConfigSection.Setup(x => x.Value).Returns("YOUR_API_KEY_HERE");
            _mockConfiguration.Setup(x => x.GetSection("ApiSettings:ApiKey"))
                .Returns(_mockConfigSection.Object);

            // Act
            await _middleware.InvokeAsync(_httpContext);

            // Assert
            _httpContext.Response.StatusCode.Should().Be(200);
            _mockNext.Verify(next => next(_httpContext), Times.Once);
        }

        [Theory]
        [InlineData("/api")]
        [InlineData("/api/")]
        [InlineData("/api/city")]
        [InlineData("/api/menu")]
        [InlineData("/api/city/1")]
        public async Task InvokeAsync_Should_Check_Api_Key_For_All_Api_Paths(string path)
        {
            // Arrange
            _httpContext.Request.Path = path;

            // Act
            await _middleware.InvokeAsync(_httpContext);

            // Assert
            _httpContext.Response.StatusCode.Should().Be(401);
            _mockNext.Verify(next => next(_httpContext), Times.Never);
        }

        [Theory]
        [InlineData("/")]
        [InlineData("/home")]
        [InlineData("/account/login")]
        [InlineData("/admin")]
        [InlineData("/apinot")]
        public async Task InvokeAsync_Should_Not_Check_Api_Key_For_Non_Api_Paths(string path)
        {
            // Arrange
            _httpContext.Request.Path = path;

            // Act
            await _middleware.InvokeAsync(_httpContext);

            // Assert
            _mockNext.Verify(next => next(_httpContext), Times.Once);
        }

        private async Task<string> GetResponseBodyAsync()
        {
            _httpContext.Response.Body.Seek(0, SeekOrigin.Begin);
            using var reader = new StreamReader(_httpContext.Response.Body, Encoding.UTF8);
            return await reader.ReadToEndAsync();
        }
    }
}
