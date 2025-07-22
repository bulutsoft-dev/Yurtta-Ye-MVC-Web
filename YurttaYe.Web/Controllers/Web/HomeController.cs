using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using System;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Localization;
using System.Diagnostics;
using YurttaYe.Core.Models.Dtos;


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
            var cityList = cities.Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name }).ToList();
            cityList.Insert(0, new SelectListItem { Value = "0", Text = "Şehir Seçin" });

            // Read default city from configuration
            var defaultCityName = _configuration["Defaults:City"] ?? "Manisa";
            var defaultCityId = cities.FirstOrDefault(c => c.Name.Equals(defaultCityName, StringComparison.OrdinalIgnoreCase))?.Id ?? 0;
            
            var today = DateTime.Today;
            var mealType = GetDefaultMealType();

            var model = new MenuViewModel
            {
                Cities = cityList,
                CityId = defaultCityId,
                MealType = mealType,
                Date = today
            };

            if (model.CityId > 0)
            {
                try
                {
                    var breakfastMenuEntity = await _menuService.GetMenuAsync(model.CityId, "Kahvaltı", model.Date);
                    if (breakfastMenuEntity != null)
                    {
                        model.BreakfastMenu = new MenuDto
                        {
                            Items = breakfastMenuEntity.Items.Select(i => new MenuItemDto { Category = i.Category, Name = i.Name, Gram = i.Gram }).ToList(),
                            Energy = breakfastMenuEntity.Energy
                        };
                    }
                }
                catch { model.BreakfastMenu = null; }

                try
                {
                    var dinnerMenuEntity = await _menuService.GetMenuAsync(model.CityId, "Akşam Yemeği", model.Date);
                    if (dinnerMenuEntity != null)
                    {
                        model.DinnerMenu = new MenuDto
                        {
                            Items = dinnerMenuEntity.Items.Select(i => new MenuItemDto { Category = i.Category, Name = i.Name, Gram = i.Gram }).ToList(),
                            Energy = dinnerMenuEntity.Energy
                        };
                    }
                }
                catch { model.DinnerMenu = null; }
            }

            ViewData["TimeOfDayTheme"] = GetThemeForMealType(mealType);
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Index(MenuViewModel model)
        {
            var cities = await _cityService.GetAllCitiesAsync();
            var cityList = cities.Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name }).ToList();
            cityList.Insert(0, new SelectListItem { Value = "0", Text = "Şehir Seçin" });
            model.Cities = cityList;

            if (model.CityId == 0)
            {
                var defaultCityName = _configuration["Defaults:City"] ?? "Manisa";
                model.CityId = cities.FirstOrDefault(c => c.Name.Equals(defaultCityName, StringComparison.OrdinalIgnoreCase))?.Id ?? 0;
            }

            if (model.Date == DateTime.MinValue) model.Date = DateTime.Today;
            if (string.IsNullOrEmpty(model.MealType)) model.MealType = GetDefaultMealType();
            
            if (model.CityId > 0)
            {
                try
                {
                    var breakfastMenu = await _menuService.GetMenuAsync(model.CityId, "Kahvaltı", model.Date);
                    if(breakfastMenu != null)
                    {
                        model.BreakfastMenu = new MenuDto
                        {
                            Items = breakfastMenu.Items.Select(i => new MenuItemDto { Category = i.Category, Name = i.Name, Gram = i.Gram }).ToList(),
                            Energy = breakfastMenu.Energy
                        };
                    }
                    var dinnerMenu = await _menuService.GetMenuAsync(model.CityId, "Akşam Yemeği", model.Date);
                    if(dinnerMenu != null)
                    {
                        model.DinnerMenu = new MenuDto
                        {
                            Items = dinnerMenu.Items.Select(i => new MenuItemDto { Category = i.Category, Name = i.Name, Gram = i.Gram }).ToList(),
                            Energy = dinnerMenu.Energy
                        };
                    }

                    if (model.BreakfastMenu == null && model.DinnerMenu == null)
                    {
                        model.ErrorMessage = "Bu tarih ve şehir için menü bulunamadı.";
                    }
                }
                catch (Exception)
                {
                    model.ErrorMessage = "Menü getirilirken bir hata oluştu.";
                    model.BreakfastMenu = null;
                    model.DinnerMenu = null;
                }
            }

            ViewData["TimeOfDayTheme"] = GetThemeForMealType(model.MealType);
            return View(model);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        
        [HttpGet]
        public IActionResult SetLanguage(string culture, string returnUrl)
        {
            Response.Cookies.Append(
                CookieRequestCultureProvider.DefaultCookieName,
                CookieRequestCultureProvider.MakeCookieValue(new RequestCulture(culture)),
                new CookieOptions { Expires = DateTimeOffset.UtcNow.AddYears(1) }
            );

            return LocalRedirect(returnUrl);
        }

        private string GetThemeForMealType(string? mealType)
        {
            if (!string.IsNullOrEmpty(mealType) && mealType == "Breakfast")
            {
                return "morning";
            }
            return "evening";
        }

        private string GetDefaultMealType()
        {
            var now = DateTime.Now.Hour;
            if (now >= 5 && now < 14) // 05:00 - 13:59 arasını kahvaltı olarak kabul edelim
            {
                return "Breakfast";
            }
            return "Dinner";
        }
    }
}