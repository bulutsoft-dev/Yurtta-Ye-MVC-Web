using System.ComponentModel.DataAnnotations;

namespace YurttaYe.Core.Models.ViewModels
{
    public class AdminCityViewModel
    {
        public int Id { get; set; }
        
        [Display(Name = "CityName")]
        [Required(ErrorMessage = "RequiredField")]
        public string Name { get; set; } = string.Empty;
    }
}