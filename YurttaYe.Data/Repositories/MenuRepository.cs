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

        public async Task<List<Menu>> GetAllAsync()
        {
            return await _context.Menus
                .Include(m => m.City)
                .Include(m => m.Items)
                .ToListAsync();
        }

        public async Task<List<Menu>> GetListAsync(System.Linq.Expressions.Expression<Func<Menu, bool>> predicate)
        {
            return await _context.Menus
                .Include(m => m.City)
                .Include(m => m.Items)
                .Where(predicate)
                .ToListAsync();
        }

        public async Task<Menu> GetByIdAsync(int id)
        {
            return await _context.Menus
                .Include(m => m.City)
                .Include(m => m.Items)
                .FirstOrDefaultAsync(m => m.Id == id) ?? new Menu();
        }

        public async Task<Menu> GetAsync(int cityId, string mealType, DateTime date)
        {
            return await _context.Menus
                .Include(m => m.City)
                .Include(m => m.Items)
                .FirstOrDefaultAsync(m => m.CityId == cityId && m.MealType == mealType && m.Date.Date == date.Date)
                ?? throw new Exception("Menü bulunamadı.");
        }

        public async Task AddAsync(Menu menu)
        {
            await _context.Menus.AddAsync(menu);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(Menu menu)
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

        public async Task DeleteAsync(int id)
        {
            var menu = await _context.Menus.FindAsync(id);
            if (menu != null)
            {
                _context.Menus.Remove(menu);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<List<Menu>> GetRecentMenusAsync(int count)
        {
            return await _context.Menus
                .Include(m => m.City)
                .OrderByDescending(m => m.Date)
                .Take(count)
                .ToListAsync();
        }
    }
}