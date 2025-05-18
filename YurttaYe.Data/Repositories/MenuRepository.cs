using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Data.Repositories
{
    public class MenuRepository : IMenuRepository
    {
        private readonly AppDbContext _context;

        public MenuRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Menu> GetMenuAsync(int cityId, string mealType, DateTime date)
        {
            return await _context.Menus
                .Include(m => m.City)
                .Include(m => m.Items)
                .FirstOrDefaultAsync(m => m.CityId == cityId && m.MealType == mealType && m.Date.Date == date.Date)
                ?? throw new Exception("Menü bulunamadı.");
        }

        public async Task<Menu> GetMenuByIdAsync(int id)
        {
            return await _context.Menus
                .Include(m => m.City)
                .Include(m => m.Items)
                .FirstOrDefaultAsync(m => m.Id == id);
        }

        public async Task<List<Menu>> GetAllMenusAsync()
        {
            return await _context.Menus
                .Include(m => m.City)
                .Include(m => m.Items)
                .ToListAsync();
        }

        public async Task AddMenuAsync(Menu menu)
        {
            await _context.Menus.AddAsync(menu);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateMenuAsync(Menu menu)
        {
            var existing = await _context.Menus
                .Include(m => m.Items)
                .FirstOrDefaultAsync(m => m.Id == menu.Id);
            if (existing == null) throw new Exception("Menü bulunamadı.");

            existing.CityId = menu.CityId;
            existing.MealType = menu.MealType;
            existing.Date = menu.Date;
            existing.Energy = menu.Energy;

            _context.MenuItems.RemoveRange(existing.Items);
            existing.Items = menu.Items;

            _context.Menus.Update(existing);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteMenuAsync(int id)
        {
            var menu = await _context.Menus.FindAsync(id);
            if (menu != null)
            {
                _context.Menus.Remove(menu);
                await _context.SaveChangesAsync();
            }
        }
    }
}