using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aerolinea.Repositories
{
    public interface IGenericRepository<T> where T: class
    {
        IEnumerable<T> GetAll();
        IEnumerable<T> GetAll(int Id);
        T GetById(int Id);
        void Add(T Entity);
        void Update(T Entity);
        void Delete(T Entity);
    }
}
