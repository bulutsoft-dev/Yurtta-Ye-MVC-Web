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
            // Not: CDN'lerin çalışması için esnek CSP kullanılıyor
            // Tüm CDN kaynaklarına izin veriliyor
            context.Response.Headers["Content-Security-Policy"] = 
                "default-src * 'self' data: blob:; " +
                "script-src * 'self' 'unsafe-inline' 'unsafe-eval' data: blob:; " +
                "style-src * 'self' 'unsafe-inline' data: blob:; " +
                "font-src * 'self' data: blob:; " +
                "img-src * 'self' data: blob:; " +
                "connect-src * 'self' data: blob: wss: ws:; " +
                "media-src * 'self' data: blob:; " +
                "frame-ancestors 'self';";
            
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
