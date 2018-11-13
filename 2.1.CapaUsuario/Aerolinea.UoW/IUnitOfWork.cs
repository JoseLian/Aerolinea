using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aerolinea.UoW
{
    interface IUnitOfWork: IDisposable
    {
        //Registrar repositorios
        //IUsuarioRepository UsuarioRepository { get; }
        void Commit();
    }
}
