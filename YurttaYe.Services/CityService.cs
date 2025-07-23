using System;
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
            _cityRepository = cityRepository ?? throw new ArgumentNullException(nameof(cityRepository));
        }

        public async Task<List<City>> GetAllCitiesAsync()
        {
            return await _cityRepository.GetAllCitiesAsync();
        }

        public async Task<City> GetCityByIdAsync(int id)
        {
            return await _cityRepository.GetCityByIdAsync(id)
                   ?? throw new Exception("Şehir bulunamadı.");
        }

        public async Task AddCityAsync(City city)
        {
            await _cityRepository.AddCityAsync(city);
        }

        public async Task UpdateCityAsync(City city)
        {
            await _cityRepository.UpdateCityAsync(city);
        }

        public async Task DeleteCityAsync(int id)
        {
            await _cityRepository.DeleteCityAsync(id);
        }
    }
}