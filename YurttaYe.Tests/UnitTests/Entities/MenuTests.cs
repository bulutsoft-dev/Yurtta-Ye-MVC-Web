using FluentAssertions;
using YurttaYe.Core.Models.Entities;
using Xunit;

namespace YurttaYe.Tests.UnitTests.Entities
{
    public class MenuTests
    {
        [Fact]
        public void Menu_Should_Have_Default_Values()
        {
            // Arrange & Act
            var menu = new Menu();

            // Assert
            menu.Id.Should().Be(0);
            menu.CityId.Should().Be(0);
            menu.MealType.Should().Be(string.Empty);
            menu.Date.Should().Be(default(DateTime));
            menu.Energy.Should().Be(string.Empty);
            menu.City.Should().BeNull();
            menu.Items.Should().NotBeNull().And.BeEmpty();
        }

        [Fact]
        public void Menu_Should_Set_Properties_Correctly()
        {
            // Arrange
            var expectedId = 1;
            var expectedCityId = 2;
            var expectedMealType = "Akşam";
            var expectedDate = new DateTime(2025, 7, 23);
            var expectedEnergy = "2500 kcal";

            // Act
            var menu = new Menu
            {
                Id = expectedId,
                CityId = expectedCityId,
                MealType = expectedMealType,
                Date = expectedDate,
                Energy = expectedEnergy
            };

            // Assert
            menu.Id.Should().Be(expectedId);
            menu.CityId.Should().Be(expectedCityId);
            menu.MealType.Should().Be(expectedMealType);
            menu.Date.Should().Be(expectedDate);
            menu.Energy.Should().Be(expectedEnergy);
        }

        [Theory]
        [InlineData("Sabah")]
        [InlineData("Öğle")]
        [InlineData("Akşam")]
        public void Menu_Should_Accept_Valid_MealTypes(string mealType)
        {
            // Arrange & Act
            var menu = new Menu
            {
                MealType = mealType
            };

            // Assert
            menu.MealType.Should().Be(mealType);
        }

        [Fact]
        public void Menu_Should_Initialize_Items_Collection()
        {
            // Arrange & Act
            var menu = new Menu();

            // Assert
            menu.Items.Should().NotBeNull();
            menu.Items.Should().BeOfType<List<MenuItem>>();
        }

        [Fact]
        public void Menu_Should_Allow_Adding_MenuItems()
        {
            // Arrange
            var menu = new Menu();
            var menuItem1 = new MenuItem { Id = 1, Name = "Çorba" };
            var menuItem2 = new MenuItem { Id = 2, Name = "Ana Yemek" };

            // Act
            menu.Items.Add(menuItem1);
            menu.Items.Add(menuItem2);

            // Assert
            menu.Items.Should().HaveCount(2);
            menu.Items.Should().Contain(menuItem1);
            menu.Items.Should().Contain(menuItem2);
        }

        [Fact]
        public void Menu_Should_Handle_City_Relationship()
        {
            // Arrange
            var city = new City { Id = 1, Name = "İstanbul" };
            var menu = new Menu
            {
                CityId = city.Id,
                City = city
            };

            // Act & Assert
            menu.CityId.Should().Be(city.Id);
            menu.City.Should().Be(city);
            menu.City.Name.Should().Be("İstanbul");
        }

        [Fact]
        public void Menu_Date_Should_Handle_Different_Dates()
        {
            // Arrange
            var testDate = new DateTime(2025, 12, 31, 18, 30, 0);

            // Act
            var menu = new Menu
            {
                Date = testDate
            };

            // Assert
            menu.Date.Should().Be(testDate);
            menu.Date.Year.Should().Be(2025);
            menu.Date.Month.Should().Be(12);
            menu.Date.Day.Should().Be(31);
        }
    }
}
