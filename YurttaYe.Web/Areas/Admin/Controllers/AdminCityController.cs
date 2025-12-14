using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
        private readonly UserManager<IdentityUser> _userManager;

        public AdminCityController(IServiceManager serviceManager, IStringLocalizer<SharedControllerResources> localizer, UserManager<IdentityUser> userManager)
        {
            _serviceManager = serviceManager;
            _localizer = localizer;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index(string search)
        {
            var cities = await _serviceManager.CityService.GetAllCitiesAsync();
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            
            var model = cities.Select(c => new AdminCityViewModel 
            { 
                Id = c.Id, 
                Name = c.Name,
                MenuCount = allMenus.Count(m => m.CityId == c.Id),
                CreatedDate = DateTime.Now.AddDays(-new Random().Next(1, 365)) // Simulated created date
            });

            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(c => c.Name.Contains(search, StringComparison.OrdinalIgnoreCase));
                ViewBag.SearchTerm = search;
            }

            // ViewData for sidebar and breadcrumb
            ViewBag.MenuCount = allMenus.Count();
            ViewBag.CityCount = cities.Count();
            ViewBag.UserCount = await _userManager.Users.CountAsync();
            
            // Breadcrumb configuration
            ViewData["BreadcrumbItems"] = new List<dynamic>
            {
                new { Text = "Şehir Yönetimi", Icon = "fas fa-city", Url = (string)null }
            };

            return View(model.ToList());
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> BulkDelete([FromBody] List<int> ids)
        {
            if (ids == null || !ids.Any())
            {
                return Json(new { success = false, message = "Silinecek şehir seçilmedi." });
            }

            try
            {
                int deletedCount = 0;
                foreach (var id in ids)
                {
                    try
                    {
                        await _serviceManager.CityService.DeleteCityAsync(id);
                        deletedCount++;
                    }
                    catch
                    {
                        // Log error but continue with other deletions
                    }
                }
                
                return Json(new { 
                    success = true, 
                    message = $"{deletedCount} şehir başarıyla silindi.",
                    deletedCount = deletedCount 
                });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Şehirler silinirken bir hata oluştu." });
            }
        }

        // Details method for modal display
        public async Task<IActionResult> Details(int id)
        {
            var city = await _serviceManager.CityService.GetCityByIdAsync(id);
            if (city == null)
            {
                return NotFound();
            }

            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            var cityMenus = allMenus.Where(m => m.CityId == id).ToList();

            var model = new AdminCityViewModel
            {
                Id = city.Id,
                Name = city.Name,
                MenuCount = cityMenus.Count,
                CreatedDate = DateTime.Now.AddDays(-new Random().Next(1, 365))
            };

            ViewBag.RecentMenus = cityMenus.OrderByDescending(m => m.Date).Take(5).ToList();
            ViewBag.BreakfastCount = cityMenus.Count(m => m.MealType == "Kahvaltı");
            ViewBag.DinnerCount = cityMenus.Count(m => m.MealType == "Akşam Yemeği");

            return PartialView("_CityDetails", model);
        }
    }
}