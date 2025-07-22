using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services.Interfaces;
using System;

namespace YurttaYe.Web.Areas.Admin.Controllers
{
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

            var today = DateTime.Today;
            var last7Days = Enumerable.Range(0, 7).Select(i => today.AddDays(-i)).ToList();
            var menuCounts = allMenus
                .Where(m => m.Date >= today.AddDays(-6))
                .GroupBy(m => m.Date.Date)
                .ToDictionary(g => g.Key, g => g.Count());

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
                }).ToList(),
                ChartLabels = last7Days.Select(d => d.ToString("dd.MM")).Reverse().ToList(),
                ChartData = last7Days.Select(d => menuCounts.GetValueOrDefault(d, 0)).Reverse().ToList()
            };

            return View(model);
        }
    }
} 