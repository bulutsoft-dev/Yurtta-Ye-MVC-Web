using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Data.Repositories
{
    public interface IMenuRepository
    {
        Task<Menu> GetMenuAsync(int cityId, string mealType, DateTime date);
        Task<Menu> GetMenuByIdAsync(int id);
        Task<List<Menu>> GetAllMenusAsync();
        Task AddMenuAsync(Menu menu);
        Task UpdateMenuAsync(Menu menu);
        Task DeleteMenuAsync(int id);
    }
}