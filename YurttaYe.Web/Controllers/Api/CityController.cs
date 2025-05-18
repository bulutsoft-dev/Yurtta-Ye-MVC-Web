using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Services;

namespace YurttaYe.Web.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        private readonly ICityService _cityService;

        public CityController(ICityService cityService)
        {
            _cityService = cityService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var cities = await _cityService.GetAllCitiesAsync();
            var dtos = cities.Select(c => new CityDto
            {
                Id = c.Id,
                Name = c.Name
            });
            return Ok(dtos);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var city = await _cityService.GetCityByIdAsync(id);
            if (city == null) return NotFound();
            var dto = new CityDto
            {
                Id = city.Id,
                Name = city.Name
            };
            return Ok(dto);
        }
    }
}