using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Text.Json;
using System.Threading.Tasks;

namespace YurttaYe.Web.Middleware
{
    /// <summary>
    /// Global exception handling middleware.
    /// Production ortamında detaylı hata mesajları gizlenir.
    /// Tüm hatalar loglanır.
    /// </summary>
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionMiddleware> _logger;
        private readonly IHostEnvironment _env;

        public ExceptionMiddleware(
            RequestDelegate next, 
            ILogger<ExceptionMiddleware> logger,
            IHostEnvironment env)
        {
            _next = next;
            _logger = logger;
            _env = env;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                // Detaylı hata logla
                _logger.LogError(ex, 
                    "İşlenmeyen hata oluştu. Path: {Path}, Method: {Method}, User: {User}", 
                    context.Request.Path, 
                    context.Request.Method,
                    context.User?.Identity?.Name ?? "Anonymous");

                context.Response.StatusCode = 500;
                context.Response.ContentType = "application/json";

                var response = new ErrorResponse();

                if (_env.IsDevelopment())
                {
                    // Development ortamında detaylı hata bilgisi
                    response = new ErrorResponse
                    {
                        Success = false,
                        Message = ex.Message,
                        Detail = ex.StackTrace,
                        Path = context.Request.Path,
                        Timestamp = DateTime.UtcNow
                    };
                }
                else
                {
                    // Production ortamında genel hata mesajı
                    response = new ErrorResponse
                    {
                        Success = false,
                        Message = "Bir hata oluştu. Lütfen daha sonra tekrar deneyin.",
                        Path = context.Request.Path,
                        Timestamp = DateTime.UtcNow
                    };
                }

                var jsonOptions = new JsonSerializerOptions 
                { 
                    PropertyNamingPolicy = JsonNamingPolicy.CamelCase 
                };
                
                await context.Response.WriteAsJsonAsync(response, jsonOptions);
            }
        }
    }

    /// <summary>
    /// Standart hata response modeli
    /// </summary>
    public class ErrorResponse
    {
        public bool Success { get; set; }
        public string Message { get; set; } = string.Empty;
        public string? Detail { get; set; }
        public string Path { get; set; } = string.Empty;
        public DateTime Timestamp { get; set; }
    }
}