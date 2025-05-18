using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;

namespace YurttaYe.Web.Controllers.Web
{
    [Authorize(Roles = "Admin")]
    public class AdminMenuController : Controller
    {
        private readonly IMenuService _menuService;
        private readonly ICityService _cityService;

        public AdminMenuController(IMenuService menuService, ICityService cityService)
        {
            _menuService = menuService;
            _cityService = cityService;
        }

        public async Task<IActionResult> Index()
        {
            var menus = await _menuService.GetAllMenusAsync();
            var model = menus.Select(m => new AdminMenuViewModel
            {
                Id = m.Id,
                CityName = m.City.Name,
                MealType = m.MealType,
                Date = m.Date,
                Energy = m.Energy,
                Items = m.Items.Select(i => new AdminMenuItemViewModel
                {
                    Category = i.Category,
                    Name = i.Name,
                    Gram = i.Gram
                }).ToList()
            });
            return View(model);
        }

        public async Task<IActionResult> Create()
        {
            var model = new AdminMenuViewModel
            {
                Cities = (await _cityService.GetAllCitiesAsync())
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name }),
                Items = new List<AdminMenuItemViewModel> { new AdminMenuItemViewModel() }
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Create(AdminMenuViewModel model)
        {
            if (ModelState.IsValid)
            {
                var menu = new Menu
                {
                    CityId = model.CityId,
                    MealType = model.MealType,
                    Date = model.Date,
                    Energy = model.Energy,
                    Items = model.Items.Select(i => new MenuItem
                    {
                        Category = i.Category,
                        Name = i.Name,
                        Gram = i.Gram
                    }).ToList()
                };
                await _menuService.AddMenuAsync(menu);
                return RedirectToAction(nameof(Index));
            }

            model.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
            return View(model);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var menu = await _menuService.GetMenuByIdAsync(id);
            if (menu == null) return NotFound();

            var model = new AdminMenuViewModel
            {
                Id = menu.Id,
                CityId = menu.CityId,
                MealType = menu.MealType,
                Date = menu.Date,
                Energy = menu.Energy,
                Cities = (await _cityService.GetAllCitiesAsync())
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name }),
                Items = menu.Items.Select(i => new AdminMenuItemViewModel
                {
                    Category = i.Category,
                    Name = i.Name,
                    Gram = i.Gram
                }).ToList()
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(AdminMenuViewModel model)
        {
            if (ModelState.IsValid)
            {
                var menu = new Menu
                {
                    Id = model.Id,
                    CityId = model.CityId,
                    MealType = model.MealType,
                    Date = model.Date,
                    Energy = model.Energy,
                    Items = model.Items.Select(i => new MenuItem
                    {
                        Category = i.Category,
                        Name = i.Name,
                        Gram = i.Gram
                    }).ToList()
                };
                await _menuService.UpdateMenuAsync(menu);
                return RedirectToAction(nameof(Index));
            }

            model.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
            return View(model);
        }
    }
}