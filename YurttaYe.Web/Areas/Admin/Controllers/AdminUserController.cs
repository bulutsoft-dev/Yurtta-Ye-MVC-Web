using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Localization;
using System;
using System.Linq;
using System.Threading.Tasks;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services.Interfaces;
using YurttaYe.Web.Resources;

namespace YurttaYe.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class AdminUserController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IServiceManager _serviceManager;
        private readonly IStringLocalizer<SharedControllerResources> _localizer;

        public AdminUserController(
            UserManager<IdentityUser> userManager, 
            RoleManager<IdentityRole> roleManager,
            IServiceManager serviceManager,
            IStringLocalizer<SharedControllerResources> localizer)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _serviceManager = serviceManager;
            _localizer = localizer;
        }

        public async Task<IActionResult> Index(string search)
        {
            var users = await _userManager.Users.ToListAsync();
            
            var userViewModels = new List<AdminUserViewModel>();
            
            foreach (var user in users)
            {
                var roles = await _userManager.GetRolesAsync(user);
                userViewModels.Add(new AdminUserViewModel
                {
                    Id = user.Id,
                    UserName = user.UserName ?? "",
                    Email = user.Email ?? "",
                    PhoneNumber = user.PhoneNumber,
                    EmailConfirmed = user.EmailConfirmed,
                    Roles = roles.ToList()
                });
            }

            if (!string.IsNullOrEmpty(search))
            {
                userViewModels = userViewModels
                    .Where(u => u.UserName.Contains(search, StringComparison.OrdinalIgnoreCase) ||
                               u.Email.Contains(search, StringComparison.OrdinalIgnoreCase))
                    .ToList();
                ViewBag.SearchTerm = search;
            }

            // ViewData for sidebar and breadcrumb
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            var allCities = await _serviceManager.CityService.GetAllCitiesAsync();
            ViewBag.MenuCount = allMenus.Count();
            ViewBag.CityCount = allCities.Count();
            ViewBag.UserCount = users.Count;
            
            // Breadcrumb configuration
            ViewData["BreadcrumbItems"] = new List<dynamic>
            {
                new { Text = "Kullanıcı Yönetimi", Icon = "fas fa-users", Url = (string?)null }
            };
            
            ViewData["PageActions"] = new List<dynamic>
            {
                new { 
                    Type = "link", 
                    Url = Url.Action("Create"), 
                    Text = "Yeni Kullanıcı", 
                    Icon = "fas fa-user-plus",
                    Color = "blue-600",
                    HoverColor = "blue-700"
                }
            };

            return View(userViewModels);
        }

        public async Task<IActionResult> Create()
        {
            // ViewData for sidebar
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            var allCities = await _serviceManager.CityService.GetAllCitiesAsync();
            ViewBag.MenuCount = allMenus.Count();
            ViewBag.CityCount = allCities.Count();
            
            ViewData["BreadcrumbItems"] = new List<dynamic>
            {
                new { Text = "Kullanıcı Yönetimi", Icon = "fas fa-users", Url = Url.Action("Index", "AdminUser", new { area = "Admin" }) },
                new { Text = "Yeni Kullanıcı", Icon = "fas fa-user-plus", Url = (string?)null }
            };
            
            return View(new CreateUserViewModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CreateUserViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new IdentityUser
                {
                    UserName = model.UserName,
                    Email = model.Email,
                    PhoneNumber = model.PhoneNumber,
                    EmailConfirmed = model.EmailConfirmed
                };

                var result = await _userManager.CreateAsync(user, model.Password);

                if (result.Succeeded)
                {
                    if (model.IsAdmin)
                    {
                        // Ensure Admin role exists
                        if (!await _roleManager.RoleExistsAsync("Admin"))
                        {
                            await _roleManager.CreateAsync(new IdentityRole("Admin"));
                        }
                        await _userManager.AddToRoleAsync(user, "Admin");
                    }

                    TempData["Success"] = "Kullanıcı başarıyla oluşturuldu!";
                    return RedirectToAction(nameof(Index));
                }

                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
            }

            // Re-populate ViewBag on error
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            var allCities = await _serviceManager.CityService.GetAllCitiesAsync();
            ViewBag.MenuCount = allMenus.Count();
            ViewBag.CityCount = allCities.Count();
            
            ViewData["BreadcrumbItems"] = new List<dynamic>
            {
                new { Text = "Kullanıcı Yönetimi", Icon = "fas fa-users", Url = Url.Action("Index", "AdminUser", new { area = "Admin" }) },
                new { Text = "Yeni Kullanıcı", Icon = "fas fa-user-plus", Url = (string?)null }
            };
            
            TempData["Error"] = "Kullanıcı oluşturulurken bir hata oluştu.";
            return View(model);
        }

        public async Task<IActionResult> Edit(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return NotFound();
            }

            var user = await _userManager.FindByIdAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            var roles = await _userManager.GetRolesAsync(user);
            
            var model = new EditUserViewModel
            {
                Id = user.Id,
                UserName = user.UserName ?? "",
                Email = user.Email ?? "",
                PhoneNumber = user.PhoneNumber,
                EmailConfirmed = user.EmailConfirmed,
                IsAdmin = roles.Contains("Admin")
            };

            // ViewData for sidebar
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            var allCities = await _serviceManager.CityService.GetAllCitiesAsync();
            ViewBag.MenuCount = allMenus.Count();
            ViewBag.CityCount = allCities.Count();
            
            ViewData["BreadcrumbItems"] = new List<dynamic>
            {
                new { Text = "Kullanıcı Yönetimi", Icon = "fas fa-users", Url = Url.Action("Index", "AdminUser", new { area = "Admin" }) },
                new { Text = "Kullanıcı Düzenle", Icon = "fas fa-user-edit", Url = (string?)null }
            };

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(EditUserViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await _userManager.FindByIdAsync(model.Id);
                if (user == null)
                {
                    return NotFound();
                }

                user.UserName = model.UserName;
                user.Email = model.Email;
                user.PhoneNumber = model.PhoneNumber;
                user.EmailConfirmed = model.EmailConfirmed;

                var result = await _userManager.UpdateAsync(user);

                if (result.Succeeded)
                {
                    // Handle Admin role
                    var isCurrentlyAdmin = await _userManager.IsInRoleAsync(user, "Admin");
                    
                    if (model.IsAdmin && !isCurrentlyAdmin)
                    {
                        if (!await _roleManager.RoleExistsAsync("Admin"))
                        {
                            await _roleManager.CreateAsync(new IdentityRole("Admin"));
                        }
                        await _userManager.AddToRoleAsync(user, "Admin");
                    }
                    else if (!model.IsAdmin && isCurrentlyAdmin)
                    {
                        await _userManager.RemoveFromRoleAsync(user, "Admin");
                    }

                    // Handle password change
                    if (!string.IsNullOrEmpty(model.NewPassword))
                    {
                        var token = await _userManager.GeneratePasswordResetTokenAsync(user);
                        var passwordResult = await _userManager.ResetPasswordAsync(user, token, model.NewPassword);
                        
                        if (!passwordResult.Succeeded)
                        {
                            foreach (var error in passwordResult.Errors)
                            {
                                ModelState.AddModelError(string.Empty, error.Description);
                            }
                            
                            // Re-populate ViewBag
                            await PopulateViewBagAsync();
                            return View(model);
                        }
                    }

                    TempData["Success"] = "Kullanıcı başarıyla güncellendi!";
                    return RedirectToAction(nameof(Index));
                }

                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
            }

            await PopulateViewBagAsync();
            TempData["Error"] = "Kullanıcı güncellenirken bir hata oluştu.";
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return Json(new { success = false, message = "Kullanıcı bulunamadı." });
            }

            var user = await _userManager.FindByIdAsync(id);
            if (user == null)
            {
                return Json(new { success = false, message = "Kullanıcı bulunamadı." });
            }

            // Prevent self-deletion
            var currentUser = await _userManager.GetUserAsync(User);
            if (currentUser?.Id == id)
            {
                return Json(new { success = false, message = "Kendinizi silemezsiniz!" });
            }

            var result = await _userManager.DeleteAsync(user);
            
            if (result.Succeeded)
            {
                return Json(new { success = true, message = "Kullanıcı başarıyla silindi." });
            }

            return Json(new { success = false, message = "Kullanıcı silinirken bir hata oluştu." });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ToggleEmailConfirmed(string id)
        {
            var user = await _userManager.FindByIdAsync(id);
            if (user == null)
            {
                return Json(new { success = false, message = "Kullanıcı bulunamadı." });
            }

            user.EmailConfirmed = !user.EmailConfirmed;
            var result = await _userManager.UpdateAsync(user);
            
            if (result.Succeeded)
            {
                return Json(new { 
                    success = true, 
                    message = user.EmailConfirmed ? "E-posta onaylandı." : "E-posta onayı kaldırıldı.",
                    emailConfirmed = user.EmailConfirmed
                });
            }

            return Json(new { success = false, message = "İşlem başarısız." });
        }

        private async Task PopulateViewBagAsync()
        {
            var allMenus = await _serviceManager.MenuService.GetAllMenusAsync();
            var allCities = await _serviceManager.CityService.GetAllCitiesAsync();
            ViewBag.MenuCount = allMenus.Count();
            ViewBag.CityCount = allCities.Count();
            
            ViewData["BreadcrumbItems"] = new List<dynamic>
            {
                new { Text = "Kullanıcı Yönetimi", Icon = "fas fa-users", Url = Url.Action("Index", "AdminUser", new { area = "Admin" }) },
                new { Text = "Kullanıcı Düzenle", Icon = "fas fa-user-edit", Url = (string?)null }
            };
        }
    }
}
