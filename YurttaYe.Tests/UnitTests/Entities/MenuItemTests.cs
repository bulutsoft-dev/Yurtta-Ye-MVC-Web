using FluentAssertions;
using YurttaYe.Core.Models.Entities;
using Xunit;

namespace YurttaYe.Tests.UnitTests.Entities
{
    public class MenuItemTests
    {
        [Fact]
        public void MenuItem_Should_Have_Default_Values()
        {
            // Arrange & Act
            var menuItem = new MenuItem();

            // Assert
            menuItem.Id.Should().Be(0);
            menuItem.MenuId.Should().Be(0);
            menuItem.Category.Should().Be(string.Empty);
            menuItem.Name.Should().Be(string.Empty);
            menuItem.Gram.Should().Be(string.Empty);
            menuItem.Menu.Should().BeNull();
        }

        [Fact]
        public void MenuItem_Should_Set_Properties_Correctly()
        {
            // Arrange
            var expectedId = 1;
            var expectedMenuId = 5;
            var expectedCategory = "Çorba";
            var expectedName = "Mercimek Çorbası";
            var expectedGram = "250ml";

            // Act
            var menuItem = new MenuItem
            {
                Id = expectedId,
                MenuId = expectedMenuId,
                Category = expectedCategory,
                Name = expectedName,
                Gram = expectedGram
            };

            // Assert
            menuItem.Id.Should().Be(expectedId);
            menuItem.MenuId.Should().Be(expectedMenuId);
            menuItem.Category.Should().Be(expectedCategory);
            menuItem.Name.Should().Be(expectedName);
            menuItem.Gram.Should().Be(expectedGram);
        }

        [Theory]
        [InlineData("Çorba", "Mercimek Çorbası", "250ml")]
        [InlineData("Ana Yemek", "Tavuk Döner", "150g")]
        [InlineData("Salata", "Mevsim Salatası", "100g")]
        [InlineData("Tatlı", "Sütlaç", "120g")]
        public void MenuItem_Should_Handle_Different_Food_Categories(string category, string name, string gram)
        {
            // Arrange & Act
            var menuItem = new MenuItem
            {
                Category = category,
                Name = name,
                Gram = gram
            };

            // Assert
            menuItem.Category.Should().Be(category);
            menuItem.Name.Should().Be(name);
            menuItem.Gram.Should().Be(gram);
        }

        [Fact]
        public void MenuItem_Should_Handle_Menu_Relationship()
        {
            // Arrange
            var menu = new Menu 
            { 
                Id = 1, 
                MealType = "Öğle",
                Date = DateTime.Now
            };
            
            var menuItem = new MenuItem
            {
                MenuId = menu.Id,
                Menu = menu,
                Name = "Test Yemek"
            };

            // Act & Assert
            menuItem.MenuId.Should().Be(menu.Id);
            menuItem.Menu.Should().Be(menu);
            menuItem.Menu.MealType.Should().Be("Öğle");
        }

        [Fact]
        public void MenuItem_Should_Allow_Property_Updates()
        {
            // Arrange
            var menuItem = new MenuItem
            {
                Category = "Eski Kategori",
                Name = "Eski İsim",
                Gram = "100g"
            };

            // Act
            menuItem.Category = "Yeni Kategori";
            menuItem.Name = "Yeni İsim";
            menuItem.Gram = "200g";

            // Assert
            menuItem.Category.Should().Be("Yeni Kategori");
            menuItem.Name.Should().Be("Yeni İsim");
            menuItem.Gram.Should().Be("200g");
        }

        [Theory]
        [InlineData("")]
        [InlineData("   ")]
        public void MenuItem_Should_Handle_Empty_Or_Whitespace_Values(string emptyValue)
        {
            // Arrange & Act
            var menuItem = new MenuItem
            {
                Category = emptyValue,
                Name = emptyValue,
                Gram = emptyValue
            };

            // Assert
            menuItem.Category.Should().Be(emptyValue);
            menuItem.Name.Should().Be(emptyValue);
            menuItem.Gram.Should().Be(emptyValue);
        }

        [Fact]
        public void MenuItem_Should_Support_Different_Gram_Formats()
        {
            // Arrange & Act
            var menuItem1 = new MenuItem { Gram = "150g" };
            var menuItem2 = new MenuItem { Gram = "250ml" };
            var menuItem3 = new MenuItem { Gram = "1 adet" };
            var menuItem4 = new MenuItem { Gram = "2 dilim" };

            // Assert
            menuItem1.Gram.Should().Be("150g");
            menuItem2.Gram.Should().Be("250ml");
            menuItem3.Gram.Should().Be("1 adet");
            menuItem4.Gram.Should().Be("2 dilim");
        }
    }
}
