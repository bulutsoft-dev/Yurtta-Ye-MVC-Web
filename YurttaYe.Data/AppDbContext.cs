using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using YurttaYe.Core.Models.Entities;

namespace YurttaYe.Data
{
    public class AppDbContext : IdentityDbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<City> Cities { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<MenuItem> MenuItems { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<City>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).ValueGeneratedOnAdd(); // Auto-increment
                entity.Property(e => e.Name).IsRequired();
            });

            modelBuilder.Entity<Menu>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).ValueGeneratedOnAdd(); // Auto-increment
                entity.Property(e => e.MealType).IsRequired();
                entity.Property(e => e.Date).IsRequired();
                entity.Property(e => e.Energy).IsRequired();
                entity.HasOne(e => e.City)
                    .WithMany()
                    .HasForeignKey(e => e.CityId)
                    .IsRequired();
                entity.HasMany(e => e.Items)
                    .WithOne(i => i.Menu)
                    .HasForeignKey(i => i.MenuId)
                    .IsRequired();
            });

            modelBuilder.Entity<MenuItem>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).ValueGeneratedOnAdd(); // Auto-increment
                entity.Property(e => e.Category).IsRequired();
                entity.Property(e => e.Name).IsRequired();
                entity.Property(e => e.Gram).IsRequired();
            });
        }
    }
}