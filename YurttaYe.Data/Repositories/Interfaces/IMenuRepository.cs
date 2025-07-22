using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Data.Repositories
{
    public interface IMenuRepository
    {
        Task<List<Menu>> GetAllAsync();
        Task<Menu> GetByIdAsync(int id);
        Task<Menu> GetAsync(int cityId, string mealType, DateTime date);
        Task AddAsync(Menu menu);
        Task UpdateAsync(Menu menu);
        Task DeleteAsync(int id);
        Task<List<Menu>> GetRecentMenusAsync(int count);
    }
}