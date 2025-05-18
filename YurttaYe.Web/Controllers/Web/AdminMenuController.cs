using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;
using System.IO;
using OfficeOpenXml;

namespace YurttaYe.Web.Controllers.Web
{
    [Authorize(Roles = "Admin")]
    public class AdminMenuController : Controller
    {
        private readonly IMenuService _menuService;
        private readonly ICityService _cityService;

        public AdminMenuController(IMenuService menuService, ICityService cityService)
        {
            _menuService = menuService;
            _cityService = cityService;
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

            // Filtreleme
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
                new SelectListItem { Value = "Breakfast", Text = "Sabah" },
                new SelectListItem { Value = "Dinner", Text = "Akşam" }
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
                TempData["Success"] = "Menü başarıyla eklendi.";
                return RedirectToAction(nameof(Index));
            }

            model.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
            TempData["Error"] = "Lütfen tüm alanları doğru doldurun.";
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
                TempData["Success"] = "Menü başarıyla güncellendi.";
                return RedirectToAction(nameof(Index));
            }

            model.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
            TempData["Error"] = "Lütfen tüm alanları doğru doldurun.";
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                await _menuService.DeleteMenuAsync(id);
                TempData["Success"] = "Menü başarıyla silindi.";
            }
            catch
            {
                TempData["Error"] = "Menü silinirken hata oluştu.";
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
                TempData["Error"] = "Lütfen bir dosya seçin.";
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

                    var menu = new Menu
                    {
                        CityId = city.Id,
                        MealType = worksheet.Cells[row, 2].Value?.ToString(),
                        Date = DateTime.Parse(worksheet.Cells[row, 3].Value?.ToString()),
                        Energy = worksheet.Cells[row, 4].Value?.ToString(),
                        Items = new List<MenuItem>()
                    };

                    // Örnek: 5. sütundan itibaren yemek öğeleri (kategori, isim, gramaj)
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

                TempData["Success"] = "Menüler başarıyla yüklendi.";
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