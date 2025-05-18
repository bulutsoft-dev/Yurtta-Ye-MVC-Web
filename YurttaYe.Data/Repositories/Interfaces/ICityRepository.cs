using System.Collections.Generic;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Data.Repositories
{
    public interface ICityRepository
    {
        Task<List<City>> GetAllCitiesAsync();
        Task AddCityAsync(City city);
    }
}