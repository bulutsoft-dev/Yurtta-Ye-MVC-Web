using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using YurttaYe.Core.Models.Dtos;

namespace YurttaYe.Core.Models.ViewModels
{
    public class MenuViewModel
    {
        public int CityId { get; set; }
        public string MealType { get; set; } = string.Empty;
        public DateTime Date { get; set; } = DateTime.Today;
        public MenuDto? Menu { get; set; }
        public MenuDto? BreakfastMenu { get; set; }
        public MenuDto? DinnerMenu { get; set; }
        public IEnumerable<SelectListItem> Cities { get; set; } = new List<SelectListItem>();
        public string? ErrorMessage { get; set; }
    }
}