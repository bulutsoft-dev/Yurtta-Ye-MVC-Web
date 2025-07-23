using FluentAssertions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;
using Xunit;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Data;
using YurttaYe.Data.Repositories;

namespace YurttaYe.Tests.UnitTests.Repositories
{
    public class CityRepositoryTests : IDisposable
    {
        private readonly AppDbContext _context;
        private readonly CityRepository _repository;

        public CityRepositoryTests()
        {
            var options = new DbContextOptionsBuilder<AppDbContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            _context = new AppDbContext(options);
            _repository = new CityRepository(_context);
        }

        [Fact]
        public async Task GetAllCitiesAsync_Should_Return_Empty_List_When_No_Cities()
        {
            // Act
            var result = await _repository.GetAllCitiesAsync();

            // Assert
            result.Should().NotBeNull();
            result.Should().BeEmpty();
        }

        [Fact]
        public async Task GetAllCitiesAsync_Should_Return_All_Cities()
        {
            // Arrange
            var cities = new[]
            {
                new City { Name = "İstanbul" },
                new City { Name = "Ankara" },
                new City { Name = "İzmir" }
            };

            await _context.Cities.AddRangeAsync(cities);
            await _context.SaveChangesAsync();

            // Act
            var result = await _repository.GetAllCitiesAsync();

            // Assert
            result.Should().HaveCount(3);
            result.Should().Contain(c => c.Name == "İstanbul");
            result.Should().Contain(c => c.Name == "Ankara");
            result.Should().Contain(c => c.Name == "İzmir");
        }

        [Fact]
        public async Task GetCityByIdAsync_Should_Return_City_When_Exists()
        {
            // Arrange
            var city = new City { Name = "İstanbul" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            // Act
            var result = await _repository.GetCityByIdAsync(city.Id);

            // Assert
            result.Should().NotBeNull();
            result.Id.Should().Be(city.Id);
            result.Name.Should().Be("İstanbul");
        }

        [Fact]
        public async Task GetCityByIdAsync_Should_Return_Empty_City_When_Not_Exists()
        {
            // Act
            var result = await _repository.GetCityByIdAsync(999);

            // Assert
            result.Should().NotBeNull();
            result.Id.Should().Be(0);
            result.Name.Should().Be(string.Empty);
        }

        [Fact]
        public async Task AddCityAsync_Should_Add_City_Successfully()
        {
            // Arrange
            var city = new City { Name = "Bursa" };

            // Act
            await _repository.AddCityAsync(city);

            // Assert
            var savedCity = await _context.Cities.FindAsync(city.Id);
            savedCity.Should().NotBeNull();
            savedCity!.Name.Should().Be("Bursa");
            savedCity.Id.Should().BeGreaterThan(0);
        }

        [Fact]
        public async Task UpdateCityAsync_Should_Update_Existing_City()
        {
            // Arrange
            var city = new City { Name = "İstanbul" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            city.Name = "İstanbul Güncellendi";

            // Act
            await _repository.UpdateCityAsync(city);

            // Assert
            var updatedCity = await _context.Cities.FindAsync(city.Id);
            updatedCity.Should().NotBeNull();
            updatedCity!.Name.Should().Be("İstanbul Güncellendi");
        }

        [Fact]
        public async Task UpdateCityAsync_Should_Throw_Exception_When_City_Not_Exists()
        {
            // Arrange
            var nonExistentCity = new City { Id = 999, Name = "Olmayan Şehir" };

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _repository.UpdateCityAsync(nonExistentCity));
            
            exception.Message.Should().Be("Şehir bulunamadı.");
        }

        [Fact]
        public async Task DeleteCityAsync_Should_Delete_Existing_City()
        {
            // Arrange
            var city = new City { Name = "Silinecek Şehir" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();
            var cityId = city.Id;

            // Act
            await _repository.DeleteCityAsync(cityId);

            // Assert
            var deletedCity = await _context.Cities.FindAsync(cityId);
            deletedCity.Should().BeNull();
        }

        [Fact]
        public async Task DeleteCityAsync_Should_Not_Throw_When_City_Not_Exists()
        {
            // Act & Assert
            var act = async () => await _repository.DeleteCityAsync(999);
            await act.Should().NotThrowAsync();
        }

        [Fact]
        public async Task AddCityAsync_Should_Generate_Auto_Increment_Id()
        {
            // Arrange
            var city1 = new City { Name = "Şehir 1" };
            var city2 = new City { Name = "Şehir 2" };

            // Act
            await _repository.AddCityAsync(city1);
            await _repository.AddCityAsync(city2);

            // Assert
            city1.Id.Should().BeGreaterThan(0);
            city2.Id.Should().BeGreaterThan(0);
            city2.Id.Should().BeGreaterThan(city1.Id);
        }

        public void Dispose()
        {
            _context?.Dispose();
        }
    }
}
