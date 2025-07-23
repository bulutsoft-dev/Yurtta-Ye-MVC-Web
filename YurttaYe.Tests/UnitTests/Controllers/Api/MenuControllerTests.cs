using FluentAssertions;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System;
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
    public class MenuControllerTests
    {
        private readonly Mock<IServiceManager> _mockServiceManager;
        private readonly Mock<IMenuService> _mockMenuService;
        private readonly MenuController _controller;

        public MenuControllerTests()
        {
            _mockMenuService = new Mock<IMenuService>();
            _mockServiceManager = new Mock<IServiceManager>();
            _mockServiceManager.Setup(sm => sm.MenuService).Returns(_mockMenuService.Object);
            _controller = new MenuController(_mockServiceManager.Object);
        }

        [Fact]
        public async Task GetAll_Should_Return_Ok_With_MenuDtos_When_Menus_Exist()
        {
            // Arrange
            var menus = new List<Menu>
            {
                new Menu 
                { 
                    Id = 1, 
                    CityId = 1, 
                    MealType = "Öğle", 
                    Date = new DateTime(2025, 7, 23), 
                    Energy = "2000 kcal",
                    Items = new List<MenuItem>
                    {
                        new MenuItem { Category = "Çorba", Name = "Mercimek Çorbası", Gram = "250ml" }
                    }
                }
            };

            _mockMenuService.Setup(service => service.GetAllMenusAsync())
                .ReturnsAsync(menus);

            // Act
            var result = await _controller.GetAll(null, null, null);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<MenuDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().HaveCount(1);
            var dto = returnedDtos!.First();
            dto.Id.Should().Be(1);
            dto.CityId.Should().Be(1);
            dto.MealType.Should().Be("Öğle");
            dto.Date.Should().Be("2025-07-23");
            dto.Energy.Should().Be("2000 kcal");
            dto.Items.Should().HaveCount(1);
            dto.Items.First().Name.Should().Be("Mercimek Çorbası");

            _mockMenuService.Verify(service => service.GetAllMenusAsync(), Times.Once);
        }

        [Fact]
        public async Task GetAll_Should_Filter_By_CityId_When_Provided()
        {
            // Arrange
            var menus = new List<Menu>
            {
                new Menu { Id = 1, CityId = 1, MealType = "Öğle", Date = DateTime.Now, Energy = "2000 kcal", Items = new List<MenuItem>() },
                new Menu { Id = 2, CityId = 2, MealType = "Akşam", Date = DateTime.Now, Energy = "2500 kcal", Items = new List<MenuItem>() }
            };

            _mockMenuService.Setup(service => service.GetAllMenusAsync())
                .ReturnsAsync(menus);

            // Act
            var result = await _controller.GetAll(cityId: 1, mealType: null, date: null);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<MenuDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().HaveCount(1);
            returnedDtos!.First().CityId.Should().Be(1);
        }

        [Fact]
        public async Task GetAll_Should_Filter_By_MealType_When_Provided()
        {
            // Arrange
            var menus = new List<Menu>
            {
                new Menu { Id = 1, CityId = 1, MealType = "Öğle", Date = DateTime.Now, Energy = "2000 kcal", Items = new List<MenuItem>() },
                new Menu { Id = 2, CityId = 1, MealType = "Akşam", Date = DateTime.Now, Energy = "2500 kcal", Items = new List<MenuItem>() }
            };

            _mockMenuService.Setup(service => service.GetAllMenusAsync())
                .ReturnsAsync(menus);

            // Act
            var result = await _controller.GetAll(cityId: null, mealType: "Öğle", date: null);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<MenuDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().HaveCount(1);
            returnedDtos!.First().MealType.Should().Be("Öğle");
        }

        [Fact]
        public async Task GetAll_Should_Filter_By_Date_When_Provided()
        {
            // Arrange
            var testDate = new DateTime(2025, 7, 23);
            var menus = new List<Menu>
            {
                new Menu { Id = 1, CityId = 1, MealType = "Öğle", Date = testDate, Energy = "2000 kcal", Items = new List<MenuItem>() },
                new Menu { Id = 2, CityId = 1, MealType = "Akşam", Date = testDate.AddDays(1), Energy = "2500 kcal", Items = new List<MenuItem>() }
            };

            _mockMenuService.Setup(service => service.GetAllMenusAsync())
                .ReturnsAsync(menus);

            // Act
            var result = await _controller.GetAll(cityId: null, mealType: null, date: "2025-07-23");

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<MenuDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().HaveCount(1);
            DateTime.Parse(returnedDtos!.First().Date).Date.Should().Be(testDate.Date);
        }

        [Fact]
        public async Task GetAll_Should_Apply_Multiple_Filters_When_Provided()
        {
            // Arrange
            var testDate = new DateTime(2025, 7, 23);
            var menus = new List<Menu>
            {
                new Menu { Id = 1, CityId = 1, MealType = "Öğle", Date = testDate, Energy = "2000 kcal", Items = new List<MenuItem>() },
                new Menu { Id = 2, CityId = 1, MealType = "Akşam", Date = testDate, Energy = "2500 kcal", Items = new List<MenuItem>() },
                new Menu { Id = 3, CityId = 2, MealType = "Öğle", Date = testDate, Energy = "2200 kcal", Items = new List<MenuItem>() }
            };

            _mockMenuService.Setup(service => service.GetAllMenusAsync())
                .ReturnsAsync(menus);

            // Act
            var result = await _controller.GetAll(cityId: 1, mealType: "Öğle", date: "2025-07-23");

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<MenuDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().HaveCount(1);
            var dto = returnedDtos!.First();
            dto.CityId.Should().Be(1);
            dto.MealType.Should().Be("Öğle");
            DateTime.Parse(dto.Date).Date.Should().Be(testDate.Date);
        }

        [Fact]
        public async Task GetAll_Should_Return_Empty_List_When_No_Menus_Match_Filter()
        {
            // Arrange
            var menus = new List<Menu>
            {
                new Menu { Id = 1, CityId = 1, MealType = "Öğle", Date = DateTime.Now, Energy = "2000 kcal", Items = new List<MenuItem>() }
            };

            _mockMenuService.Setup(service => service.GetAllMenusAsync())
                .ReturnsAsync(menus);

            // Act
            var result = await _controller.GetAll(cityId: 999, mealType: null, date: null);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<MenuDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().BeEmpty();
        }

        [Fact]
        public async Task GetAll_Should_Handle_Invalid_Date_Format_Gracefully()
        {
            // Arrange
            var menus = new List<Menu>
            {
                new Menu { Id = 1, CityId = 1, MealType = "Öğle", Date = DateTime.Now, Energy = "2000 kcal", Items = new List<MenuItem>() }
            };

            _mockMenuService.Setup(service => service.GetAllMenusAsync())
                .ReturnsAsync(menus);

            // Act
            var result = await _controller.GetAll(cityId: null, mealType: null, date: "invalid-date");

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<MenuDto>;
            
            returnedDtos.Should().NotBeNull();
            returnedDtos.Should().HaveCount(1); // No date filtering applied due to invalid format
        }

        [Fact]
        public async Task GetAll_Should_Map_MenuItems_Correctly()
        {
            // Arrange
            var menus = new List<Menu>
            {
                new Menu 
                { 
                    Id = 1, 
                    CityId = 1, 
                    MealType = "Öğle", 
                    Date = DateTime.Now, 
                    Energy = "2000 kcal",
                    Items = new List<MenuItem>
                    {
                        new MenuItem { Category = "Çorba", Name = "Mercimek Çorbası", Gram = "250ml" },
                        new MenuItem { Category = "Ana Yemek", Name = "Tavuk Döner", Gram = "150g" }
                    }
                }
            };

            _mockMenuService.Setup(service => service.GetAllMenusAsync())
                .ReturnsAsync(menus);

            // Act
            var result = await _controller.GetAll(null, null, null);

            // Assert
            result.Should().BeOfType<OkObjectResult>();
            var okResult = result as OkObjectResult;
            var returnedDtos = okResult!.Value as IEnumerable<MenuDto>;
            var dto = returnedDtos!.First();
            
            dto.Items.Should().HaveCount(2);
            dto.Items.Should().Contain(item => item.Category == "Çorba" && item.Name == "Mercimek Çorbası" && item.Gram == "250ml");
            dto.Items.Should().Contain(item => item.Category == "Ana Yemek" && item.Name == "Tavuk Döner" && item.Gram == "150g");
        }

        [Fact]
        public void Controller_Should_Have_ApiController_Attribute()
        {
            // Assert
            var controllerType = typeof(MenuController);
            controllerType.Should().BeDecoratedWith<ApiControllerAttribute>();
        }

        [Fact]
        public void Controller_Should_Have_Route_Attribute()
        {
            // Assert
            var controllerType = typeof(MenuController);
            controllerType.Should().BeDecoratedWith<RouteAttribute>(attr => 
                attr.Template == "api/[controller]");
        }

        [Fact]
        public void GetAll_Should_Have_HttpGet_Attribute()
        {
            // Assert
            var method = typeof(MenuController).GetMethod(nameof(MenuController.GetAll));
            method.Should().BeDecoratedWith<HttpGetAttribute>();
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_ServiceManager_Is_Null()
        {
            // Act & Assert
            var action = () => new MenuController(null!);
            action.Should().Throw<ArgumentNullException>()
                .WithParameterName("serviceManager");
        }
    }
}
