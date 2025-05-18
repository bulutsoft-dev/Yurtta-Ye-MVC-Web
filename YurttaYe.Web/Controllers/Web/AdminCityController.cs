using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;

namespace YurttaYe.Web.Controllers.Web
{
    [Authorize(Roles = "Admin")]
    public class AdminCityController : Controller
    {
        private readonly ICityService _cityService;

        public AdminCityController(ICityService cityService)
        {
            _cityService = cityService;
        }

        public async Task<IActionResult> Index(string search)
        {
            var cities = await _cityService.GetAllCitiesAsync();
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
                await _cityService.AddCityAsync(city);
                TempData["Success"] = "Şehir başarıyla eklendi.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Error"] = "Lütfen tüm alanları doğru doldurun.";
            return View(model);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var city = (await _cityService.GetAllCitiesAsync()).FirstOrDefault(c => c.Id == id);
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
                await _cityService.AddCityAsync(city); // Note: UpdateCityAsync eklenecek
                TempData["Success"] = "Şehir başarıyla güncellendi.";
                return RedirectToAction(nameof(Index));
            }
            TempData["Error"] = "Lütfen tüm alanları doğru doldurun.";
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                // Note: DeleteCityAsync eklenecek
                TempData["Success"] = "Şehir başarıyla silindi.";
            }
            catch
            {
                TempData["Error"] = "Şehir silinirken hata oluştu.";
            }
            return RedirectToAction(nameof(Index));
        }
    }
}