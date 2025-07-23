using FluentAssertions;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Data.Repositories;
using YurttaYe.Services;

namespace YurttaYe.Tests.UnitTests.Services
{
    public class MenuServiceTests
    {
        private readonly Mock<IMenuRepository> _mockMenuRepository;
        private readonly MenuService _menuService;

        public MenuServiceTests()
        {
            _mockMenuRepository = new Mock<IMenuRepository>();
            _menuService = new MenuService(_mockMenuRepository.Object);
        }

        [Fact]
        public async Task GetMenuAsync_Should_Return_MenuDto_When_Menu_Exists()
        {
            // Arrange
            var testDate = new DateTime(2025, 7, 23);
            var menu = new Menu
            {
                Id = 1,
                CityId = 1,
                MealType = "Öğle",
                Date = testDate,
                Energy = "2000 kcal",
                Items = new List<MenuItem>
                {
                    new MenuItem { Category = "Çorba", Name = "Mercimek Çorbası", Gram = "250ml" },
                    new MenuItem { Category = "Ana Yemek", Name = "Tavuk Döner", Gram = "150g" }
                }
            };

            _mockMenuRepository.Setup(repo => repo.GetAsync(1, "Öğle", testDate))
                .ReturnsAsync(menu);

            // Act
            var result = await _menuService.GetMenuAsync(1, "Öğle", testDate);

            // Assert
            result.Should().NotBeNull();
            result.Id.Should().Be(1);
            result.CityId.Should().Be(1);
            result.MealType.Should().Be("Öğle");
            result.Date.Should().Be("2025-07-23");
            result.Energy.Should().Be("2000 kcal");
            result.Items.Should().HaveCount(2);
            result.Items.First().Name.Should().Be("Mercimek Çorbası");
            
            _mockMenuRepository.Verify(repo => repo.GetAsync(1, "Öğle", testDate), Times.Once);
        }

        [Fact]
        public async Task GetMenuAsync_Should_Return_Null_When_Menu_Not_Exists()
        {
            // Arrange
            var testDate = new DateTime(2025, 7, 23);

            _mockMenuRepository.Setup(repo => repo.GetAsync(999, "Öğle", testDate))
                .ReturnsAsync((Menu)null!);

            // Act
            var result = await _menuService.GetMenuAsync(999, "Öğle", testDate);

            // Assert
            result.Should().BeNull();
            _mockMenuRepository.Verify(repo => repo.GetAsync(999, "Öğle", testDate), Times.Once);
        }

        [Fact]
        public async Task GetMenuByIdAsync_Should_Return_Menu_When_Exists()
        {
            // Arrange
            var expectedMenu = new Menu
            {
                Id = 1,
                CityId = 1,
                MealType = "Akşam",
                Energy = "2500 kcal"
            };

            _mockMenuRepository.Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(expectedMenu);

            // Act
            var result = await _menuService.GetMenuByIdAsync(1);

            // Assert
            result.Should().BeEquivalentTo(expectedMenu);
            _mockMenuRepository.Verify(repo => repo.GetByIdAsync(1), Times.Once);
        }

        [Fact]
        public async Task GetMenuByIdAsync_Should_Throw_Exception_When_Menu_Returns_Null()
        {
            // Arrange
            _mockMenuRepository.Setup(repo => repo.GetByIdAsync(999))
                .ReturnsAsync((Menu)null!);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _menuService.GetMenuByIdAsync(999));
            
            exception.Message.Should().Be("Menü bulunamadı.");
            _mockMenuRepository.Verify(repo => repo.GetByIdAsync(999), Times.Once);
        }

        [Fact]
        public async Task GetAllMenusAsync_Should_Return_All_Menus()
        {
            // Arrange
            var expectedMenus = new List<Menu>
            {
                new Menu { Id = 1, MealType = "Sabah", Energy = "1500 kcal" },
                new Menu { Id = 2, MealType = "Öğle", Energy = "2000 kcal" },
                new Menu { Id = 3, MealType = "Akşam", Energy = "2500 kcal" }
            };

            _mockMenuRepository.Setup(repo => repo.GetAllAsync())
                .ReturnsAsync(expectedMenus);

            // Act
            var result = await _menuService.GetAllMenusAsync();

            // Assert
            result.Should().BeEquivalentTo(expectedMenus);
            _mockMenuRepository.Verify(repo => repo.GetAllAsync(), Times.Once);
        }

        [Fact]
        public async Task AddMenuAsync_Should_Call_Repository_Add_Method()
        {
            // Arrange
            var menuToAdd = new Menu
            {
                CityId = 1,
                MealType = "Öğle",
                Date = DateTime.Now,
                Energy = "2200 kcal"
            };

            _mockMenuRepository.Setup(repo => repo.AddAsync(It.IsAny<Menu>()))
                .Returns(Task.CompletedTask);

            // Act
            await _menuService.AddMenuAsync(menuToAdd);

            // Assert
            _mockMenuRepository.Verify(repo => repo.AddAsync(menuToAdd), Times.Once);
        }

