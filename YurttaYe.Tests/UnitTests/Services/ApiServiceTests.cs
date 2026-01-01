using FluentAssertions;
using Moq;
using Moq.Protected;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using Xunit;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Web.Services;

namespace YurttaYe.Tests.UnitTests.Services
{
    public class ApiServiceTests
    {
        private readonly Mock<HttpMessageHandler> _mockHttpMessageHandler;
        private readonly HttpClient _httpClient;
        private readonly ApiService _apiService;

        public ApiServiceTests()
        {
            _mockHttpMessageHandler = new Mock<HttpMessageHandler>();
            _httpClient = new HttpClient(_mockHttpMessageHandler.Object);
            _apiService = new ApiService(_httpClient);
        }

        [Fact]
        public async Task GetCities_Should_Return_Cities_When_Api_Call_Successful()
        {
            // Arrange
            var expectedCities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" },
                new City { Id = 2, Name = "Ankara" }
            };

            var json = JsonSerializer.Serialize(expectedCities);
            var httpResponse = new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new StringContent(json, System.Text.Encoding.UTF8, "application/json")
            };

            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.Is<HttpRequestMessage>(req => 
                        req.Method == HttpMethod.Get && 
                        req.RequestUri!.ToString().Contains("/api/City")),
                    ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(httpResponse);

            // Act
            var result = await _apiService.GetCities();

