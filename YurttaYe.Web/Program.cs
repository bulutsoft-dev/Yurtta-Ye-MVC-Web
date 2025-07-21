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
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);
DotNetEnv.Env.Load();

// 1. MVC + Razor View desteği
builder.Services.AddControllersWithViews()
    .AddViewLocalization(Microsoft.AspNetCore.Mvc.Razor.LanguageViewLocationExpanderFormat.Suffix)
    .AddDataAnnotationsLocalization();


// 2. EF Core (SQLite)
//builder.Services.AddDbContext<AppDbContext>(options =>
//    options.UseSqlite(builder.Configuration.GetConnectionString("DefaultConnection")));

// PostgreSQL Database Connection String
var connectionString = Environment.GetEnvironmentVariable("DATABASE_CONNECTION_STRING");
builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseNpgsql(connectionString); // PostgreSQL için Npgsql kullanılıyor
});
AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);


// 3. Identity + Cookie Authentication
builder.Services.AddIdentity<IdentityUser, IdentityRole>()
    .AddEntityFrameworkStores<AppDbContext>()
    .AddDefaultTokenProviders();

builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/Account/Login";
    options.AccessDeniedPath = "/Account/AccessDenied";
});

// 4. CORS (Flutter için)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowFlutter", policy =>
        policy.AllowAnyOrigin() // Geliştirme için tüm origin'lere izin ver
            .AllowAnyMethod()
            .AllowAnyHeader());
});

// Add localization services
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
    options.RequestCultureProviders.Insert(0, new CookieRequestCultureProvider());
});


// 5. Dependency Injection
builder.Services.AddScoped<IMenuService, MenuService>();
builder.Services.AddScoped<ICityService, CityService>();
builder.Services.AddScoped<IMenuRepository, MenuRepository>();
builder.Services.AddScoped<ICityRepository, CityRepository>();
builder.Services.AddHttpClient<ApiService>();

// 6. Swagger
builder.Services.AddSwaggerGen();

var app = builder.Build();

// 7. Dev ortamında Swagger aç
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// 8. Middleware pipeline
app.UseMiddleware<ExceptionMiddleware>();
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

// Enable localization middleware
var locOptions = app.Services.GetService<IOptions<RequestLocalizationOptions>>();
if (locOptions != null) app.UseRequestLocalization(locOptions.Value);

app.UseCors("AllowFlutter");
app.UseAuthentication();
app.UseAuthorization();


// 9. Route tanımları
app.MapControllerRoute(
    name: "areas",
    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

// 10. Seed verisi
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var context = services.GetRequiredService<AppDbContext>();
    var userManager = services.GetRequiredService<UserManager<IdentityUser>>();
    var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();

    await SeedData.Initialize(context, userManager, roleManager);
}


app.Run();
