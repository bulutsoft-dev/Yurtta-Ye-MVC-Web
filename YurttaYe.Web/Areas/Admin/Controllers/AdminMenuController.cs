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
using YurttaYe.Web.Resources;

namespace YurttaYe.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class AdminMenuController : Controller
    {
        private readonly IMenuService _menuService;
        private readonly ICityService _cityService;
        private readonly IStringLocalizer<SharedControllerResources> _localizer;

        public AdminMenuController(IMenuService menuService, ICityService cityService, IStringLocalizer<SharedControllerResources> localizer)
        {
            _menuService = menuService;
            _cityService = cityService;
            _localizer = localizer;
        }

        public async Task<IActionResult> Index(string cityFilter, string mealTypeFilter, string dateFilter)
        {
            var menus = await _menuService.GetAllMenusAsync();
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
            if (!string.IsNullOrEmpty(dateFilter) && DateTime.TryParse(dateFilter, out var date))
                model = model.Where(m => m.Date.Date == date.Date);

            ViewBag.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Name, Text = c.Name });
            ViewBag.MealTypes = new List<SelectListItem>
            {
                new SelectListItem { Value = "Breakfast", Text = _localizer["Morning"] },
                new SelectListItem { Value = "Dinner", Text = _localizer["Evening"] }
            };

            return View(model);
        }

        public async Task<IActionResult> Create()
        {
            var model = new AdminMenuViewModel
            {
                Cities = (await _cityService.GetAllCitiesAsync())
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
                await _menuService.AddMenuAsync(menu);
                TempData["Success"] = string.Format(_localizer["EntityAddedSuccessfully"], _localizer["Menu"]);
                return RedirectToAction(nameof(Index));
            }

            model.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
            TempData["Error"] = _localizer["ValidationError"];
            return View(model);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var menu = await _menuService.GetMenuByIdAsync(id);
            if (menu == null) return NotFound();

            var model = new AdminMenuViewModel
            {
                Id = menu.Id,
                CityId = menu.CityId,
                MealType = menu.MealType,
                Date = menu.Date,
                Energy = menu.Energy,
                Cities = (await _cityService.GetAllCitiesAsync())
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
                await _menuService.UpdateMenuAsync(menu);
                TempData["Success"] = string.Format(_localizer["EntityUpdatedSuccessfully"], _localizer["Menu"]);
                return RedirectToAction(nameof(Index));
            }

            model.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
            TempData["Error"] = _localizer["ValidationError"];
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                await _menuService.DeleteMenuAsync(id);
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

                var cities = await _cityService.GetAllCitiesAsync();
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

                    await _menuService.AddMenuAsync(menu);
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
    }
}