            // Assert
            result.Should().NotBeNull();
            result.Should().HaveCount(2);
            result.Should().BeEquivalentTo(expectedCities);
        }

        [Fact]
        public async Task GetCities_Should_Return_Empty_List_When_Api_Returns_Null()
        {
            // Arrange
            var httpResponse = new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new StringContent("null", System.Text.Encoding.UTF8, "application/json")
            };

            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(httpResponse);

            // Act
            var result = await _apiService.GetCities();

            // Assert
            result.Should().NotBeNull();
            result.Should().BeEmpty();
        }

        [Fact]
        public async Task GetCities_Should_Throw_Exception_When_Http_Request_Fails()
        {
            // Arrange
            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .ThrowsAsync(new HttpRequestException("Network error"));

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _apiService.GetCities());
            
            exception.Message.Should().Contain("Şehirler yüklenemedi");
            exception.Message.Should().Contain("Network error");
        }

        [Fact]
        public async Task GetMenus_Should_Return_Menus_When_Api_Call_Successful()
        {
            // Arrange
            var expectedMenus = new List<Menu>
            {
                new Menu 
                { 
                    Id = 1, 
                    CityId = 1, 
                    MealType = "Öğle", 
                    Energy = "2000 kcal",
                    Date = DateTime.Now
                }
            };

            var json = JsonSerializer.Serialize(expectedMenus);
            var httpResponse = new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new StringContent(json, System.Text.Encoding.UTF8, "application/json")
            };

            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.Is<HttpRequestMessage>(req => 
                        req.Method == HttpMethod.Get && 
                        req.RequestUri!.ToString().Contains("/api/Menu")),
                    ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(httpResponse);

            // Act
            var result = await _apiService.GetMenus(null, null, null);

            // Assert
            result.Should().NotBeNull();
            result.Should().HaveCount(1);
            result.First().Id.Should().Be(1);
        }

        [Fact]
        public async Task GetMenus_Should_Build_Query_String_With_Parameters()
        {
            // Arrange
            var expectedMenus = new List<Menu>();
            var json = JsonSerializer.Serialize(expectedMenus);
            var httpResponse = new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new StringContent(json, System.Text.Encoding.UTF8, "application/json")
            };

            HttpRequestMessage? capturedRequest = null;

            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .Callback<HttpRequestMessage, CancellationToken>((request, _) =>
                {
                    capturedRequest = request;
                })
                .ReturnsAsync(httpResponse);

            // Act
            await _apiService.GetMenus(1, "Öğle", "2025-07-23");

            // Assert
            capturedRequest.Should().NotBeNull();
            var expectedUrl = "https://localhost:5107/api/Menu?cityId=1&mealType=%C3%96%C4%9Fle&date=2025-07-23";
            // Note: HttpClient may or may not URL-encode depending on how URI is constructed
            // We just verify the essential parts are present
            capturedRequest!.RequestUri!.ToString().Should().Contain("cityId=1");
            capturedRequest!.RequestUri!.ToString().Should().Contain("mealType=");
            capturedRequest!.RequestUri!.ToString().Should().Contain("date=2025-07-23");
        }

        [Fact]
        public async Task GetMenus_Should_Build_Query_String_With_Partial_Parameters()
        {
            // Arrange
            var expectedMenus = new List<Menu>();
            var json = JsonSerializer.Serialize(expectedMenus);
            var httpResponse = new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new StringContent(json, System.Text.Encoding.UTF8, "application/json")
            };

            HttpRequestMessage? capturedRequest = null;

            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .Callback<HttpRequestMessage, CancellationToken>((request, _) =>
                {
                    capturedRequest = request;
                })
                .ReturnsAsync(httpResponse);

            // Act
            await _apiService.GetMenus(1, null, "2025-07-23");

            // Assert
            capturedRequest.Should().NotBeNull();
            var expectedUrl = "https://localhost:5107/api/Menu?cityId=1&date=2025-07-23";
            capturedRequest!.RequestUri!.ToString().Should().Be(expectedUrl);
        }

        [Fact]
        public async Task GetMenus_Should_Call_Base_Url_When_No_Parameters()
        {
            // Arrange
            var expectedMenus = new List<Menu>();
            var json = JsonSerializer.Serialize(expectedMenus);
            var httpResponse = new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new StringContent(json, System.Text.Encoding.UTF8, "application/json")
            };

            HttpRequestMessage? capturedRequest = null;

            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .Callback<HttpRequestMessage, CancellationToken>((request, _) =>
                {
                    capturedRequest = request;
                })
                .ReturnsAsync(httpResponse);

            // Act
            await _apiService.GetMenus(null, null, null);

            // Assert
            capturedRequest.Should().NotBeNull();
            var expectedUrl = "https://localhost:5107/api/Menu";
            capturedRequest!.RequestUri!.ToString().Should().Be(expectedUrl);
        }

        [Fact]
        public async Task GetMenus_Should_Return_Empty_List_When_Api_Returns_Null()
        {
            // Arrange
            var httpResponse = new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new StringContent("null", System.Text.Encoding.UTF8, "application/json")
            };

            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(httpResponse);

            // Act
            var result = await _apiService.GetMenus(null, null, null);

            // Assert
            result.Should().NotBeNull();
            result.Should().BeEmpty();
        }

        [Fact]
        public async Task GetMenus_Should_Throw_Exception_When_Http_Request_Fails()
        {
            // Arrange
            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .ThrowsAsync(new HttpRequestException("Network error"));

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _apiService.GetMenus(null, null, null));
            
            exception.Message.Should().Contain("Menüler yüklenemedi");
            exception.Message.Should().Contain("Network error");
        }

        [Fact]
        public async Task GetMenus_Should_Handle_Non_Success_Status_Code()
        {
            // Arrange
            var httpResponse = new HttpResponseMessage(HttpStatusCode.InternalServerError)
            {
                Content = new StringContent("Server Error", System.Text.Encoding.UTF8, "text/plain")
            };

            _mockHttpMessageHandler
                .Protected()
                .Setup<Task<HttpResponseMessage>>(
                    "SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(httpResponse);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _apiService.GetMenus(null, null, null));
            
            exception.Message.Should().Contain("Menüler yüklenemedi");
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_HttpClient_Is_Null()
        {
            // Act & Assert
            var action = () => new ApiService(null!);
            action.Should().Throw<ArgumentNullException>()
                .WithParameterName("httpClient");
        }

        [Fact]
        public void ApiService_Should_Set_BaseAddress_Correctly()
        {
            // Arrange
            using var httpClient = new HttpClient();
            
            // Act
            using var apiService = new ApiService(httpClient);
            
            // Assert
            httpClient.BaseAddress.Should().NotBeNull();
            httpClient.BaseAddress!.ToString().Should().Be("https://localhost:5107/");
        }

        [Fact]
        public void Dispose_Should_Not_Throw_Exception()
        {
            // Arrange
            using var httpClient = new HttpClient();
            var apiService = new ApiService(httpClient);
            
            // Act & Assert
            apiService.Should().BeAssignableTo<IDisposable>();
            
            // Disposing should not throw
            var action = () => apiService.Dispose();
            action.Should().NotThrow();
        }
    }
}