        [Fact]
        public async Task UpdateMenuAsync_Should_Call_Repository_Update_Method()
        {
            // Arrange
            var menuToUpdate = new Menu
            {
                Id = 1,
                CityId = 1,
                MealType = "Akşam",
                Energy = "2800 kcal"
            };

            _mockMenuRepository.Setup(repo => repo.UpdateAsync(It.IsAny<Menu>()))
                .Returns(Task.CompletedTask);

            // Act
            await _menuService.UpdateMenuAsync(menuToUpdate);

            // Assert
            _mockMenuRepository.Verify(repo => repo.UpdateAsync(menuToUpdate), Times.Once);
        }

        [Fact]
        public async Task DeleteMenuAsync_Should_Call_Repository_Delete_Method()
        {
            // Arrange
            var menuIdToDelete = 1;

            _mockMenuRepository.Setup(repo => repo.DeleteAsync(It.IsAny<int>()))
                .Returns(Task.CompletedTask);

            // Act
            await _menuService.DeleteMenuAsync(menuIdToDelete);

            // Assert
            _mockMenuRepository.Verify(repo => repo.DeleteAsync(menuIdToDelete), Times.Once);
        }

        [Fact]
        public async Task GetRecentMenusAsync_Should_Return_Recent_Menus()
        {
            // Arrange
            var recentMenus = new List<Menu>
            {
                new Menu { Id = 3, Date = DateTime.Now, MealType = "Akşam" },
                new Menu { Id = 2, Date = DateTime.Now.AddDays(-1), MealType = "Öğle" }
            };

            _mockMenuRepository.Setup(repo => repo.GetRecentMenusAsync(2))
                .ReturnsAsync(recentMenus);

            // Act
            var result = await _menuService.GetRecentMenusAsync(2);

            // Assert
            result.Should().BeEquivalentTo(recentMenus);
            result.Should().HaveCount(2);
            _mockMenuRepository.Verify(repo => repo.GetRecentMenusAsync(2), Times.Once);
        }

        [Fact]
        public async Task GetMenuAsync_Should_Map_MenuItems_Correctly()
        {
            // Arrange
            var testDate = new DateTime(2025, 7, 23);
            var menu = new Menu
            {
                Id = 1,
                CityId = 1,
                MealType = "Sabah",
                Date = testDate,
                Energy = "1500 kcal",
                Items = new List<MenuItem>
                {
                    new MenuItem { Category = "Tatlı", Name = "Sütlaç", Gram = "120g" },
                    new MenuItem { Category = "Salata", Name = "Mevsim Salatası", Gram = "100g" }
                }
            };

            _mockMenuRepository.Setup(repo => repo.GetAsync(1, "Sabah", testDate))
                .ReturnsAsync(menu);

            // Act
            var result = await _menuService.GetMenuAsync(1, "Sabah", testDate);

            // Assert
            result.Should().NotBeNull();
            result.Items.Should().HaveCount(2);
            result.Items.Should().Contain(item => item.Name == "Sütlaç" && item.Category == "Tatlı");
            result.Items.Should().Contain(item => item.Name == "Mevsim Salatası" && item.Category == "Salata");
            _mockMenuRepository.Verify(repo => repo.GetAsync(1, "Sabah", testDate), Times.Once);
        }

        [Fact]
        public async Task GetAllMenusAsync_Should_Return_Empty_List_When_No_Menus()
        {
            // Arrange
            var emptyMenuList = new List<Menu>();

            _mockMenuRepository.Setup(repo => repo.GetAllAsync())
                .ReturnsAsync(emptyMenuList);

            // Act
            var result = await _menuService.GetAllMenusAsync();

            // Assert
            result.Should().BeEmpty();
            _mockMenuRepository.Verify(repo => repo.GetAllAsync(), Times.Once);
        }

        [Fact]
        public async Task UpdateMenuAsync_Should_Propagate_Repository_Exception()
        {
            // Arrange
            var menuToUpdate = new Menu { Id = 999, MealType = "Olmayan Öğün" };
            var expectedException = new Exception("Menü bulunamadı.");

            _mockMenuRepository.Setup(repo => repo.UpdateAsync(It.IsAny<Menu>()))
                .ThrowsAsync(expectedException);

            // Act & Assert
            var exception = await Assert.ThrowsAsync<Exception>(
                () => _menuService.UpdateMenuAsync(menuToUpdate));
            
            exception.Message.Should().Be("Menü bulunamadı.");
            _mockMenuRepository.Verify(repo => repo.UpdateAsync(menuToUpdate), Times.Once);
        }

        [Fact]
        public void MenuService_Should_Implement_IMenuService()
        {
            // Act & Assert
            _menuService.Should().BeAssignableTo<YurttaYe.Core.Services.Interfaces.IMenuService>();
        }

        [Fact]
        public void Constructor_Should_Throw_ArgumentNullException_When_Repository_Is_Null()
        {
            // Act & Assert
            var action = () => new MenuService(null!);
            action.Should().Throw<ArgumentNullException>()
                .WithParameterName("menuRepository");
        }
    }
}
