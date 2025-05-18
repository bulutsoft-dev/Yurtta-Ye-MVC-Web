using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using YurttaYe.Core.Services;
using YurttaYe.Data;
using YurttaYe.Data.Repositories;
using YurttaYe.Services;
using YurttaYe.Web.Middleware;

var builder = WebApplication.CreateBuilder(args);

// 1. MVC + Razor View desteği
builder.Services.AddControllersWithViews();

// 2. EF Core (SQLite)
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlite(builder.Configuration.GetConnectionString("DefaultConnection")));

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
        policy.WithOrigins("http://localhost:8080")
              .AllowAnyMethod()
              .AllowAnyHeader());
});

// 5. Dependency Injection
builder.Services.AddScoped<IMenuService, MenuService>();
builder.Services.AddScoped<ICityService, CityService>();
builder.Services.AddScoped<IMenuRepository, MenuRepository>();
builder.Services.AddScoped<ICityRepository, CityRepository>();

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
    var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();
    var userManager = scope.ServiceProvider.GetRequiredService<UserManager<IdentityUser>>();
    await SeedData.Initialize(context, userManager);
}

app.Run();
