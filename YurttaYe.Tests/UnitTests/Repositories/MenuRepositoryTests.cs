using FluentAssertions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;
using Xunit;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Data;
using YurttaYe.Data.Repositories;

namespace YurttaYe.Tests.UnitTests.Repositories
{
    public class MenuRepositoryTests : IDisposable
    {
        private readonly AppDbContext _context;
        private readonly MenuRepository _repository;

        public MenuRepositoryTests()
        {
            var options = new DbContextOptionsBuilder<AppDbContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            _context = new AppDbContext(options);
            _repository = new MenuRepository(_context);
        }

        [Fact]
        public async Task GetAllAsync_Should_Return_Empty_List_When_No_Menus()
        {
            // Act
            var result = await _repository.GetAllAsync();

            // Assert
            result.Should().NotBeNull();
            result.Should().BeEmpty();
        }

        [Fact]
        public async Task GetAllAsync_Should_Return_All_Menus_With_Includes()
        {
            // Arrange
            var city = new City { Name = "İstanbul" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            var menu = new Menu
            {
                CityId = city.Id,
                MealType = "Öğle",
                Date = DateTime.Now.Date,
                Energy = "2000 kcal",
                Items = new[]
                {
                    new MenuItem { Category = "Çorba", Name = "Mercimek Çorbası", Gram = "250ml" },
                    new MenuItem { Category = "Ana Yemek", Name = "Tavuk Döner", Gram = "150g" }
                }.ToList()
            };

            await _context.Menus.AddAsync(menu);
            await _context.SaveChangesAsync();

            // Act
            var result = await _repository.GetAllAsync();

            // Assert
            result.Should().HaveCount(1);
            var retrievedMenu = result.First();
            retrievedMenu.City.Should().NotBeNull();
            retrievedMenu.City.Name.Should().Be("İstanbul");
            retrievedMenu.Items.Should().HaveCount(2);
            retrievedMenu.Items.Should().Contain(i => i.Name == "Mercimek Çorbası");
        }

        [Fact]
        public async Task GetByIdAsync_Should_Return_Menu_When_Exists()
        {
            // Arrange
            var city = new City { Name = "Ankara" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            var menu = new Menu
            {
                CityId = city.Id,
                MealType = "Akşam",
                Date = DateTime.Now.Date,
                Energy = "2500 kcal"
            };

            await _context.Menus.AddAsync(menu);
            await _context.SaveChangesAsync();

            // Act
            var result = await _repository.GetByIdAsync(menu.Id);

            // Assert
            result.Should().NotBeNull();
            result.Id.Should().Be(menu.Id);
            result.MealType.Should().Be("Akşam");
            result.City.Should().NotBeNull();
            result.City.Name.Should().Be("Ankara");
        }

        [Fact]
        public async Task GetByIdAsync_Should_Return_Empty_Menu_When_Not_Exists()
        {
            // Act
            var result = await _repository.GetByIdAsync(999);

            // Assert
            result.Should().NotBeNull();
            result.Id.Should().Be(0);
            result.MealType.Should().Be(string.Empty);
        }

        [Fact]
        public async Task GetAsync_Should_Return_Menu_By_Criteria()
        {
            // Arrange
            var city = new City { Name = "İzmir" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            var testDate = new DateTime(2025, 7, 23);
            var menu = new Menu
            {
                CityId = city.Id,
                MealType = "Sabah",
                Date = testDate,
                Energy = "1500 kcal"
            };

            await _context.Menus.AddAsync(menu);
            await _context.SaveChangesAsync();

            // Act
            var result = await _repository.GetAsync(city.Id, "Sabah", testDate);

            // Assert
            result.Should().NotBeNull();
            result.CityId.Should().Be(city.Id);
            result.MealType.Should().Be("Sabah");
            result.Date.Date.Should().Be(testDate.Date);
        }

        [Fact]
        public async Task GetAsync_Should_Throw_Exception_When_Menu_Not_Found()
        {
            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _repository.GetAsync(999, "Öğle", DateTime.Now));
            
            exception.Message.Should().Be("Menü bulunamadı.");
        }

        [Fact]
        public async Task AddAsync_Should_Add_Menu_Successfully()
        {
            // Arrange
            var city = new City { Name = "Bursa" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            var menu = new Menu
            {
                CityId = city.Id,
                MealType = "Öğle",
                Date = DateTime.Now.Date,
                Energy = "2200 kcal",
                Items = new[]
                {
                    new MenuItem { Category = "Çorba", Name = "Domates Çorbası", Gram = "250ml" }
                }.ToList()
            };

            // Act
            await _repository.AddAsync(menu);

            // Assert
            var savedMenu = await _context.Menus
                .Include(m => m.Items)
                .FirstOrDefaultAsync(m => m.Id == menu.Id);
            
            savedMenu.Should().NotBeNull();
            savedMenu!.MealType.Should().Be("Öğle");
            savedMenu.Energy.Should().Be("2200 kcal");
            savedMenu.Items.Should().HaveCount(1);
            savedMenu.Items.First().Name.Should().Be("Domates Çorbası");
        }

        [Fact]
        public async Task UpdateAsync_Should_Update_Existing_Menu()
        {
            // Arrange
            var city = new City { Name = "Antalya" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            var originalMenu = new Menu
            {
                CityId = city.Id,
                MealType = "Öğle",
                Date = DateTime.Now.Date,
                Energy = "2000 kcal",
                Items = new[]
                {
                    new MenuItem { Category = "Çorba", Name = "Eski Çorba", Gram = "250ml" }
                }.ToList()
            };

            await _context.Menus.AddAsync(originalMenu);
            await _context.SaveChangesAsync();

            var updatedMenu = new Menu
            {
                Id = originalMenu.Id,
                CityId = city.Id,
                MealType = "Akşam",
                Date = DateTime.Now.Date.AddDays(1),
                Energy = "2800 kcal",
                Items = new[]
                {
                    new MenuItem { Category = "Çorba", Name = "Yeni Çorba", Gram = "300ml" },
                    new MenuItem { Category = "Ana Yemek", Name = "Yeni Ana Yemek", Gram = "200g" }
                }.ToList()
            };

            // Act
            await _repository.UpdateAsync(updatedMenu);

            // Assert
            var result = await _context.Menus
                .Include(m => m.Items)
                .FirstOrDefaultAsync(m => m.Id == originalMenu.Id);

            result.Should().NotBeNull();
            result!.MealType.Should().Be("Akşam");
            result.Energy.Should().Be("2800 kcal");
            result.Items.Should().HaveCount(2);
            result.Items.Should().Contain(i => i.Name == "Yeni Çorba");
            result.Items.Should().Contain(i => i.Name == "Yeni Ana Yemek");
            result.Items.Should().NotContain(i => i.Name == "Eski Çorba");
        }

        [Fact]
        public async Task UpdateAsync_Should_Throw_Exception_When_Menu_Not_Exists()
        {
            // Arrange
            var nonExistentMenu = new Menu 
            { 
                Id = 999, 
                MealType = "Olmayan Menü" 
            };

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _repository.UpdateAsync(nonExistentMenu));
            
            exception.Message.Should().Be("Menü bulunamadı.");
        }

        [Fact]
        public async Task DeleteAsync_Should_Delete_Existing_Menu()
        {
            // Arrange
            var city = new City { Name = "Trabzon" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            var menu = new Menu
            {
                CityId = city.Id,
                MealType = "Silinecek",
                Date = DateTime.Now.Date,
                Energy = "1000 kcal"
            };

            await _context.Menus.AddAsync(menu);
            await _context.SaveChangesAsync();
            var menuId = menu.Id;

            // Act
            await _repository.DeleteAsync(menuId);

            // Assert
            var deletedMenu = await _context.Menus.FindAsync(menuId);
            deletedMenu.Should().BeNull();
        }

        [Fact]
        public async Task DeleteAsync_Should_Not_Throw_When_Menu_Not_Exists()
        {
            // Act & Assert
            var act = async () => await _repository.DeleteAsync(999);
            await act.Should().NotThrowAsync();
        }

        [Fact]
        public async Task GetRecentMenusAsync_Should_Return_Recent_Menus_Ordered_By_Date()
        {
            // Arrange
            var city = new City { Name = "Eskişehir" };
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();

            var menus = new[]
            {
                new Menu { CityId = city.Id, MealType = "Öğle", Date = DateTime.Now.Date.AddDays(-3), Energy = "2000 kcal" },
                new Menu { CityId = city.Id, MealType = "Akşam", Date = DateTime.Now.Date.AddDays(-1), Energy = "2500 kcal" },
                new Menu { CityId = city.Id, MealType = "Sabah", Date = DateTime.Now.Date, Energy = "1500 kcal" },
                new Menu { CityId = city.Id, MealType = "Öğle", Date = DateTime.Now.Date.AddDays(-2), Energy = "2200 kcal" }
            };

            await _context.Menus.AddRangeAsync(menus);
            await _context.SaveChangesAsync();

            // Act
            var result = await _repository.GetRecentMenusAsync(2);

            // Assert
            result.Should().HaveCount(2);
            result.First().Date.Should().Be(DateTime.Now.Date); // En yeni
            result.Last().Date.Should().Be(DateTime.Now.Date.AddDays(-1)); // İkinci en yeni
        }

        public void Dispose()
        {
            _context?.Dispose();
        }
    }
}
