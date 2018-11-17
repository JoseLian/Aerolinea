using Aerolinea.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aerolinea.Repositories
{
    public interface IUsuarioRepository: IGenericRepository<Usuario>
    {
        Usuario GetByCode(string CodigoUsuario);
    }
}
