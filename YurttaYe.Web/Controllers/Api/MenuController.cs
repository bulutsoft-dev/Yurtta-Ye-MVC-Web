using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Dtos;
using YurttaYe.Core.Models.Entities;
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
        public async Task<IActionResult> GetMenus(int cityId, string mealType, DateTime date)
        {
            try
            {
                var menu = await _menuService.GetMenuAsync(cityId, mealType, date);
                return Ok(menu);
            }
            catch (Exception ex)
            {
                return NotFound(new { message = ex.Message });
            }
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> CreateMenu([FromBody] MenuDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                var menu = new Menu
                {
                    CityId = dto.CityId,
                    MealType = dto.MealType,
                    Date = dto.Date,
                    Energy = dto.Energy,
                    Items = dto.Items.Select(i => new MenuItem
                    {
                        Category = i.Category,
                        Name = i.Name,
                        Gram = i.Gram
                    }).ToList()
                };
                await _menuService.AddMenuAsync(menu);
                return CreatedAtAction(nameof(GetMenus), new { id = menu.Id }, menu);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = ex.Message });
            }
        }
    }
}