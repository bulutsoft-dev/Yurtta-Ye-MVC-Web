using System.Collections.Generic;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Services;
using YurttaYe.Data.Repositories;

namespace YurttaYe.Services
{
    public class CityService : ICityService
    {
        private readonly ICityRepository _cityRepository;

        public CityService(ICityRepository cityRepository)
        {
            _cityRepository = cityRepository;
        }

        public async Task<List<City>> GetAllCitiesAsync()
        {
            return await _cityRepository.GetAllCitiesAsync();
        }

        public async Task AddCityAsync(City city)
        {
            await _cityRepository.AddCityAsync(city);
        }
    }
}