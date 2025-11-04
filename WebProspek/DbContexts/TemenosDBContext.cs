using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using WebProspek.Entities.SeleniumApp;

namespace WebProspek.DbContexts;

public partial class TemenosDBContext : DbContext
{
    public TemenosDBContext()
    {
    }

    public TemenosDBContext(DbContextOptions<TemenosDBContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AppUser> AppUsers { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<DataToInput> DataToInputs { get; set; }

    public virtual DbSet<SeleniumLog> SeleniumLogs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            optionsBuilder.UseSqlServer("Data Source=BPRN-GF63PC\\MSSQL2022;Initial Catalog=SeleniumApp;Persist Security Info=True;Integrated Security=true;MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False;Connection Timeout=30;"); ;
        }
    }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<SeleniumLog>(entity =>
        {
            entity.Property(e => e.Id).HasDefaultValueSql("(newid())");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
