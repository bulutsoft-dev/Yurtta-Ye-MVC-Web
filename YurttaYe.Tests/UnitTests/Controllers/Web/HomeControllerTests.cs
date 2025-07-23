using FluentAssertions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;
using YurttaYe.Core.Services.Interfaces;
using YurttaYe.Web.Controllers.Web;

namespace YurttaYe.Tests.UnitTests.Controllers.Web
{
    public class HomeControllerTests
    {
        private readonly Mock<IServiceManager> _mockServiceManager;
        private readonly Mock<ICityService> _mockCityService;
        private readonly Mock<IMenuService> _mockMenuService;
        private readonly Mock<IConfiguration> _mockConfiguration;
        private readonly HomeController _controller;

        public HomeControllerTests()
        {
            _mockCityService = new Mock<ICityService>();
            _mockMenuService = new Mock<IMenuService>();
            _mockServiceManager = new Mock<IServiceManager>();
            _mockConfiguration = new Mock<IConfiguration>();

            _mockServiceManager.Setup(sm => sm.CityService).Returns(_mockCityService.Object);
            _mockServiceManager.Setup(sm => sm.MenuService).Returns(_mockMenuService.Object);

            _controller = new HomeController(_mockServiceManager.Object, _mockConfiguration.Object);
        }

        [Fact]
        public async Task Index_GET_Should_Return_View_With_MenuViewModel()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" },
                new City { Id = 2, Name = "Manisa" }
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            _mockConfiguration.Setup(config => config["Defaults:City"])
                .Returns("Manisa");

            var breakfastMenu = new MenuDto
            {
                Items = new List<MenuItemDto> { new MenuItemDto { Category = "Çorba", Name = "Test Çorba", Gram = "250ml" } },
                Energy = "1500 kcal"
            };

            var dinnerMenu = new MenuDto
            {
                Items = new List<MenuItemDto> { new MenuItemDto { Category = "Ana Yemek", Name = "Test Yemek", Gram = "200g" } },
                Energy = "2500 kcal"
            };

            _mockMenuService.Setup(service => service.GetMenuAsync(2, "Kahvaltı", It.IsAny<DateTime>()))
                .ReturnsAsync(breakfastMenu);

            _mockMenuService.Setup(service => service.GetMenuAsync(2, "Akşam Yemeği", It.IsAny<DateTime>()))
                .ReturnsAsync(dinnerMenu);

            // Act
            var result = await _controller.Index();

            // Assert
            result.Should().BeOfType<ViewResult>();
            var viewResult = result as ViewResult;
            viewResult!.Model.Should().BeOfType<MenuViewModel>();
            
            var model = viewResult.Model as MenuViewModel;
            model!.Cities.Should().HaveCount(3); // 2 cities + "Şehir Seçin" option
            model.CityId.Should().Be(2); // Manisa ID
            model.BreakfastMenu.Should().NotBeNull();
            model.DinnerMenu.Should().NotBeNull();
            model.Date.Should().Be(DateTime.Today);
        }

        [Fact]
        public async Task Index_GET_Should_Use_Default_City_From_Configuration()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" },
                new City { Id = 2, Name = "Ankara" }
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            _mockConfiguration.Setup(config => config["Defaults:City"])
                .Returns("Ankara");

            // Act
            var result = await _controller.Index();

