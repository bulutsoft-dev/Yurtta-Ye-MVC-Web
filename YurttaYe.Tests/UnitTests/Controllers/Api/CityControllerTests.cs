using FluentAssertions;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Services;
using YurttaYe.Core.Services.Interfaces;
using YurttaYe.Web.Controllers.Api;

namespace YurttaYe.Tests.UnitTests.Controllers.Api
{
    public class CityControllerTests
    {
        private readonly Mock<IServiceManager> _mockServiceManager;
        private readonly Mock<ICityService> _mockCityService;
        private readonly CityController _controller;

        public CityControllerTests()
        {
            _mockCityService = new Mock<ICityService>();
            _mockServiceManager = new Mock<IServiceManager>();
            _mockServiceManager.Setup(sm => sm.CityService).Returns(_mockCityService.Object);
            _controller = new CityController(_mockServiceManager.Object);
        }

        [Fact]
        public async Task GetAll_Should_Return_Ok_With_CityDtos_When_Cities_Exist()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" },
                new City { Id = 2, Name = "Ankara" },
                new City { Id = 3, Name = "İzmir" }
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            // Act
            var result = await _controller.GetAll();

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<CityDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().HaveCount(3);
            returnedDtos.Should().Contain(dto => dto.Id == 1 && dto.Name == "İstanbul");
            returnedDtos.Should().Contain(dto => dto.Id == 2 && dto.Name == "Ankara");
            returnedDtos.Should().Contain(dto => dto.Id == 3 && dto.Name == "İzmir");

            _mockCityService.Verify(service => service.GetAllCitiesAsync(), Times.Once);
        }

        [Fact]
        public async Task GetAll_Should_Return_Ok_With_Empty_List_When_No_Cities()
        {
            // Arrange
            var cities = new List<City>();

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            // Act
            var result = await _controller.GetAll();

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<CityDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().BeEmpty();

            _mockCityService.Verify(service => service.GetAllCitiesAsync(), Times.Once);
        }

        [Fact]
        public async Task GetAll_Should_Map_City_To_CityDto_Correctly()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 42, Name = "Test Şehir" }
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            // Act
            var result = await _controller.GetAll();

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<CityDto>;
            var dto = returnedDtos!.First();
            
            dto.Id.Should().Be(42);
            dto.Name.Should().Be("Test Şehir");
        }

        [Fact]
        public void Controller_Should_Have_ApiController_Attribute()
        {
            // Assert
            var controllerType = typeof(CityController);
            controllerType.Should().BeDecoratedWith<ApiControllerAttribute>();
        }

        [Fact]
        public void Controller_Should_Have_Route_Attribute()
        {
            // Assert
            var controllerType = typeof(CityController);
            controllerType.Should().BeDecoratedWith<RouteAttribute>(attr => 
                attr.Template == "api/[controller]");
        }

        [Fact]
        public void GetAll_Should_Have_HttpGet_Attribute()
        {
            // Assert
            var method = typeof(CityController).GetMethod(nameof(CityController.GetAll));
            method.Should().BeDecoratedWith<HttpGetAttribute>();
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_ServiceManager_Is_Null()
        {
            // Act & Assert
            var action = () => new CityController(null!);
            action.Should().Throw<ArgumentNullException>()
                .WithParameterName("serviceManager");
        }
    }
}
