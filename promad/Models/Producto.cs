using System;
using System.Collections.Generic;

#nullable disable

namespace promad.Models
{
    public partial class Producto
    {
        public int IdProducto { get; set; }
        public int IdProveedor { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public string Unidad { get; set; }
        public decimal Costo { get; set; }

        public virtual Proveedore IdProveedorNavigation { get; set; }
    }
}
