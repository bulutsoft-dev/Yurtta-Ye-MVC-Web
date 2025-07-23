using FluentAssertions;
using YurttaYe.Core.Models.Entities;
using Xunit;

namespace YurttaYe.Tests.UnitTests.Entities
{
    public class CityTests
    {
        [Fact]
        public void City_Should_Have_Default_Values()
        {
            // Arrange & Act
            var city = new City();

            // Assert
            city.Id.Should().Be(0);
            city.Name.Should().Be(string.Empty);
        }

        [Fact]
        public void City_Should_Set_Properties_Correctly()
        {
            // Arrange
            var expectedId = 1;
            var expectedName = "İstanbul";

            // Act
            var city = new City
            {
                Id = expectedId,
                Name = expectedName
            };

            // Assert
            city.Id.Should().Be(expectedId);
            city.Name.Should().Be(expectedName);
        }

        [Theory]
        [InlineData(1, "İstanbul")]
        [InlineData(2, "Ankara")]
        [InlineData(3, "İzmir")]
        public void City_Should_Handle_Different_Values(int id, string name)
        {
            // Arrange & Act
            var city = new City
            {
                Id = id,
                Name = name
            };

            // Assert
            city.Id.Should().Be(id);
            city.Name.Should().Be(name);
        }

        [Fact]
        public void City_Name_Should_Handle_Empty_String()
        {
            // Arrange & Act
            var city = new City
            {
                Id = 1,
                Name = ""
            };

            // Assert
            city.Name.Should().BeEmpty();
        }

        [Fact]
        public void City_Should_Allow_Name_Update()
        {
            // Arrange
            var city = new City
            {
                Id = 1,
                Name = "Eski İsim"
            };

            // Act
            city.Name = "Yeni İsim";

            // Assert
            city.Name.Should().Be("Yeni İsim");
        }
    }
}
