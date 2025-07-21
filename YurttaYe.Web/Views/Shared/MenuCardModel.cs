using YurttaYe.Core.Models.Dtos;

namespace YurttaYe.Web.Views.Shared
{
    public class MenuCardModel
    {
        public MenuDto Menu { get; set; }
        public string Title { get; set; }
        public string Emoji { get; set; }
        public string GradientStart { get; set; }
        public string GradientEnd { get; set; }
        public string CategoryColor { get; set; }
        public string DateText { get; set; }
    }
} 