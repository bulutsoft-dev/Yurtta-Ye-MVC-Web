using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Core.Services.Interfaces
{
    public interface IMenuService
    {
        Task<List<Menu>> GetAllMenusAsync();
        Task<List<Menu>> GetMenusAsync(int? cityId, string mealType, DateTime? date);
        Task<Menu> GetMenuByIdAsync(int id);
        Task<MenuDto> GetMenuAsync(int cityId, string mealType, DateTime date);
        Task AddMenuAsync(Menu menu);
        Task UpdateMenuAsync(Menu menu);
        Task DeleteMenuAsync(int id);
        Task<List<Menu>> GetRecentMenusAsync(int count);
    }
}
