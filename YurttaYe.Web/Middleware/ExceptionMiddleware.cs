using Microsoft.AspNetCore.Http;
using System;
using System.Threading.Tasks;

namespace YurttaYe.Web.Middleware
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;

        public ExceptionMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                context.Response.StatusCode = 500;
                await context.Response.WriteAsync("Bir hata oluştu: " + ex.Message);
            }
        }
    }
}