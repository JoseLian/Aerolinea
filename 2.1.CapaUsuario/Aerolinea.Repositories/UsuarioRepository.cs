using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aerolinea.Model;
using Dapper;

namespace Aerolinea.Repositories
{
    public class UsuarioRepository : BaseRepository, IUsuarioRepository
    {
        public UsuarioRepository(IDbTransaction transaction) : base(transaction)
        {
        }

        public void Add(Usuario Entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(Usuario Entity)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Usuario> GetAll()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Usuario> GetAll(int Id)
        {
            throw new NotImplementedException();
        }

        public Usuario GetByCode(string CodigoUsuario)
        {
            string Sql = "SELECT CodigoUsuario, Nombres, Apellidos, Correo, IdRol, IdTrabajador ";
            Sql = Sql + "FROM dbo.Usuario U WHERE U.CodigoUsuario = '" + CodigoUsuario + "'";

            var Result = Connection.Query<Usuario>(Sql, commandType: CommandType.Text, transaction: Transaction);

            return Result.FirstOrDefault();
        }

        public Usuario GetById(int Id)
        {
            throw new NotImplementedException();
        }

        public void Update(Usuario Entity)
        {
            throw new NotImplementedException();
        }
    }
}
