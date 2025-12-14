using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace YurttaYe.Core.Models.ViewModels
{
    public class AdminUserViewModel
    {
        public string Id { get; set; } = string.Empty;
        
        [Required(ErrorMessage = "Kullanıcı adı zorunludur")]
        [Display(Name = "Kullanıcı Adı")]
        public string UserName { get; set; } = string.Empty;
        
        [Required(ErrorMessage = "E-posta zorunludur")]
        [EmailAddress(ErrorMessage = "Geçerli bir e-posta adresi giriniz")]
        [Display(Name = "E-posta")]
        public string Email { get; set; } = string.Empty;
        
        [Phone(ErrorMessage = "Geçerli bir telefon numarası giriniz")]
        [Display(Name = "Telefon")]
        public string? PhoneNumber { get; set; }
        
        [Display(Name = "E-posta Onaylı")]
        public bool EmailConfirmed { get; set; }
        
        [Display(Name = "Roller")]
        public List<string> Roles { get; set; } = new();
        
        [Display(Name = "Oluşturulma Tarihi")]
        public DateTime? CreatedDate { get; set; }
        
        [Display(Name = "Son Giriş")]
        public DateTime? LastLoginDate { get; set; }
    }

    public class CreateUserViewModel
    {
        [Required(ErrorMessage = "Kullanıcı adı zorunludur")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "Kullanıcı adı 3-50 karakter arasında olmalıdır")]
        [Display(Name = "Kullanıcı Adı")]
        public string UserName { get; set; } = string.Empty;
        
        [Required(ErrorMessage = "E-posta zorunludur")]
        [EmailAddress(ErrorMessage = "Geçerli bir e-posta adresi giriniz")]
        [Display(Name = "E-posta")]
        public string Email { get; set; } = string.Empty;
        
        [Required(ErrorMessage = "Şifre zorunludur")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Şifre en az 6 karakter olmalıdır")]
        [DataType(DataType.Password)]
        [Display(Name = "Şifre")]
        public string Password { get; set; } = string.Empty;
        
        [Required(ErrorMessage = "Şifre tekrarı zorunludur")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Şifreler eşleşmiyor")]
        [Display(Name = "Şifre Tekrar")]
        public string ConfirmPassword { get; set; } = string.Empty;
        
        [Phone(ErrorMessage = "Geçerli bir telefon numarası giriniz")]
        [Display(Name = "Telefon")]
        public string? PhoneNumber { get; set; }
        
        [Display(Name = "Admin Rolü")]
        public bool IsAdmin { get; set; } = true;
        
        [Display(Name = "E-posta Onaylı")]
        public bool EmailConfirmed { get; set; } = true;
    }

    public class EditUserViewModel
    {
        public string Id { get; set; } = string.Empty;
        
        [Required(ErrorMessage = "Kullanıcı adı zorunludur")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "Kullanıcı adı 3-50 karakter arasında olmalıdır")]
        [Display(Name = "Kullanıcı Adı")]
        public string UserName { get; set; } = string.Empty;
        
        [Required(ErrorMessage = "E-posta zorunludur")]
        [EmailAddress(ErrorMessage = "Geçerli bir e-posta adresi giriniz")]
        [Display(Name = "E-posta")]
        public string Email { get; set; } = string.Empty;
        
        [Phone(ErrorMessage = "Geçerli bir telefon numarası giriniz")]
        [Display(Name = "Telefon")]
        public string? PhoneNumber { get; set; }
        
        [Display(Name = "Admin Rolü")]
        public bool IsAdmin { get; set; }
        
        [Display(Name = "E-posta Onaylı")]
        public bool EmailConfirmed { get; set; }
        
        [DataType(DataType.Password)]
        [Display(Name = "Yeni Şifre (İsteğe Bağlı)")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Şifre en az 6 karakter olmalıdır")]
        public string? NewPassword { get; set; }
        
        [DataType(DataType.Password)]
        [Compare("NewPassword", ErrorMessage = "Şifreler eşleşmiyor")]
        [Display(Name = "Şifre Tekrar")]
        public string? ConfirmNewPassword { get; set; }
    }
}
