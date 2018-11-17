using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aerolinea.Infraestructure
{
    public static class Connection
    {
        public readonly static string Cadena = ConfigurationManager.AppSettings["cnxAeropuerto"].ToString();
    }
}
