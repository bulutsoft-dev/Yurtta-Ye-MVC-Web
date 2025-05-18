using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using YurttaYe.Core.Models.Entities;
using YurttaYe.Core.Models.ViewModels;
using YurttaYe.Core.Services;

namespace YurttaYe.Web.Controllers.Web
{
    [Authorize(Roles = "Admin")]
    public class AdminCityController : Controller
    {
        private readonly ICityService _cityService;

        public AdminCityController(ICityService cityService)
        {
            _cityService = cityService;
        }

        public async Task<IActionResult> Index()
        {
            var cities = await _cityService.GetAllCitiesAsync();
            var model = cities.Select(c => new AdminCityViewModel { Id = c.Id, Name = c.Name });
            return View(model);
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
                await _cityService.AddCityAsync(city);
                return RedirectToAction(nameof(Index));
            }
            return View(model);
        }
    }
}