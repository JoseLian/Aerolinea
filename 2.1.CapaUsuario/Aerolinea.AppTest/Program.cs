using Aerolinea.Model;
using Aerolinea.UoW;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aerolinea.AppTest
{
    class Program
    {
        static void Main(string[] args)
        {
            Usuario usuario = new Usuario();

            using (UnitOfWork UoW = new UnitOfWork())
            {
                usuario = UoW.UsuarioRepository.GetByCode("BAlvaC");
                Console.WriteLine("Datos Usuario");
                Console.WriteLine("=============");
                Console.WriteLine("Nombres: " + usuario.Nombres);
                Console.WriteLine("Apellidos: " + usuario.Apellidos);
                
            }
        }
    }
}
