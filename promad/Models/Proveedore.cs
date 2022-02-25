using System;
using System.Collections.Generic;

#nullable disable

namespace promad.Models
{
    public partial class Proveedore
    {
        public int IdProveedor { get; set; }
        public string Codigo { get; set; }
        public string RazonSocial { get; set; }
        public string Rfc { get; set; }

        public virtual Producto Producto { get; set; }
    }
}
