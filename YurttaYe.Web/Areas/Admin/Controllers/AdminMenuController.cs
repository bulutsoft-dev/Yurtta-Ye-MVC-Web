using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Localization;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;
using System.IO;
using OfficeOpenXml;
using YurttaYe.Core.Services.Interfaces;
using YurttaYe.Web.Resources;

namespace YurttaYe.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class AdminMenuController : Controller
    {
        private readonly IServiceManager _serviceManager;
        private readonly IStringLocalizer<SharedControllerResources> _localizer;

        public AdminMenuController(IServiceManager serviceManager, IStringLocalizer<SharedControllerResources> localizer)
        {
            _serviceManager = serviceManager;
            _localizer = localizer;
        }

        public async Task<IActionResult> Index(string cityFilter, string mealTypeFilter, string dateFilter)
        {
            var menus = await _serviceManager.MenuService.GetAllMenusAsync();
            var allCities = await _serviceManager.CityService.GetAllCitiesAsync();
            
            var model = menus.Select(m => new AdminMenuViewModel
            {
                Id = m.Id,
                CityName = m.City.Name,
                MealType = m.MealType,
                Date = m.Date,
                Energy = m.Energy,
                Items = m.Items.Select(i => new AdminMenuItemViewModel
                {
                    Category = i.Category,
                    Name = i.Name,
                    Gram = i.Gram
                }).ToList()
            });

            if (!string.IsNullOrEmpty(cityFilter))
                model = model.Where(m => m.CityName.Contains(cityFilter, StringComparison.OrdinalIgnoreCase));
            if (!string.IsNullOrEmpty(mealTypeFilter))
                model = model.Where(m => m.MealType == mealTypeFilter);
            if (dateFilter != null && DateTime.TryParse(dateFilter, out var date))
                model = model.Where(m => m.Date.Date == date.Date);

            // ViewData for sidebar and breadcrumb
            ViewBag.MenuCount = menus.Count();
            ViewBag.CityCount = allCities.Count();
            
            // Breadcrumb configuration
            ViewData["BreadcrumbItems"] = new List<dynamic>
            {
                new { Text = "Menü Yönetimi", Icon = "fas fa-utensils", Url = (string)null }
            };
            
            // Page actions
            ViewData["PageActions"] = new List<dynamic>
            {
                new { 
                    Type = "link", 
                    Url = Url.Action("Create"), 
                    Text = "Yeni Menü Ekle", 
                    Icon = "fas fa-plus",
                    Color = "blue-600",
                    HoverColor = "blue-700"
                },
                new { 
                    Type = "dropdown", 
                    Text = "İşlemler", 
                    Icon = "fas fa-cog",
                    Id = "menu-actions-dropdown",
                    Items = new List<dynamic>
                    {
                        new { Text = "Excel'e Aktar", Icon = "fas fa-file-excel", Url = Url.Action("ExportToExcel") },
                        new { Text = "Toplu Silme", Icon = "fas fa-trash", Url = "#" },
                        new { Text = "Filtreleri Temizle", Icon = "fas fa-filter", Url = Url.Action("Index") }
                    }
                }
            };

            ViewBag.Cities = allCities.Select(c => new SelectListItem { Value = c.Name, Text = c.Name });
            ViewBag.MealTypes = new List<SelectListItem>
            {
                new SelectListItem { Value = "Kahvaltı", Text = _localizer["Morning"] },
                new SelectListItem { Value = "Akşam Yemeği", Text = _localizer["Evening"] }
            };

            return View(model.ToList());
        }

        public async Task<IActionResult> Create()
        {
            var model = new AdminMenuViewModel
            {
                Cities = (await _serviceManager.CityService.GetAllCitiesAsync())
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name }),
                Items = new List<AdminMenuItemViewModel> { new AdminMenuItemViewModel() }
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Create(AdminMenuViewModel model)
        {
            if (ModelState.IsValid)
            {
                var menu = new Menu
                {
                    CityId = model.CityId,
                    MealType = model.MealType,
                    Date = model.Date,
                    Energy = model.Energy,
                    Items = model.Items.Select(i => new MenuItem
                    {
                        Category = i.Category,
                        Name = i.Name,
                        Gram = i.Gram
                    }).ToList()
                };
                await _serviceManager.MenuService.AddMenuAsync(menu);
                TempData["Success"] = string.Format(_localizer["EntityAddedSuccessfully"], _localizer["Menu"]);
                return RedirectToAction(nameof(Index));
            }

            model.Cities = (await _serviceManager.CityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
            TempData["Error"] = _localizer["ValidationError"];
            return View(model);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var menu = await _serviceManager.MenuService.GetMenuByIdAsync(id);
            if (menu == null) return NotFound();

            var model = new AdminMenuViewModel
            {
                Id = menu.Id,
                CityId = menu.CityId,
                MealType = menu.MealType,
                Date = menu.Date,
                Energy = menu.Energy,
                Cities = (await _serviceManager.CityService.GetAllCitiesAsync())
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name }),
                Items = menu.Items.Select(i => new AdminMenuItemViewModel
                {
                    Category = i.Category,
                    Name = i.Name,
                    Gram = i.Gram
                }).ToList()
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(AdminMenuViewModel model)
        {
            if (ModelState.IsValid)
            {
                var menu = new Menu
                {
                    Id = model.Id,
                    CityId = model.CityId,
                    MealType = model.MealType,
                    Date = model.Date,
                    Energy = model.Energy,
                    Items = model.Items.Select(i => new MenuItem
                    {
                        Category = i.Category,
                        Name = i.Name,
                        Gram = i.Gram
                    }).ToList()
                };
                await _serviceManager.MenuService.UpdateMenuAsync(menu);
                TempData["Success"] = string.Format(_localizer["EntityUpdatedSuccessfully"], _localizer["Menu"]);
                return RedirectToAction(nameof(Index));
            }

            model.Cities = (await _serviceManager.CityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
            TempData["Error"] = _localizer["ValidationError"];
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                await _serviceManager.MenuService.DeleteMenuAsync(id);
                TempData["Success"] = string.Format(_localizer["EntityDeletedSuccessfully"], _localizer["Menu"]);
            }
            catch
            {
                TempData["Error"] = string.Format(_localizer["DeletionError"], _localizer["Menu"]);
            }
            return RedirectToAction(nameof(Index));
        }

        public IActionResult Upload()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            if (file == null || file.Length == 0)
            {
                TempData["Error"] = _localizer["PleaseSelectFile"];
                return View();
            }

            try
            {
                using var stream = new MemoryStream();
                await file.CopyToAsync(stream);
                using var package = new ExcelPackage(stream);
                var worksheet = package.Workbook.Worksheets[0];
                var rowCount = worksheet.Dimension.Rows;

                var cities = await _serviceManager.CityService.GetAllCitiesAsync();
                for (int row = 2; row <= rowCount; row++)
                {
                    var cityName = worksheet.Cells[row, 1].Value?.ToString();
                    var city = cities.FirstOrDefault(c => c.Name == cityName);
                    if (city == null) continue;

                    if (!DateTime.TryParse(worksheet.Cells[row, 3].Value?.ToString(), out var date))
                    {
                        continue; // Tarih dönüştürülemezse bu satırı atla
                    }
                    
                    var menu = new Menu
                    {
                        CityId = city.Id,
                        MealType = worksheet.Cells[row, 2].Value?.ToString() ?? "",
                        Date = date,
                        Energy = worksheet.Cells[row, 4].Value?.ToString() ?? "",
                        Items = new List<MenuItem>()
                    };

                    for (int col = 5; col <= worksheet.Dimension.Columns; col += 3)
                    {
                        var category = worksheet.Cells[row, col].Value?.ToString();
                        var name = worksheet.Cells[row, col + 1].Value?.ToString();
                        var gram = worksheet.Cells[row, col + 2].Value?.ToString();
                        if (!string.IsNullOrEmpty(category) && !string.IsNullOrEmpty(name))
                        {
                            menu.Items.Add(new MenuItem
                            {
                                Category = category,
                                Name = name,
                                Gram = gram ?? ""
                            });
                        }
                    }

                    await _serviceManager.MenuService.AddMenuAsync(menu);
                }

                TempData["Success"] = string.Format(_localizer["UploadSuccess"], _localizer["Menus"]);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["Error"] = $"Hata: {ex.Message}";
                return View();
            }
        }

        // Search endpoint for global search functionality
        [HttpGet]
        public async Task<IActionResult> Search(string q)
        {
            if (string.IsNullOrWhiteSpace(q) || q.Length < 2)
            {
                return Json(new List<object>());
            }

            var results = new List<object>();

            try
            {
                // Search in menus
                var menus = await _serviceManager.MenuService.GetAllMenusAsync();
                var menuResults = menus
                    .Where(m => m.City.Name.Contains(q, StringComparison.OrdinalIgnoreCase) || 
                               m.MealType.Contains(q, StringComparison.OrdinalIgnoreCase))
                    .Take(5)
                    .Select(m => new
                    {
                        title = $"{m.City.Name} - {m.MealType}",
                        description = $"{m.Date:dd.MM.yyyy} - {m.Energy} kcal",
                        url = Url.Action("Details", "AdminMenu", new { id = m.Id }),
                        icon = "fas fa-utensils",
                        type = "Menü"
                    });

                results.AddRange(menuResults);

                // Search in cities
                var cities = await _serviceManager.CityService.GetAllCitiesAsync();
                var cityResults = cities
                    .Where(c => c.Name.Contains(q, StringComparison.OrdinalIgnoreCase))
                    .Take(3)
                    .Select(c => new
                    {
                        title = c.Name,
                        description = "Şehir",
                        url = Url.Action("Details", "AdminCity", new { id = c.Id }),
                        icon = "fas fa-city",
                        type = "Şehir"
                    });

                results.AddRange(cityResults);

                return Json(results);
            }
            catch (Exception ex)
            {
                return Json(new { error = "Arama sırasında hata oluştu" });
            }
        }

        // Details method for modal display
        public async Task<IActionResult> Details(int id)
        {
            var menu = await _serviceManager.MenuService.GetMenuByIdAsync(id);
            if (menu == null) 
            {
                return NotFound();
            }

            var model = new AdminMenuViewModel
            {
                Id = menu.Id,
                CityName = menu.City.Name,
                MealType = menu.MealType,
                Date = menu.Date,
                Energy = menu.Energy,
                Items = menu.Items.Select(i => new AdminMenuItemViewModel
                {
                    Category = i.Category,
                    Name = i.Name,
                    Gram = i.Gram
                }).ToList()
            };

            return PartialView("_MenuDetails", model);
        }
    }
}
