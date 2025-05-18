using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Services;

namespace YurttaYe.Web.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public class MenuController : ControllerBase
    {
        private readonly IMenuService _menuService;

        public MenuController(IMenuService menuService)
        {
            _menuService = menuService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] int? cityId, [FromQuery] string? mealType, [FromQuery] string? date)
        {
            var menus = await _menuService.GetAllMenusAsync();
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

            if (cityId.HasValue)
                dtos = dtos.Where(m => m.CityId == cityId.Value);
            if (!string.IsNullOrEmpty(mealType))
                dtos = dtos.Where(m => m.MealType == mealType);
            if (!string.IsNullOrEmpty(date) && DateTime.TryParse(date, out var parsedDate))
                dtos = dtos.Where(m => DateTime.Parse(m.Date).Date == parsedDate.Date);

            return Ok(dtos);
        }
    }
}