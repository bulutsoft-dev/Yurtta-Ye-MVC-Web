using System;
using FluentAssertions;
using Moq;
using Xunit;
using YurttaYe.Core.Services;
using YurttaYe.Core.Services.Interfaces;
using YurttaYe.Services;

namespace YurttaYe.Tests.UnitTests.Services
{
    public class ServiceManagerTests
    {
        private readonly Mock<ICityService> _mockCityService;
        private readonly Mock<IMenuService> _mockMenuService;
        private readonly ServiceManager _serviceManager;

        public ServiceManagerTests()
        {
            _mockCityService = new Mock<ICityService>();
            _mockMenuService = new Mock<IMenuService>();
            _serviceManager = new ServiceManager(_mockCityService.Object, _mockMenuService.Object);
        }

        [Fact]
        public void ServiceManager_Should_Initialize_With_Provided_Services()
        {
            // Act & Assert
            _serviceManager.CityService.Should().NotBeNull();
            _serviceManager.MenuService.Should().NotBeNull();
            _serviceManager.CityService.Should().BeSameAs(_mockCityService.Object);
            _serviceManager.MenuService.Should().BeSameAs(_mockMenuService.Object);
        }

        [Fact]
        public void ServiceManager_Should_Implement_IServiceManager()
        {
            // Act & Assert
            _serviceManager.Should().BeAssignableTo<IServiceManager>();
        }

        [Fact]
        public void CityService_Property_Should_Return_Injected_Service()
        {
            // Act
            var cityService = _serviceManager.CityService;

            // Assert
            cityService.Should().BeSameAs(_mockCityService.Object);
        }

        [Fact]
        public void MenuService_Property_Should_Return_Injected_Service()
        {
            // Act
            var menuService = _serviceManager.MenuService;

            // Assert
            menuService.Should().BeSameAs(_mockMenuService.Object);
        }

        [Fact]
        public void ServiceManager_Should_Maintain_Service_References()
        {
            // Act
            var cityService1 = _serviceManager.CityService;
            var cityService2 = _serviceManager.CityService;
            var menuService1 = _serviceManager.MenuService;
            var menuService2 = _serviceManager.MenuService;

            // Assert - Same reference should be returned each time
            cityService1.Should().BeSameAs(cityService2);
            menuService1.Should().BeSameAs(menuService2);
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_CityService_Is_Null()
        {
            // Act & Assert
            var action = () => new ServiceManager(null!, _mockMenuService.Object);
            action.Should().Throw<ArgumentNullException>()
                .WithParameterName("cityService");
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_MenuService_Is_Null()
        {
            // Act & Assert
            var action = () => new ServiceManager(_mockCityService.Object, null!);
            action.Should().Throw<ArgumentNullException>()
                .WithParameterName("menuService");
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_Both_Services_Are_Null()
        {
            // Act & Assert
            var action = () => new ServiceManager(null!, null!);
            action.Should().Throw<ArgumentNullException>();
        }

        [Fact]
        public void ServiceManager_Properties_Should_Be_ReadOnly()
        {
            // Act & Assert
            typeof(ServiceManager).GetProperty("CityService")!.CanWrite.Should().BeFalse();
            typeof(ServiceManager).GetProperty("MenuService")!.CanWrite.Should().BeFalse();
        }

        [Fact]
        public void ServiceManager_Should_Not_Dispose_Injected_Services()
        {
            // Arrange
            var disposableCityService = new Mock<ICityService>();
            var disposableMenuService = new Mock<IMenuService>();
            
            // Act
            var serviceManager = new ServiceManager(disposableCityService.Object, disposableMenuService.Object);
            
            // Assert - ServiceManager should not implement IDisposable
            serviceManager.Should().NotBeAssignableTo<IDisposable>();
        }
    }
}
