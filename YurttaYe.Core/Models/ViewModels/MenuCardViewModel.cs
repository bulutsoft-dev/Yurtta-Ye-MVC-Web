using YurttaYe.Core.Models.Dtos;

namespace YurttaYe.Core.Models.ViewModels
{
    public class MenuCardViewModel
    {
        public MenuDto Menu { get; set; }
        public string Title { get; set; }
        public string IconClass { get; set; }
        public string GradientStart { get; set; }
        public string GradientEnd { get; set; }
        public string CategoryColor { get; set; }
        public string DateText { get; set; }
    }
} 