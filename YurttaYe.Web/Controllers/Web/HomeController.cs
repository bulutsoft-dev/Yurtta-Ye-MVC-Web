using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Threading.Tasks;
using YurttaYe.Core.Models.ViewModels;

namespace YurttaYe.Web.Controllers.Web
{
    public class HomeController : Controller
    {
        private readonly IMenuService _menuService;
        private readonly ICityService _cityService;

        public HomeController(IMenuService menuService, ICityService cityService)
        {
            _menuService = menuService;
            _cityService = cityService;
        }

        public async Task<IActionResult> Index()
        {
            var model = new MenuViewModel
            {
                Cities = (await _cityService.GetAllCitiesAsync())
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name })
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Index(MenuViewModel model)
        {
            model.Cities = (await _cityService.GetAllCitiesAsync())
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });

            if (ModelState.IsValid)
            {
                try
                {
                    var menu = await _menuService.GetMenuAsync(model.CityId, model.MealType, model.Date);
                    model.Menu = menu;
                }
                catch
                {
                    model.ErrorMessage = "Menü bulunamadı.";
                }
            }
            return View(model);
        }
    }
}