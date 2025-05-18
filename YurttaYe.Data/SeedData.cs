using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Data
{
    public static class SeedData
    {
        public static void Initialize(AppDbContext context)
        {
            context.Database.EnsureCreated();

            if (context.Cities.Any()) return;

            var city = new City { Name = "İstanbul" };
            context.Cities.Add(city);
            context.SaveChanges();

            var menu = new Menu
            {
                CityId = city.Id,
                MealType = "Dinner",
                Date = new DateTime(2025, 5, 5),
                Energy = "850-1135 kkal",
                Items = new()
                {
                    new MenuItem { Category = "Çorba", Name = "Sebze Çorbası", Gram = "250 g" },
                    new MenuItem { Category = "Çorba", Name = "Domates Çorbası", Gram = "250 g" },
                    new MenuItem { Category = "Ana Yemek", Name = "Tavuk Çökertme", Gram = "100 g/250 g" },
                    new MenuItem { Category = "Ana Yemek", Name = "Mücver (Yoğurt ile)", Gram = "200 g" },
                    new MenuItem { Category = "Garnitür", Name = "Şehriyeli Pirinç Pilavı", Gram = "150 g" },
                    new MenuItem { Category = "Ekstra", Name = "Mevsim Salata", Gram = "100 g" },
                    new MenuItem { Category = "Ekstra", Name = "500 ml Su", Gram = "" },
                    new MenuItem { Category = "Ekstra", Name = "Çeyrek Ekmek", Gram = "" }
                }
            };
            context.Menus.Add(menu);
            context.SaveChanges();
        }
    }
}