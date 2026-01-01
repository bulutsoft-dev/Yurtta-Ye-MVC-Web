using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace YurttaYe.Web.Middleware
{
    /// <summary>
    /// Güvenlik header'larını tüm HTTP response'larına ekleyen middleware.
    /// OWASP önerilerine uygun güvenlik başlıkları sağlar.
    /// </summary>
    public class SecurityHeadersMiddleware
    {
        private readonly RequestDelegate _next;

        public SecurityHeadersMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            // X-Content-Type-Options: MIME type sniffing'i engeller
            context.Response.Headers["X-Content-Type-Options"] = "nosniff";
            
            // X-Frame-Options: Clickjacking saldırılarını engeller
            context.Response.Headers["X-Frame-Options"] = "DENY";
            
            // X-XSS-Protection: XSS filtrelerini etkinleştirir (legacy tarayıcılar için)
            context.Response.Headers["X-XSS-Protection"] = "1; mode=block";
            
            // Referrer-Policy: Referrer bilgisinin paylaşımını kontrol eder
            context.Response.Headers["Referrer-Policy"] = "strict-origin-when-cross-origin";
            
            // Permissions-Policy: Tarayıcı özelliklerinin kullanımını kısıtlar
            context.Response.Headers["Permissions-Policy"] = "geolocation=(), microphone=(), camera=()";
            
            // Content-Security-Policy: XSS ve injection saldırılarına karşı koruma
            // Not: Uygulamanın ihtiyaçlarına göre ayarlanmalı
            // Geliştirme ve Production için esnek CSP
            context.Response.Headers["Content-Security-Policy"] = 
                "default-src 'self'; " +
                "script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.tailwindcss.com https://cdn.jsdelivr.net https://cdnjs.cloudflare.com https://unpkg.com; " +
                "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com https://cdnjs.cloudflare.com https:; " +
                "font-src 'self' data: https://fonts.gstatic.com https://cdnjs.cloudflare.com https:; " +
                "img-src 'self' data: blob: https:; " +
                "connect-src 'self' https: wss:; " +
                "media-src 'self' https:; " +
                "frame-ancestors 'none';";
            
            // Cache-Control for sensitive pages
            if (context.Request.Path.StartsWithSegments("/Admin") || 
                context.Request.Path.StartsWithSegments("/Account"))
            {
                context.Response.Headers["Cache-Control"] = "no-store, no-cache, must-revalidate";
                context.Response.Headers["Pragma"] = "no-cache";
                context.Response.Headers["Expires"] = "0";
            }

            await _next(context);
        }
    }

    /// <summary>
    /// SecurityHeadersMiddleware için extension method.
    /// </summary>
    public static class SecurityHeadersMiddlewareExtensions
    {
        public static IApplicationBuilder UseSecurityHeaders(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<SecurityHeadersMiddleware>();
        }
    }
}
