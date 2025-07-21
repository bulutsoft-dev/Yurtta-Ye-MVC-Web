using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using YurttaYe.Core.Models.Dtos;

namespace YurttaYe.Core.Models.ViewModels
{
    public class MenuViewModel
    {
        [Display(Name = "City")]
        [Required(ErrorMessage = "RequiredField")]
        public int CityId { get; set; }

        [Display(Name = "MealType")]
        public string MealType { get; set; } = string.Empty;

        [Display(Name = "Date")]
        public DateTime Date { get; set; } = DateTime.Today;

        public MenuDto? Menu { get; set; }
        public MenuDto? BreakfastMenu { get; set; }
        public MenuDto? DinnerMenu { get; set; }
        public IEnumerable<SelectListItem> Cities { get; set; } = new List<SelectListItem>();
        public string? ErrorMessage { get; set; }
    }
}