using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.Extensions.Localization;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;
using YurttaYe.Core.Services.Interfaces;
using YurttaYe.Web.Resources;

namespace YurttaYe.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class AdminCityController : Controller
    {
        private readonly IServiceManager _serviceManager;
        private readonly IStringLocalizer<SharedControllerResources> _localizer;

        public AdminCityController(IServiceManager serviceManager, IStringLocalizer<SharedControllerResources> localizer)
        {
            _serviceManager = serviceManager;
            _localizer = localizer;
        }

        public async Task<IActionResult> Index(string search)
        {
            var cities = await _serviceManager.CityService.GetAllCitiesAsync();
            var model = cities.Select(c => new AdminCityViewModel { Id = c.Id, Name = c.Name });

            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(c => c.Name.Contains(search, StringComparison.OrdinalIgnoreCase));
            }

            return View(model);
        }

        public IActionResult Create()
        {
            return View(new AdminCityViewModel());
        }

        [HttpPost]
        public async Task<IActionResult> Create(AdminCityViewModel model)
        {
            if (ModelState.IsValid)
            {
                var city = new City { Name = model.Name };
                await _serviceManager.CityService.AddCityAsync(city);
                TempData["Success"] = string.Format(_localizer["EntityAddedSuccessfully"], _localizer["City"]);
                return RedirectToAction(nameof(Index));
            }
            TempData["Error"] = _localizer["ValidationError"];
            return View(model);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var city = await _serviceManager.CityService.GetCityByIdAsync(id);
            if (city == null) return NotFound();

            var model = new AdminCityViewModel { Id = city.Id, Name = city.Name };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(AdminCityViewModel model)
        {
            if (ModelState.IsValid)
            {
                var city = new City { Id = model.Id, Name = model.Name };
                await _serviceManager.CityService.UpdateCityAsync(city);
                TempData["Success"] = string.Format(_localizer["EntityUpdatedSuccessfully"], _localizer["City"]);
                return RedirectToAction(nameof(Index));
            }
            TempData["Error"] = _localizer["ValidationError"];
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                await _serviceManager.CityService.DeleteCityAsync(id);
                TempData["Success"] = string.Format(_localizer["EntityDeletedSuccessfully"], _localizer["City"]);
            }
            catch
            {
                TempData["Error"] = string.Format(_localizer["DeletionError"], _localizer["City"]);
            }
            return RedirectToAction(nameof(Index));
        }
    }
}