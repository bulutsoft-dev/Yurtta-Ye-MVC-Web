using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services.Interfaces;
using System;

namespace YurttaYe.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
        private readonly IServiceManager _serviceManager;
        private readonly UserManager<IdentityUser> _userManager;

        public HomeController(IServiceManager serviceManager, UserManager<IdentityUser> userManager)
        {
            _serviceManager = serviceManager;
            _userManager = userManager;
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
                    Location = "Merkez Kampüs", // Placeholder as no location data in entity
                    MealType = m.MealType,
                    Date = m.Date,
                    MenuContent = string.Join(", ", m.Items.Select(i => i.Name))
                }).ToList()
            };

            // ViewData'ları sidebar ve breadcrumb için ayarla
            ViewBag.MenuCount = allMenus.Count();
            ViewBag.CityCount = allCities.Count();
            ViewBag.UserCount = await _userManager.Users.CountAsync();
            
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

        [HttpGet]
        public async Task<IActionResult> GetChartData(string period = "6months")
        {
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            
            // Determine date range based on period
            var endDate = DateTime.Now;
            var startDate = period == "1year" ? endDate.AddMonths(-12) : endDate.AddMonths(-6);
            
            // Group menus by month and meal type
            var menusByMonth = allMenus
                .Where(m => m.Date >= startDate && m.Date <= endDate)
                .GroupBy(m => new { m.Date.Year, m.Date.Month })
                .OrderBy(g => g.Key.Year)
                .ThenBy(g => g.Key.Month)
                .Select(g => new 
                {
                    Month = new DateTime(g.Key.Year, g.Key.Month, 1).ToString("MMM"),
                    Breakfast = g.Count(m => m.MealType == "Kahvaltı"),
                    Dinner = g.Count(m => m.MealType == "Akşam Yemeği")
                })
                .ToList();

            return Json(new 
            {
                labels = menusByMonth.Select(m => m.Month).ToList(),
                breakfast = menusByMonth.Select(m => m.Breakfast).ToList(),
                dinner = menusByMonth.Select(m => m.Dinner).ToList()
            });
        }

        [HttpGet]
        public async Task<IActionResult> GetTodayMenuCount()
        {
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            var todayCount = allMenus.Count(m => m.Date.Date == DateTime.Today);
            
            return Json(new { count = todayCount });
        }
    }
}
