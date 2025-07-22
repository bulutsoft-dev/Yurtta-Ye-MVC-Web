namespace YurttaYe.Core.Services.Interfaces
{
    public interface IServiceManager
    {
        ICityService CityService { get; }
        IMenuService MenuService { get; }
    }
} 