using System.Collections.Generic;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;

    public interface ICityService
    {
        Task<List<City>> GetAllCitiesAsync();
        Task AddCityAsync(City city);
    }
