using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using YurttaYe.Core.Services;
using YurttaYe.Data;
using YurttaYe.Data.Repositories;
using YurttaYe.Services;
using YurttaYe.Web.Middleware;
using YurttaYe.Web.Services;
using Microsoft.AspNetCore.Localization;
using System.Globalization;
using System.Collections.Generic;
using Microsoft.Extensions.Options;
using YurttaYe.Core.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Threading.RateLimiting;

var builder = WebApplication.CreateBuilder(args);
DotNetEnv.Env.Load();

// ==========================================
// 1. MVC + Razor View desteği + Global CSRF
// ==========================================
builder.Services.AddControllersWithViews(options =>
{
    // Global CSRF koruması - Tüm POST isteklerinde AntiForgeryToken doğrulaması
    options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute());
})
    .AddViewLocalization(Microsoft.AspNetCore.Mvc.Razor.LanguageViewLocationExpanderFormat.Suffix)
    .AddDataAnnotationsLocalization(options =>
    {
        options.DataAnnotationLocalizerProvider = (type, factory) =>
            factory.Create(typeof(YurttaYe.Web.Resources.SharedControllerResources));
    });

// Area desteği ekle
builder.Services.Configure<Microsoft.AspNetCore.Mvc.MvcOptions>(options =>
{
    options.EnableEndpointRouting = true;
});


// ==========================================
// 2. EF Core - PostgreSQL Database
// ==========================================
var connectionString = Environment.GetEnvironmentVariable("DATABASE_CONNECTION_STRING");
if (string.IsNullOrEmpty(connectionString))
{
    throw new InvalidOperationException("DATABASE_CONNECTION_STRING environment variable is not set.");
}

builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseNpgsql(connectionString);
});
AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);


// ==========================================
// 3. Identity + Cookie Authentication (Güvenlik İyileştirmeleri)
// ==========================================
builder.Services.AddIdentity<IdentityUser, IdentityRole>(options =>
{
    // Password Policy - Güçlendirilmiş şifre gereksinimleri
    options.Password.RequiredLength = 8;
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequireUppercase = true;
    options.Password.RequireNonAlphanumeric = true;
    options.Password.RequiredUniqueChars = 4;
    
    // Lockout Policy - Brute-force koruması
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(15);
    options.Lockout.MaxFailedAccessAttempts = 5;
    options.Lockout.AllowedForNewUsers = true;
    
    // User settings
    options.User.RequireUniqueEmail = true;
})
    .AddEntityFrameworkStores<AppDbContext>()
    .AddDefaultTokenProviders();

// Cookie Authentication Güvenlik Ayarları
builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/Account/Login";
    options.AccessDeniedPath = "/Account/AccessDenied";
    options.LogoutPath = "/Account/Logout";
    
    // Cookie güvenlik ayarları
    options.Cookie.HttpOnly = true; // JavaScript erişimini engelle
    
    // Development ortamında HTTP kullanılabilir, Production'da sadece HTTPS
    options.Cookie.SecurePolicy = builder.Environment.IsDevelopment() 
        ? CookieSecurePolicy.SameAsRequest 
        : CookieSecurePolicy.Always;
    
    options.Cookie.SameSite = SameSiteMode.Lax; // Cross-site request'lerde çalışabilir
    options.Cookie.Name = "YurttaYe.Auth";
    
    // Session timeout
    options.ExpireTimeSpan = TimeSpan.FromHours(8);
    options.SlidingExpiration = true;
});


// ==========================================
// 4. CORS (Esnek Yapılandırma)
// ==========================================
builder.Services.AddCors(options =>
{
    // Ana politika - Tüm kaynaklara izin ver
    options.AddPolicy("SecurePolicy", policy =>
    {
        policy.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader();
    });
    
    // Mobil uygulama (Flutter) için API politikası
    options.AddPolicy("MobileApiPolicy", policy =>
    {
        policy.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader();
    });
});