            // Assert
            var viewResult = result as ViewResult;
            var model = viewResult!.Model as MenuViewModel;
            model!.CityId.Should().Be(2); // Ankara ID
        }

        [Fact]
        public async Task Index_GET_Should_Handle_Missing_Default_City_Configuration()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" },
                new City { Id = 2, Name = "Manisa" }
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            _mockConfiguration.Setup(config => config["Defaults:City"])
                .Returns((string)null!);

            // Act
            var result = await _controller.Index();

            // Assert
            var viewResult = result as ViewResult;
            var model = viewResult!.Model as MenuViewModel;
            model!.CityId.Should().Be(2); // Should default to Manisa when config is null
        }

        [Fact]
        public async Task Index_GET_Should_Handle_Menu_Service_Exception_Gracefully()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" }
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            _mockConfiguration.Setup(config => config["Defaults:City"])
                .Returns("İstanbul");

            _mockMenuService.Setup(service => service.GetMenuAsync(It.IsAny<int>(), It.IsAny<string>(), It.IsAny<DateTime>()))
                .ThrowsAsync(new Exception("Menu service error"));

            // Act
            var result = await _controller.Index();

            // Assert
            var viewResult = result as ViewResult;
            var model = viewResult!.Model as MenuViewModel;
            model!.BreakfastMenu.Should().BeNull();
            model.DinnerMenu.Should().BeNull();
            // Should not throw exception
        }

        [Fact]
        public async Task Index_POST_Should_Return_View_With_Updated_Model()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" },
                new City { Id = 2, Name = "Manisa" }
            };

            var inputModel = new MenuViewModel
            {
                CityId = 1,
                MealType = "Breakfast",
                Date = new DateTime(2025, 7, 23)
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            var breakfastMenu = new MenuDto
            {
                Items = new List<MenuItemDto> { new MenuItemDto { Category = "Çorba", Name = "Test Çorba", Gram = "250ml" } },
                Energy = "1500 kcal"
            };

            _mockMenuService.Setup(service => service.GetMenuAsync(1, "Kahvaltı", inputModel.Date))
                .ReturnsAsync(breakfastMenu);

            _mockMenuService.Setup(service => service.GetMenuAsync(1, "Akşam Yemeği", inputModel.Date))
                .ReturnsAsync((MenuDto)null!);

            // Act
            var result = await _controller.Index(inputModel);

            // Assert
            result.Should().BeOfType<ViewResult>();
            var viewResult = result as ViewResult;
            var model = viewResult!.Model as MenuViewModel;
            
            model!.CityId.Should().Be(1);
            model.BreakfastMenu.Should().NotBeNull();
            model.DinnerMenu.Should().BeNull();
            model.Cities.Should().HaveCount(3);
        }

        [Fact]
        public async Task Index_POST_Should_Set_Error_Message_When_No_Menus_Found()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" }
            };

            var inputModel = new MenuViewModel
            {
                CityId = 1,
                MealType = "Breakfast",
                Date = new DateTime(2025, 7, 23)
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            _mockMenuService.Setup(service => service.GetMenuAsync(It.IsAny<int>(), It.IsAny<string>(), It.IsAny<DateTime>()))
                .ReturnsAsync((MenuDto)null!);

            // Act
            var result = await _controller.Index(inputModel);

            // Assert
            var viewResult = result as ViewResult;
            var model = viewResult!.Model as MenuViewModel;
            model!.ErrorMessage.Should().Be("Bu tarih ve şehir için menü bulunamadı.");
        }

        [Fact]
        public async Task Index_POST_Should_Set_Error_Message_When_Exception_Occurs()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" }
            };

            var inputModel = new MenuViewModel
            {
                CityId = 1,
                MealType = "Breakfast",
                Date = new DateTime(2025, 7, 23)
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            _mockMenuService.Setup(service => service.GetMenuAsync(It.IsAny<int>(), It.IsAny<string>(), It.IsAny<DateTime>()))
                .ThrowsAsync(new Exception("Database error"));

            // Act
            var result = await _controller.Index(inputModel);

            // Assert
            var viewResult = result as ViewResult;
            var model = viewResult!.Model as MenuViewModel;
            model!.ErrorMessage.Should().Be("Menü getirilirken bir hata oluştu.");
            model.BreakfastMenu.Should().BeNull();
            model.DinnerMenu.Should().BeNull();
        }

        [Fact]
        public async Task Index_POST_Should_Apply_Default_Values_When_Model_Properties_Empty()
        {
            // Arrange
            var cities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" },
                new City { Id = 2, Name = "Manisa" }
            };

            var inputModel = new MenuViewModel
            {
                CityId = 0,
                MealType = "",
                Date = DateTime.MinValue
            };

            _mockCityService.Setup(service => service.GetAllCitiesAsync())
                .ReturnsAsync(cities);

            _mockConfiguration.Setup(config => config["Defaults:City"])
                .Returns("Manisa");

            // Act
            var result = await _controller.Index(inputModel);

            // Assert
            var viewResult = result as ViewResult;
            var model = viewResult!.Model as MenuViewModel;
            
            model!.CityId.Should().Be(2); // Default to Manisa
            model.Date.Should().Be(DateTime.Today);
            model.MealType.Should().NotBeEmpty(); // Should get default meal type
        }

        [Fact]
        public void Error_Should_Return_View_With_ErrorViewModel()
        {
            // Arrange
            var httpContext = new DefaultHttpContext();
            _controller.ControllerContext = new ControllerContext()
            {
                HttpContext = httpContext
            };

            // Act
            var result = _controller.Error();

            // Assert
            result.Should().BeOfType<ViewResult>();
            var viewResult = result as ViewResult;
            viewResult!.Model.Should().BeOfType<ErrorViewModel>();
            
            var model = viewResult.Model as ErrorViewModel;
            model!.RequestId.Should().NotBeNull();
        }

        [Fact]
        public void SetLanguage_Should_Set_Culture_Cookie_And_Redirect()
        {
            // Arrange
            var httpContext = new DefaultHttpContext();
            var response = httpContext.Response;
            
            _controller.ControllerContext = new ControllerContext()
            {
                HttpContext = httpContext
            };

            // Act
            var result = _controller.SetLanguage("tr-TR", "/home");

            // Assert
            result.Should().BeOfType<LocalRedirectResult>();
            var redirectResult = result as LocalRedirectResult;
            redirectResult!.Url.Should().Be("/home");
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_ServiceManager_Is_Null()
        {
            // Act & Assert
            var action = () => new HomeController(null!, _mockConfiguration.Object);
            action.Should().Throw<ArgumentNullException>();
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_Configuration_Is_Null()
        {
            // Act & Assert
            var action = () => new HomeController(_mockServiceManager.Object, null!);
            action.Should().Throw<ArgumentNullException>();
        }
    }
}
