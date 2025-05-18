namespace YurttaYe.Core.Models.Dtos
{
    public class MenuItemDto
    {
        public int Id { get; set; }
        public string Category { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string Gram { get; set; } = string.Empty;
    }
}