// ==========================================
// 5. Rate Limiting (DDoS/Brute-force koruması)
// ==========================================
builder.Services.AddRateLimiter(options =>
{
    options.RejectionStatusCode = StatusCodes.Status429TooManyRequests;
    
    // Global rate limit - IP bazlı
    options.GlobalLimiter = PartitionedRateLimiter.Create<HttpContext, string>(context =>
    {
        // API endpoint'leri için daha sıkı limit
        if (context.Request.Path.StartsWithSegments("/api"))
        {
            return RateLimitPartition.GetFixedWindowLimiter(
                partitionKey: $"api_{context.Connection.RemoteIpAddress?.ToString() ?? "anonymous"}",
                factory: _ => new FixedWindowRateLimiterOptions
                {
                    AutoReplenishment = true,
                    PermitLimit = 60,
                    Window = TimeSpan.FromMinutes(1)
                });
        }
        
        // Login endpoint için daha sıkı limit
        if (context.Request.Path.StartsWithSegments("/Account/Login"))
        {
            return RateLimitPartition.GetFixedWindowLimiter(
                partitionKey: $"login_{context.Connection.RemoteIpAddress?.ToString() ?? "anonymous"}",
                factory: _ => new FixedWindowRateLimiterOptions
                {
                    AutoReplenishment = true,
                    PermitLimit = 5,
                    Window = TimeSpan.FromMinutes(5)
                });
        }
        
        // Diğer istekler için genel limit
        return RateLimitPartition.GetFixedWindowLimiter(
            partitionKey: context.Connection.RemoteIpAddress?.ToString() ?? "anonymous",
            factory: _ => new FixedWindowRateLimiterOptions
            {
                AutoReplenishment = true,
                PermitLimit = 100,
                Window = TimeSpan.FromMinutes(1)
            });
    });
    
    options.OnRejected = async (context, token) =>
    {
        context.HttpContext.Response.StatusCode = StatusCodes.Status429TooManyRequests;
        await context.HttpContext.Response.WriteAsJsonAsync(new 
        { 
            error = "Çok fazla istek gönderdiniz. Lütfen bir süre bekleyin.",
            retryAfter = "60 saniye sonra tekrar deneyin"
        }, cancellationToken: token);
    };
});


// ==========================================
// 6. Localization Services
// ==========================================
builder.Services.AddLocalization(options => options.ResourcesPath = "Resources");

builder.Services.Configure<RequestLocalizationOptions>(options =>
{
    var supportedCultures = new[]
    {
        new CultureInfo("tr"),
        new CultureInfo("en")
    };
    options.DefaultRequestCulture = new RequestCulture("tr");
    options.SupportedCultures = supportedCultures;
    options.SupportedUICultures = supportedCultures;
    options.RequestCultureProviders = new List<IRequestCultureProvider>
    {
        new QueryStringRequestCultureProvider(),
        new CookieRequestCultureProvider(),
        new AcceptLanguageHeaderRequestCultureProvider()
    };
});


// ==========================================
// 7. Dependency Injection
// ==========================================
builder.Services.AddScoped<IMenuService, MenuService>();
builder.Services.AddScoped<ICityService, CityService>();
builder.Services.AddScoped<IMenuRepository, MenuRepository>();
builder.Services.AddScoped<ICityRepository, CityRepository>();
builder.Services.AddScoped<IServiceManager, ServiceManager>();
builder.Services.AddHttpClient<ApiService>();


// ==========================================
// 8. Swagger (Sadece Development)
// ==========================================
if (builder.Environment.IsDevelopment())
{
    builder.Services.AddSwaggerGen();
}


// ==========================================
// BUILD APPLICATION
// ==========================================
var app = builder.Build();


// ==========================================
// MIDDLEWARE PIPELINE
// ==========================================

// 1. Exception handling (en üstte olmalı)
app.UseMiddleware<ExceptionMiddleware>();

// 2. Development ortamında Swagger
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
else
{
    // Production ortamında HSTS ve HTTPS zorunlu
    app.UseHsts();
    app.UseHttpsRedirection();
}

// 3. Security Headers
app.UseSecurityHeaders();

// 5. Static files
app.UseStaticFiles();

// 6. Rate Limiting
app.UseRateLimiter();

// 7. Localization
app.UseRequestLocalization(app.Services.GetRequiredService<IOptions<RequestLocalizationOptions>>().Value);

// 8. Routing
app.UseRouting();

// 9. CORS
app.UseCors("SecurePolicy");

// 10. API Key doğrulaması
app.UseMiddleware<ApiKeyMiddleware>();

// 11. Authentication & Authorization
app.UseAuthentication();
app.UseAuthorization();


// ==========================================
// ROUTE DEFINITIONS
// ==========================================
app.MapControllerRoute(
    name: "areas",
    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");


// ==========================================
// DATABASE SEEDING
// ==========================================
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var context = services.GetRequiredService<AppDbContext>();
    var userManager = services.GetRequiredService<UserManager<IdentityUser>>();
    var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();

    await SeedData.Initialize(context, userManager, roleManager);
}


app.Run();

// Test projesi için Program sınıfını erişilebilir hale getir
public partial class Program { }
