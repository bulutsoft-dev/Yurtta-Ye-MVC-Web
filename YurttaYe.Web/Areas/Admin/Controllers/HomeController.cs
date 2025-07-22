using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services.Interfaces;
using System;


    [Area("Admin")]
    public class HomeController : Controller
    {
        private readonly IServiceManager _serviceManager;

        public HomeController(IServiceManager serviceManager)
        {
            _serviceManager = serviceManager;
        }

        public async Task<IActionResult> Index()
        {
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            var allCities = await _serviceManager.CityService.GetAllCitiesAsync();
            var recentMenus = await _serviceManager.MenuService.GetRecentMenusAsync(5);

            var model = new DashboardViewModel
            {
                TotalMenus = allMenus.Count(),
                TotalCities = allCities.Count(),
                RecentMenus = recentMenus.Select(m => new RecentMenuViewModel
                {
                    Id = m.Id,
                    CityName = m.City.Name,
                    MealType = m.MealType,
                    Date = m.Date
                }).ToList()
            };

            return View(model);
        }
    }