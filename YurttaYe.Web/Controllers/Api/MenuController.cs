using System;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Services;
using YurttaYe.Core.Services.Interfaces;

namespace YurttaYe.Web.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("MobileApiPolicy")] // Mobil uygulama desteği
    public class MenuController : ControllerBase
    {
        private readonly IServiceManager _serviceManager;

        public MenuController(IServiceManager serviceManager)
        {
            _serviceManager = serviceManager ?? throw new ArgumentNullException(nameof(serviceManager));
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] int? cityId, [FromQuery] string? mealType, [FromQuery] string? date)
        {
            DateTime? filterDate = null;
            if (!string.IsNullOrEmpty(date) && DateTime.TryParse(date, out var parsedDate))
            {
                filterDate = parsedDate;
            }

            // Optimization: GetMenusAsync now performs filtering at the database level
            // Note: 'date' parameter is treated as 'Start Date' (>=) for this optimization
            var menus = await _serviceManager.MenuService.GetMenusAsync(cityId, mealType, filterDate);
            
            var dtos = menus.Select(m => new MenuDto
            {
                Id = m.Id,
                CityId = m.CityId,
                MealType = m.MealType,
                Date = m.Date.ToString("yyyy-MM-dd"),
                Energy = m.Energy,
                Items = m.Items.Select(i => new MenuItemDto
                {
                    Category = i.Category,
                    Name = i.Name,
                    Gram = i.Gram
                }).ToList()
            });

            return Ok(dtos);
        }
    }
}