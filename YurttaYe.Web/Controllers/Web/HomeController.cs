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
            var breakfastHours = _configuration["Defaults:BreakfastHours"] ?? "23:30-12:00";
            var dinnerHours = _configuration["Defaults:DinnerHours"] ?? "12:00-23:30";

            // Parse time ranges
            string mealType = "Kahvaltı"; // Fallback
            try
            {
                var now = DateTime.Now.TimeOfDay;

                // Parse breakfast hours (e.g., "00:00-12:00")
                var breakfastRange = breakfastHours.Split('-');
                var breakfastStart = TimeSpan.Parse(breakfastRange[0]);
                var breakfastEnd = TimeSpan.Parse(breakfastRange[1]);

                // Parse dinner hours (e.g., "12:00-23:30")
                var dinnerRange = dinnerHours.Split('-');
                var dinnerStart = TimeSpan.Parse(dinnerRange[0]);
                var dinnerEnd = TimeSpan.Parse(dinnerRange[1]);

                // Determine meal type based on current time
                if (now >= breakfastStart && now <= breakfastEnd)
                {
                    mealType = "Kahvaltı";
                }
                else if (now >= dinnerStart && now <= dinnerEnd)
                {
                    mealType = "Akşam Yemeği";
                }
            }
            catch
            {
                // Fallback to Breakfast if parsing fails
                mealType = "Kahvaltı";
            }

            var model = new MenuViewModel
            {
                Cities = cities.Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name }),
                CityId = cities.FirstOrDefault(c => c.Name.Equals(defaultCity, StringComparison.OrdinalIgnoreCase))?.Id ?? 0,
                MealType = mealType,
                Date = DateTime.Today
            };

            // Fetch menu data if CityId is valid
            if (model.CityId > 0)
            {
                try
                {
                    var menu = await _menuService.GetMenuAsync(model.CityId, model.MealType, model.Date);
                    model.Menu = menu;
                }
                catch
                {
                    model.ErrorMessage = "Menü bulunamadı.";
                }
            }

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Index(MenuViewModel model)
        {
            model.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });

            if (ModelState.IsValid)
            {
                try
                {
                    var menu = await _menuService.GetMenuAsync(model.CityId, model.MealType, model.Date);
                    model.Menu = menu;
                }
                catch
                {
                    model.ErrorMessage = "Menü bulunamadı.";
                }
            }
            return View(model);
        }
    }
}