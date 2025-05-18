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
        public static async Task Initialize(AppDbContext context, UserManager<IdentityUser> userManager)
        {
            context.Database.EnsureCreated();

            if (context.Cities.Any()) return;

            var city = new City { Name = "İstanbul" };
            context.Cities.Add(city);
            await context.SaveChangesAsync();

            var menu = new Menu
            {
                CityId = city.Id,
                MealType = "Dinner",
                Date = new DateTime(2025, 5, 5),
                Energy = "850-1135 kkal",
                Items = new()
                {
                    new MenuItem { Category = "Çorba", Name = "Sebze Çorbası", Gram = "250 g" },
                    new MenuItem { Category = "Ana Yemek", Name = "Tavuk Çökertme", Gram = "100 g/250 g" },
                    new MenuItem { Category = "Garnitür", Name = "Şehriyeli Pirinç Pilavı", Gram = "150 g" },
                    new MenuItem { Category = "Ekstra", Name = "Mevsim Salata", Gram = "100 g" }
                }
            };
            context.Menus.Add(menu);
            await context.SaveChangesAsync();

            var adminUser = new IdentityUser { UserName = "admin@yurttaye.com", Email = "admin@yurttaye.com" };
            var result = await userManager.CreateAsync(adminUser, "Admin123!");
            if (result.Succeeded)
            {
                await userManager.AddToRoleAsync(adminUser, "Admin");
            }
        }
    }
}