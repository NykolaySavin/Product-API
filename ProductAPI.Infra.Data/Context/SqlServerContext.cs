using ProductAPI.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using ProductAPI.Infra.Data.Mapping;

namespace ProductAPI.Infra.Data.Context
{
    public class SqlServerContext : DbContext
    {
        public DbSet<Product> Product { get; set; }
        public DbSet<Brand>   Brand { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            { 
                optionsBuilder.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=productdb;Trusted_Connection=True;");
                
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Product>(new ProductMap().Configure);
            modelBuilder.Entity<Brand>(new BrandMap().Configure);
        }

    }
}
