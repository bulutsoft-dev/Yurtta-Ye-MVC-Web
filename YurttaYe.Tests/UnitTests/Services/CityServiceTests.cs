using FluentAssertions;
using Moq;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Data.Repositories;
using YurttaYe.Services;

namespace YurttaYe.Tests.UnitTests.Services
{
    public class CityServiceTests
    {
        private readonly Mock<ICityRepository> _mockCityRepository;
        private readonly CityService _cityService;

        public CityServiceTests()
        {
            _mockCityRepository = new Mock<ICityRepository>();
            _cityService = new CityService(_mockCityRepository.Object);
        }

        [Fact]
        public async Task GetAllCitiesAsync_Should_Return_Cities_From_Repository()
        {
            // Arrange
            var expectedCities = new List<City>
            {
                new City { Id = 1, Name = "İstanbul" },
                new City { Id = 2, Name = "Ankara" },
                new City { Id = 3, Name = "İzmir" }
            };

            _mockCityRepository.Setup(repo => repo.GetAllCitiesAsync())
                .ReturnsAsync(expectedCities);

            // Act
            var result = await _cityService.GetAllCitiesAsync();

            // Assert
            result.Should().BeEquivalentTo(expectedCities);
            _mockCityRepository.Verify(repo => repo.GetAllCitiesAsync(), Times.Once);
        }

        [Fact]
        public async Task GetCityByIdAsync_Should_Return_City_When_Exists()
        {
            // Arrange
            var expectedCity = new City { Id = 1, Name = "İstanbul" };
            
            _mockCityRepository.Setup(repo => repo.GetCityByIdAsync(1))
                .ReturnsAsync(expectedCity);

            // Act
            var result = await _cityService.GetCityByIdAsync(1);

            // Assert
            result.Should().BeEquivalentTo(expectedCity);
            _mockCityRepository.Verify(repo => repo.GetCityByIdAsync(1), Times.Once);
        }

        [Fact]
        public async Task GetCityByIdAsync_Should_Throw_Exception_When_City_Returns_Null()
        {
            // Arrange
            _mockCityRepository.Setup(repo => repo.GetCityByIdAsync(999))
                .ReturnsAsync((City)null!);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _cityService.GetCityByIdAsync(999));
            
            exception.Message.Should().Be("Şehir bulunamadı.");
            _mockCityRepository.Verify(repo => repo.GetCityByIdAsync(999), Times.Once);
        }

        [Fact]
        public async Task AddCityAsync_Should_Call_Repository_Add_Method()
        {
            // Arrange
            var cityToAdd = new City { Name = "Bursa" };

            _mockCityRepository.Setup(repo => repo.AddCityAsync(It.IsAny<City>()))
                .Returns(Task.CompletedTask);

            // Act
            await _cityService.AddCityAsync(cityToAdd);

            // Assert
            _mockCityRepository.Verify(repo => repo.AddCityAsync(cityToAdd), Times.Once);
        }

        [Fact]
        public async Task UpdateCityAsync_Should_Call_Repository_Update_Method()
        {
            // Arrange
            var cityToUpdate = new City { Id = 1, Name = "İstanbul Güncellendi" };

            _mockCityRepository.Setup(repo => repo.UpdateCityAsync(It.IsAny<City>()))
                .Returns(Task.CompletedTask);

            // Act
            await _cityService.UpdateCityAsync(cityToUpdate);

            // Assert
            _mockCityRepository.Verify(repo => repo.UpdateCityAsync(cityToUpdate), Times.Once);
        }

        [Fact]
        public async Task DeleteCityAsync_Should_Call_Repository_Delete_Method()
        {
            // Arrange
            var cityIdToDelete = 1;

            _mockCityRepository.Setup(repo => repo.DeleteCityAsync(It.IsAny<int>()))
                .Returns(Task.CompletedTask);

            // Act
            await _cityService.DeleteCityAsync(cityIdToDelete);

            // Assert
            _mockCityRepository.Verify(repo => repo.DeleteCityAsync(cityIdToDelete), Times.Once);
        }

        [Fact]
        public async Task UpdateCityAsync_Should_Propagate_Repository_Exception()
        {
            // Arrange
            var cityToUpdate = new City { Id = 999, Name = "Olmayan Şehir" };
            var expectedException = new Exception("Şehir bulunamadı.");

            _mockCityRepository.Setup(repo => repo.UpdateCityAsync(It.IsAny<City>()))
                .ThrowsAsync(expectedException);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _cityService.UpdateCityAsync(cityToUpdate));
            
            exception.Message.Should().Be("Şehir bulunamadı.");
            _mockCityRepository.Verify(repo => repo.UpdateCityAsync(cityToUpdate), Times.Once);
        }

        [Fact]
        public async Task GetAllCitiesAsync_Should_Return_Empty_List_When_No_Cities()
        {
            // Arrange
            var emptyCityList = new List<City>();

            _mockCityRepository.Setup(repo => repo.GetAllCitiesAsync())
                .ReturnsAsync(emptyCityList);

            // Act
            var result = await _cityService.GetAllCitiesAsync();

            // Assert
            result.Should().BeEmpty();
            _mockCityRepository.Verify(repo => repo.GetAllCitiesAsync(), Times.Once);
        }

        [Fact]
        public void CityService_Should_Implement_ICityService()
        {
            // Act & Assert
            _cityService.Should().BeAssignableTo<ICityService>();
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_Repository_Is_Null()
        {
            // Act & Assert
            var action = () => new CityService(null!);
            action.Should().Throw<ArgumentNullException>()
                .WithParameterName("cityRepository");
        }
    }
}
