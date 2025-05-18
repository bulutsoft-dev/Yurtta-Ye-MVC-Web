YurttaYe-MVC/
├── YurttaYe.Core/                      # Class Library: Modeller, DTO'lar, Arayüzler
│   ├── Models/
│   │   ├── Entities/
│   │   │   ├── City.cs
│   │   │   ├── Menu.cs
│   │   │   ├── MenuItem.cs
│   │   ├── Dtos/
│   │   │   ├── CityDto.cs
│   │   │   ├── MenuDto.cs
│   │   │   ├── MenuItemDto.cs
│   │   ├── ViewModels/
│   │   │   ├── MenuViewModel.cs
│   │   │   ├── AdminMenuViewModel.cs
│   │   │   ├── AdminCityViewModel.cs
│   ├── Services/
│   │   ├── Interfaces/
│   │   │   ├── IMenuService.cs
│   │   │   ├── ICityService.cs
│   ├── YurttaYe.Core.csproj
│
├── YurttaYe.Services/                  # Class Library: İş Mantığı (Business Logic)
│   ├── MenuService.cs
│   ├── CityService.cs
│   ├── YurttaYe.Services.csproj
│
├── YurttaYe.Data/                      # Class Library: Veri Erişimi ve EF Core
│   ├── AppDbContext.cs
│   ├── Migrations/
│   ├── SeedData.cs
│   ├── Repositories/
│   │   ├── MenuRepository.cs
│   │   ├── CityRepository.cs
│   │   ├── Interfaces/
│   │   │   ├── IMenuRepository.cs
│   │   │   ├── ICityRepository.cs
│   ├── YurttaYe.Data.csproj
│
├── YurttaYe.Web/                       # ASP.NET Core MVC Web Projesi
│   ├── Areas/
│   │   ├── Admin/
│   │   │   ├── Controllers/
│   │   │   │   ├── AdminMenuController.cs
│   │   │   │   ├── AdminCityController.cs
│   │   │   ├── Views/
│   │   │   │   ├── AdminMenu/
│   │   │   │   │   ├── Index.cshtml
│   │   │   │   │   ├── Create.cshtml
│   │   │   │   │   ├── Edit.cshtml
│   │   │   │   │   ├── Upload.cshtml
│   │   │   │   ├── AdminCity/
│   │   │   │   │   ├── Index.cshtml
│   │   │   │   │   ├── Create.cshtml
│   │   │   │   │   ├── Edit.cshtml
│
│   ├── Controllers/
│   │   ├── Api/
│   │   │   ├── MenuController.cs
│   │   │   ├── CityController.cs
│   │   ├── Web/
│   │   │   ├── HomeController.cs
│   │   │   ├── AccountController.cs
│
│   ├── Views/
│   │   ├── Home/
│   │   │   ├── Index.cshtml
│   │   ├── Account/
│   │   │   ├── Login.cshtml
│   │   ├── Shared/
│   │   │   ├── _Layout.cshtml
│   │   │   ├── _ValidationScriptsPartial.cshtml
│
│   ├── wwwroot/
│   │   ├── css/
│   │   │   ├── site.css
│   │   ├── js/
│   │   │   ├── site.js
│   │   ├── lib/
│   │   │   ├── bootstrap/
│   │   │   ├── jquery/
│   │   │   ├── datatables/
│
│   ├── Middleware/
│   │   ├── ExceptionMiddleware.cs
│
│   ├── Program.cs
│   ├── appsettings.json
│   ├── libman.json
│   ├── YurttaYe.Web.csproj
│
├── YurttaYe-MVC.sln                    # Çözüm dosyası


YurttaYe-Mobile/
├── lib/
│   ├── models/
│   │   ├── city.dart                 // Şehir: id, name
│   │   ├── menu.dart                 // Menü: id, cityId, mealType, date, energy, items
│   │   ├── menu_item.dart            // Menü öğesi: id, category, name, gram
│   ├── services/
│   │   ├── api_service.dart          // API çağrıları
│   │   ├── auth_service.dart         // JWT yönetimi
│   ├── screens/
│   │   ├── splash_screen.dart        // Açılış ekranı
│   │   ├── home_screen.dart          // Menü sorgulama
│   │   ├── menu_screen.dart          // Menü detayları
│   ├── widgets/
│   │   ├── city_dropdown.dart        // Şehir dropdown
│   │   ├── meal_type_selector.dart   // Öğün seçici
│   │   ├── date_picker.dart          // Tarih seçici
│   │   ├── menu_item_card.dart       // Menü öğesi kartı
│   ├── providers/
│   │   ├── menu_provider.dart        // State yönetimi
│   ├── utils/
│   │   ├── constants.dart            // API URL, renkler
│   │   ├── helpers.dart              // Yardımcı fonksiyonlar
│   ├── routes/
│   │   ├── app_routes.dart           // Rotalar
│   ├── themes/
│   │   ├── app_theme.dart            // Tema
│   ├── main.dart                     // Giriş noktası
├── assets/
│   ├── images/
│   │   ├── logo.png                 // Logo
│   ├── fonts/
│   │   ├── Roboto-Regular.ttf       // Font (opsiyonel)
├── test/
│   ├── widget_test.dart             // Testler
├── pubspec.yaml                     // Bağımlılıklar