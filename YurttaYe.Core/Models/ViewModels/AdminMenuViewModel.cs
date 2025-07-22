using Microsoft.AspNetCore.Mvc.Rendering;

namespace YurttaYe.Core.Models.ViewModels
{
    public class AdminMenuViewModel
    {
        public int Id { get; set; }
        public int CityId { get; set; }
        public string CityName { get; set; } = string.Empty;
        public string MealType { get; set; } = string.Empty;
        public DateTime Date { get; set; }
        public string Energy { get; set; } = string.Empty;
        public IEnumerable<SelectListItem> Cities { get; set; } = new List<SelectListItem>();
        public List<AdminMenuItemViewModel> Items { get; set; } = new List<AdminMenuItemViewModel>();
    }

    public class AdminMenuItemViewModel
    {
        public string Category { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string Gram { get; set; } = string.Empty;
    }
}