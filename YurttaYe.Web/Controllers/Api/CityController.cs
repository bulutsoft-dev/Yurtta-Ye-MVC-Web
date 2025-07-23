using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Services;
using YurttaYe.Core.Services.Interfaces;
using System;

namespace YurttaYe.Web.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        private readonly IServiceManager _serviceManager;

        public CityController(IServiceManager serviceManager)
        {
            _serviceManager = serviceManager ?? throw new ArgumentNullException(nameof(serviceManager));
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var cities = await _serviceManager.CityService.GetAllCitiesAsync();
            var dtos = cities.Select(c => new CityDto
            {
                Id = c.Id,
                Name = c.Name
            });
            return Ok(dtos);
        }
    }
}