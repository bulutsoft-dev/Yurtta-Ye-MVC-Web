namespace YurttaYe.Core.Models.Entities
{
    public class MenuItem
    {
        public int Id { get; set; }
        public int MenuId { get; set; }
        public string Category { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string Gram { get; set; } = string.Empty;
        public Menu Menu { get; set; } = null!;
    }
}