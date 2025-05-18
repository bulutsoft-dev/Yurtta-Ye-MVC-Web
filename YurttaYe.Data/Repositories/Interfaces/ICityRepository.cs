using System.Collections.Generic;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Data.Repositories
{
    public interface ICityRepository
    {
        Task<List<City>> GetAllCitiesAsync();
        Task<City> GetCityByIdAsync(int id);
        Task AddCityAsync(City city);
        Task UpdateCityAsync(City city);
        Task DeleteCityAsync(int id);
    }
}