using YurttaYe.Core.Models.Dtos;

namespace YurttaYe.Core.Models.ViewModels;

// New class to hold Breakfast and Dinner for each day
public class DailyMenu
{
    public DateTime Date { get; set; }
    public MenuDto Breakfast { get; set; }
    public MenuDto Dinner { get; set; }
}