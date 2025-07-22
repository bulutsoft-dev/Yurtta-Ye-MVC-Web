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

            // ViewData'ları sidebar ve breadcrumb için ayarla
            ViewBag.MenuCount = allMenus.Count();
            ViewBag.CityCount = allCities.Count();
            
            // Breadcrumb için
            ViewData["BreadcrumbItems"] = new List<dynamic>
            {
                new { Text = "Ana Sayfa", Icon = "fas fa-home", Url = (string)null }
            };
            
            // Page actions
            ViewData["PageActions"] = new List<dynamic>
            {
                new { 
                    Type = "link", 
                    Url = Url.Action("Create", "AdminMenu"), 
                    Text = "Yeni Menü", 
                    Icon = "fas fa-plus",
                    Color = "blue-600",
                    HoverColor = "blue-700"
                },
                new { 
                    Type = "link", 
                    Url = Url.Action("Create", "AdminCity"), 
                    Text = "Yeni Şehir", 
                    Icon = "fas fa-map-marker-alt",
                    Color = "green-600",
                    HoverColor = "green-700"
                }
            };

            return View(model);
        }
    }
}
