using System;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Services;
using YurttaYe.Data.Repositories;

namespace YurttaYe.Services
{
    public class MenuService : IMenuService
    {
        private readonly IMenuRepository _menuRepository;

        public MenuService(IMenuRepository menuRepository)
        {
            _menuRepository = menuRepository;
        }

        public async Task<MenuDto> GetMenuAsync(int cityId, string mealType, DateTime date)
        {
            var menu = await _menuRepository.GetMenuAsync(cityId, mealType, date);
            return new MenuDto
            {
                Id = menu.Id,
                CityId = menu.CityId,
                MealType = menu.MealType,
                Date = menu.Date,
                Energy = menu.Energy,
                Items = menu.Items.Select(i => new MenuItemDto
                {
                    Id = i.Id,
                    Category = i.Category,
                    Name = i.Name,
                    Gram = i.Gram
                }).ToList()
            };
        }

        public async Task<Menu> GetMenuByIdAsync(int id)
        {
            return await _menuRepository.GetMenuByIdAsync(id)
                   ?? throw new Exception("Menü bulunamadı.");
        }

        public async Task<List<Menu>> GetAllMenusAsync()
        {
            return await _menuRepository.GetAllMenusAsync();
        }

        public async Task AddMenuAsync(Menu menu)
        {
            await _menuRepository.AddMenuAsync(menu);
        }

        public async Task UpdateMenuAsync(Menu menu)
        {
            await _menuRepository.UpdateMenuAsync(menu);
        }

        public async Task DeleteMenuAsync(int id)
        {
            await _menuRepository.DeleteMenuAsync(id);
        }
    }
}