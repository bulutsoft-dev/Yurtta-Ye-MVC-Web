using System;
using YurttaYe.Core.Services;
using YurttaYe.Core.Services.Interfaces;

namespace YurttaYe.Services
{
    public class ServiceManager : IServiceManager
    {
        public ICityService CityService { get; }
        public IMenuService MenuService { get; }

        public ServiceManager(ICityService cityService, IMenuService menuService)
        {
            CityService = cityService ?? throw new ArgumentNullException(nameof(cityService));
            MenuService = menuService ?? throw new ArgumentNullException(nameof(menuService));
        }
    }
}
