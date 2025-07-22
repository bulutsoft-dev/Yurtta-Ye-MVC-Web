using Microsoft.AspNetCore.Mvc;
using YurttaYe.Core.Services.Interfaces;

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

            ViewBag.TotalMenus = allMenus.Count();
            ViewBag.TotalCities = allCities.Count();
            return View();
        }
    }
} 