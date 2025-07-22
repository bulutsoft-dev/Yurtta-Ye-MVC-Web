using YurttaYe.Core.Models.Dtos;

namespace YurttaYe.Core.Models.ViewModels
{
    public class MenuCardViewModel
    {
        public MenuDto? Menu { get; set; }
        public string? Title { get; set; }
        public string IconClass { get; set; } = string.Empty;
        public string GradientStart { get; set; } = string.Empty;
        public string GradientEnd { get; set; } = string.Empty;
        public string CategoryColor { get; set; } = string.Empty;
        public string DateText { get; set; } = string.Empty;
    }
} 