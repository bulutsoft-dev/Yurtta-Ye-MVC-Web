using System;
using System.Collections.Generic;
using YurttaYe.Core.Models.Dtos;

namespace YurttaYe.Core.Models.Entities
{
    public class Menu
    {
        public int Id { get; set; }
        public int CityId { get; set; }
        public string MealType { get; set; } = string.Empty;
        public DateTime Date { get; set; }
        public string Energy { get; set; } = string.Empty;
        public City City { get; set; } = null!;
        public List<MenuItem> Items { get; set; } = new();
    }
}