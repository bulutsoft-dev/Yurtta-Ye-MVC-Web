using System;
using System.Collections.Generic;

namespace YurttaYe.Core.Models.ViewModels
{
    public class DashboardViewModel
    {
        public int TotalMenus { get; set; }
        public int TotalCities { get; set; }
        public List<RecentMenuViewModel> RecentMenus { get; set; } = new();
    }

    public class RecentMenuViewModel
    {
        public int Id { get; set; }
        public string CityName { get; set; } = string.Empty;
        public string Location { get; set; } = string.Empty;
        public string MealType { get; set; } = string.Empty;
        public DateTime Date { get; set; }
        public string MenuContent { get; set; } = string.Empty;
    }
}
