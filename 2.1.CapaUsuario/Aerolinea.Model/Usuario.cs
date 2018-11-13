using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aerolinea.Model
{
    public class Usuario
    {
        public string CodigoUsuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Correo { get; set; }
        public int? IdRol { get; set; }
        public int? IdTrabajador { get; set; }
    }
}
