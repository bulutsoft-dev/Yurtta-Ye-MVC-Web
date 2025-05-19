using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Data
{
    public static class SeedData
    {
        public static async Task Initialize(AppDbContext context, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            context.Database.EnsureCreated();

            if (!await roleManager.RoleExistsAsync("Admin"))
            {
                await roleManager.CreateAsync(new IdentityRole("Admin"));
            }

            if (!context.Cities.Any())
            {
                var city = new City { Name = "İstanbul" };
                context.Cities.Add(city);
                context.SaveChanges();
            }

            var istanbul = context.Cities.FirstOrDefault(c => c.Name == "İstanbul");

            if (!context.Menus.Any(m => m.Date >= new DateTime(2025, 5, 15) && m.Date <= new DateTime(2025, 5, 25)))
            {
                var menuList = new[]
                {
                    new Menu
                    {
                        CityId = istanbul.Id,
                        Date = new DateTime(2025, 5, 15),
                        MealType = "Dinner",
                        Energy = "850-1100 kkal",
                        Items = new()
                        {
                            new MenuItem { Category = "Çorba", Name = "Mercimek Çorbası", Gram = "250 g" },
                            new MenuItem { Category = "Ana Yemek", Name = "Tavuk Sote", Gram = "200 g" },
                            new MenuItem { Category = "Garnitür", Name = "Pirinç Pilavı", Gram = "150 g" },
                            new MenuItem { Category = "Ekstra", Name = "Çoban Salata", Gram = "100 g" },
                            new MenuItem { Category = "Ekstra", Name = "500 ml Su", Gram = "" },
                            new MenuItem { Category = "Ekstra", Name = "Çeyrek Ekmek", Gram = "" }
                        }
                    },
                    new Menu
                    {
                        CityId = istanbul.Id,
                        Date = new DateTime(2025, 5, 16),
                        MealType = "Dinner",
                        Energy = "900-1150 kkal",
                        Items = new()
                        {
                            new MenuItem { Category = "Çorba", Name = "Ezogelin Çorbası", Gram = "250 g" },
                            new MenuItem { Category = "Ana Yemek", Name = "Karnıyarık", Gram = "200 g" },
                            new MenuItem { Category = "Garnitür", Name = "Bulgur Pilavı", Gram = "150 g" },
                            new MenuItem { Category = "Ekstra", Name = "Ayran", Gram = "200 ml" },
                            new MenuItem { Category = "Ekstra", Name = "500 ml Su", Gram = "" },
                            new MenuItem { Category = "Ekstra", Name = "Çeyrek Ekmek", Gram = "" }
                        }
                    },
                    new Menu
                    {
                        CityId = istanbul.Id,
                        Date = new DateTime(2025, 5, 17),
                        MealType = "Dinner",
                        Energy = "800-1000 kkal",
                        Items = new()
                        {
                            new MenuItem { Category = "Çorba", Name = "Yayla Çorbası", Gram = "250 g" },
                            new MenuItem { Category = "Ana Yemek", Name = "Fırın Tavuk", Gram = "200 g" },
                            new MenuItem { Category = "Garnitür", Name = "Patates Püresi", Gram = "150 g" },
                            new MenuItem { Category = "Ekstra", Name = "Mevsim Salata", Gram = "100 g" },
                            new MenuItem { Category = "Ekstra", Name = "500 ml Su", Gram = "" },
                            new MenuItem { Category = "Ekstra", Name = "Çeyrek Ekmek", Gram = "" }
                        }
                    },
                    new Menu
                    {
                        CityId = istanbul.Id,
                        Date = new DateTime(2025, 5, 18),
                        MealType = "Dinner",
                        Energy = "850-1100 kkal",
                        Items = new()
                        {
                            new MenuItem { Category = "Çorba", Name = "Domates Çorbası", Gram = "250 g" },
                            new MenuItem { Category = "Ana Yemek", Name = "Izgara Köfte", Gram = "200 g" },
                            new MenuItem { Category = "Garnitür", Name = "Spagetti", Gram = "150 g" },
                            new MenuItem { Category = "Ekstra", Name = "Yoğurt", Gram = "100 g" },
                            new MenuItem { Category = "Ekstra", Name = "500 ml Su", Gram = "" },
                            new MenuItem { Category = "Ekstra", Name = "Çeyrek Ekmek", Gram = "" }
                        }
                    },
                    new Menu
                    {
                        CityId = istanbul.Id,
                        Date = new DateTime(2025, 5, 19),
                        MealType = "Dinner",
                        Energy = "870-1120 kkal",
                        Items = new()
                        {
                            new MenuItem { Category = "Çorba", Name = "Tarhana Çorbası", Gram = "250 g" },
                            new MenuItem { Category = "Ana Yemek", Name = "Etli Kuru Fasulye", Gram = "200 g" },
                            new MenuItem { Category = "Garnitür", Name = "Pirinç Pilavı", Gram = "150 g" },
                            new MenuItem { Category = "Ekstra", Name = "Turşu", Gram = "50 g" },
                            new MenuItem { Category = "Ekstra", Name = "500 ml Su", Gram = "" },
                            new MenuItem { Category = "Ekstra", Name = "Çeyrek Ekmek", Gram = "" }
                        }
                    },
                    new Menu
                    {
                        CityId = istanbul.Id,
                        Date = new DateTime(2025, 5, 20),
                        MealType = "Dinner",
                        Energy = "890-1170 kkal",
                        Items = new()
                        {
                            new MenuItem { Category = "Çorba", Name = "Sebze Çorbası", Gram = "250 g" },
                            new MenuItem { Category = "Ana Yemek", Name = "Mantı", Gram = "200 g" },
                            new MenuItem { Category = "Garnitür", Name = "Yoğurt", Gram = "100 g" },
                            new MenuItem { Category = "Ekstra", Name = "Salatalık Turşusu", Gram = "50 g" },
                            new MenuItem { Category = "Ekstra", Name = "500 ml Su", Gram = "" },
                            new MenuItem { Category = "Ekstra", Name = "Çeyrek Ekmek", Gram = "" }
                        }
                    },
                    // Aynı yapı 21-25 Mayıs için tekrar eder
                    // Örnek olarak 21 Mayıs:
                    new Menu
                    {
                        CityId = istanbul.Id,
                        Date = new DateTime(2025, 5, 21),
                        MealType = "Dinner",
                        Energy = "880-1120 kkal",
                        Items = new()
                        {
                            new MenuItem { Category = "Çorba", Name = "Mercimek Çorbası", Gram = "250 g" },
                            new MenuItem { Category = "Ana Yemek", Name = "Kuru Köfte", Gram = "200 g" },
                            new MenuItem { Category = "Garnitür", Name = "Makarna", Gram = "150 g" },
                            new MenuItem { Category = "Ekstra", Name = "Mevsim Salata", Gram = "100 g" },
                            new MenuItem { Category = "Ekstra", Name = "500 ml Su", Gram = "" },
                            new MenuItem { Category = "Ekstra", Name = "Çeyrek Ekmek", Gram = "" }
                        }
                    },
                    // Diğer günleri aynı mantıkla doldurabilirsin (22, 23, 24, 25 Mayıs)
                };

                context.Menus.AddRange(menuList);
                context.SaveChanges();
            }

            var adminUser = await userManager.FindByEmailAsync("admin@yurttaye.com");
            if (adminUser == null)
            {
                adminUser = new IdentityUser { UserName = "admin@yurttaye.com", Email = "admin@yurttaye.com" };
                var result = await userManager.CreateAsync(adminUser, "Admin123!");
                if (result.Succeeded)
                {
                    await userManager.AddToRoleAsync(adminUser, "Admin");
                }
            }
        }
    }
}
