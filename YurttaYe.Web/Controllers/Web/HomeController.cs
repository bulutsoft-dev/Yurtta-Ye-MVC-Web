using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using System;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;

namespace YurttaYe.Web.Controllers.Web
{
    public class HomeController : Controller
    {
        private readonly IMenuService _menuService;
        private readonly ICityService _cityService;
        private readonly IConfiguration _configuration;

        public HomeController(IMenuService menuService, ICityService cityService, IConfiguration configuration)
        {
            _menuService = menuService;
            _cityService = cityService;
            _configuration = configuration;
        }

        public async Task<IActionResult> Index()
        {
            var cities = await _cityService.GetAllCitiesAsync();

            // Read defaults from configuration
            var defaultCity = _configuration["Defaults:City"] ?? "Manisa";
            var defaultCityId = cities.FirstOrDefault(c => c.Name.Equals(defaultCity, StringComparison.OrdinalIgnoreCase))?.Id ?? 0;
            var today = DateTime.Today;

            var model = new MenuViewModel
            {
                Cities = cities.Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name }),
                CityId = defaultCityId,
                MealType = "Kahvaltı", // Geri uyumluluk için
                Date = today
            };

            if (model.CityId > 0)
            {
                try
                {
                    model.BreakfastMenu = await _menuService.GetMenuAsync(model.CityId, "Kahvaltı", model.Date);
                }
                catch { model.BreakfastMenu = null; }
                try
                {
                    model.DinnerMenu = await _menuService.GetMenuAsync(model.CityId, "Akşam Yemeği", model.Date);
                }
                catch { model.DinnerMenu = null; }
                // Geri uyumluluk için mevcut MealType'a göre Menu property’sini doldur
                model.Menu = model.MealType == "Kahvaltı" ? model.BreakfastMenu : model.DinnerMenu;
            }

            ViewData["TimeOfDayTheme"] = GetTimeOfDayTheme();
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Index(MenuViewModel model)
        {
            var cities = await _cityService.GetAllCitiesAsync();
            model.Cities = new SelectList(cities, "Id", "Name");

            if (ModelState.IsValid)
            {
                try
                {
                    model.BreakfastMenu = await _menuService.GetMenuAsync(model.CityId, "Kahvaltı", model.Date);
                }
                catch { model.BreakfastMenu = null; }
                try
                {
                    model.DinnerMenu = await _menuService.GetMenuAsync(model.CityId, "Akşam Yemeği", model.Date);
                }
                catch { model.DinnerMenu = null; }
                // Geri uyumluluk için mevcut MealType'a göre Menu property’sini doldur
                model.Menu = model.MealType == "Kahvaltı" ? model.BreakfastMenu : model.DinnerMenu;

                if (model.BreakfastMenu == null && model.DinnerMenu == null)
                {
                    model.ErrorMessage = "Bu tarih ve şehir için menü bulunamadı.";
                }
            }

            ViewData["TimeOfDayTheme"] = GetTimeOfDayTheme(model.MealType);
            return View(model);
        }

        private string GetTimeOfDayTheme(string mealType = null)
        {
            if (!string.IsNullOrEmpty(mealType))
            {
                return mealType == "Kahvaltı" ? "morning" : "evening";
            }

            var now = DateTime.Now.Hour;
            if (now >= 5 && now < 12) return "morning";
            return "evening";
        }
    }
}