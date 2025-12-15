using System;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Services.Interfaces;
using YurttaYe.Data.Repositories;

namespace YurttaYe.Services
{
    public class MenuService : IMenuService
    {
        private readonly IMenuRepository _menuRepository;

        public MenuService(IMenuRepository menuRepository)
        {
            _menuRepository = menuRepository ?? throw new ArgumentNullException(nameof(menuRepository));
        }

        public async Task<MenuDto> GetMenuAsync(int cityId, string mealType, DateTime date)
        {
            var menu = await _menuRepository.GetAsync(cityId, mealType, date);
            if (menu == null) return null;

            return new MenuDto
            {
                Id = menu.Id,
                CityId = menu.CityId,
                MealType = menu.MealType,
                Date = menu.Date.ToString("yyyy-MM-dd"),
                Energy = menu.Energy,
                Items = menu.Items.Select(i => new MenuItemDto
                {
                    Category = i.Category,
                    Name = i.Name,
                    Gram = i.Gram
                }).ToList()
            };
        }

        public async Task<Menu> GetMenuByIdAsync(int id)
        {
            return await _menuRepository.GetByIdAsync(id)
                   ?? throw new Exception("Menü bulunamadı.");
        }

        public async Task<List<Menu>> GetAllMenusAsync()
        {
            return await _menuRepository.GetAllAsync();
        }

        public async Task<List<Menu>> GetMenusAsync(int? cityId, string mealType, DateTime? date)
        {
            return await _menuRepository.GetListAsync(m => 
                (!cityId.HasValue || m.CityId == cityId) &&
                (string.IsNullOrEmpty(mealType) || m.MealType == mealType) &&
                (!date.HasValue || m.Date >= date.Value) // Performance optimization: Filter by date if provided
            );
        }

        public async Task AddMenuAsync(Menu menu)
        {
            await _menuRepository.AddAsync(menu);
        }

        public async Task UpdateMenuAsync(Menu menu)
        {
            await _menuRepository.UpdateAsync(menu);
        }

        public async Task DeleteMenuAsync(int id)
        {
            await _menuRepository.DeleteAsync(id);
        }

        public async Task<List<Menu>> GetRecentMenusAsync(int count)
        {
            return await _menuRepository.GetRecentMenusAsync(count);
        }
    }
}