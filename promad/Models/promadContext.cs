using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace promad.Models
{
    public partial class promadContext : DbContext
    {
        public promadContext()
        {
        }

        public promadContext(DbContextOptions<promadContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Producto> Productos { get; set; }
        public virtual DbSet<Proveedore> Proveedores { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//                optionsBuilder.UseSqlServer("Server=DESKTOP-U1F6TFI; Database=promad; Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<Producto>(entity =>
            {
                entity.HasKey(e => e.IdProducto);

                entity.HasIndex(e => e.Codigo, "UQ_productos_Codigo")
                    .IsUnique();

                entity.HasIndex(e => e.IdProveedor, "UQ_productos_IdProveedor")
                    .IsUnique();

                entity.Property(e => e.IdProducto).HasColumnName("Id_Producto");

                entity.Property(e => e.Codigo)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsFixedLength(true);

                entity.Property(e => e.Costo).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.Descripcion)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsFixedLength(true);

                entity.Property(e => e.IdProveedor).HasColumnName("Id_Proveedor");

                entity.Property(e => e.Unidad)
                    .IsRequired()
                    .HasMaxLength(3)
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdProveedorNavigation)
                    .WithOne(p => p.Producto)
                    .HasForeignKey<Producto>(d => d.IdProveedor)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Productos_Proveedores");
            });

            modelBuilder.Entity<Proveedore>(entity =>
            {
                entity.HasKey(e => e.IdProveedor);

                entity.HasIndex(e => e.Codigo, "UQ_proveedores_Codigo")
                    .IsUnique();

                entity.Property(e => e.IdProveedor).HasColumnName("Id_Proveedor");

                entity.Property(e => e.Codigo)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsFixedLength(true);

                entity.Property(e => e.RazonSocial)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("Razon_Social")
                    .IsFixedLength(true);

                entity.Property(e => e.Rfc)
                    .IsRequired()
                    .HasMaxLength(13)
                    .HasColumnName("RFC")
                    .IsFixedLength(true);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
