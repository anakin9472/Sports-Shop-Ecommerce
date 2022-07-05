using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Ecommerce.Models;
using ecommerceDemo.Models;

namespace Ecommerce.Data
{
    public partial class EcommerceContext : DbContext
    {
        public EcommerceContext()
        {
        }

        public EcommerceContext(DbContextOptions<EcommerceContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Product> Products { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("utf8mb4_0900_ai_ci")
                .HasCharSet("utf8mb4");

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("product");

                entity.Property(e => e.ProductId).HasColumnName("productId");

                entity.Property(e => e.Image)
                    .HasMaxLength(200)
                    .HasColumnName("image");

                entity.Property(e => e.Title)
                    .HasMaxLength(100)
                    .HasColumnName("title");

                entity.Property(e => e.Price)
                    .HasMaxLength(100)
                    .HasColumnName("price");
            });

            modelBuilder.Entity<Account>(entity =>
            {
                entity.ToTable("account");

                entity.Property(e => e.AccountId).HasColumnName("accountId");

                entity.Property(e => e.FullName)
                    .HasMaxLength(100)
                    .HasColumnName("fullName");

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .HasColumnName("email");

                entity.Property(e => e.Phone)
                    .HasMaxLength(100)
                    .HasColumnName("phone");

                entity.Property(e => e.Region)
                    .HasMaxLength(100)
                    .HasColumnName("region");

                entity.Property(e => e.Pass)
                    .HasMaxLength(200)
                    .HasColumnName("pass");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

        public DbSet<ecommerceDemo.Models.Account>? Account { get; set; }

    }
}
