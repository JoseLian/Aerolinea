using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aerolinea.Repositories
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        public void Add(T Entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(T Entity)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<T> GetAll()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<T> GetAll(int Id)
        {
            throw new NotImplementedException();
        }

        public T GetById(int Id)
        {
            throw new NotImplementedException();
        }

        public void Update(T Entity)
        {
            throw new NotImplementedException();
        }
    }
}
