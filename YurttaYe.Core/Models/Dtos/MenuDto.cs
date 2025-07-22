using System;
using System.Collections.Generic;

namespace YurttaYe.Core.Models.Dtos
{
    public class MenuDto
    {
        public int Id { get; set; }
        public int CityId { get; set; }
        public string MealType { get; set; } = string.Empty;
        public string Date { get; set; } = string.Empty;
        public string Energy { get; set; } = string.Empty;
        public List<MenuItemDto> Items { get; set; } = new();
    }
}