using Microsoft.AspNetCore.Mvc.Rendering;

namespace YurttaYe.Core.Models.ViewModels
{
    public class AdminMenuViewModel
    {
        public int Id { get; set; }
        public int CityId { get; set; }
        public string CityName { get; set; }
        public string MealType { get; set; }
        public DateTime Date { get; set; }
        public string Energy { get; set; }
        public IEnumerable<SelectListItem> Cities { get; set; }
        public List<AdminMenuItemViewModel> Items { get; set; }
    }

    public class AdminMenuItemViewModel
    {
        public string Category { get; set; }
        public string Name { get; set; }
        public string Gram { get; set; }
    }
}