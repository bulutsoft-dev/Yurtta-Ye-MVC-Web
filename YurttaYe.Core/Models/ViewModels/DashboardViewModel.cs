using System;
using System.Collections.Generic;

namespace YurttaYe.Core.Models.ViewModels
{
    public class DashboardViewModel
    {
        public int TotalMenus { get; set; }
        public int TotalCities { get; set; }
        public List<RecentMenuViewModel> RecentMenus { get; set; } = new();
        public List<string> ChartLabels { get; set; } = new();
        public List<int> ChartData { get; set; } = new();
    }

    public class RecentMenuViewModel
    {
        public int Id { get; set; }
        public string CityName { get; set; }
        public string MealType { get; set; }
        public DateTime Date { get; set; }
    }
} 