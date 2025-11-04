using Microsoft.EntityFrameworkCore;
using WebProspek.Entities.SeleniumApp;
using WebProspek.Interfaces;

namespace WebProspek.Business
{
    

    public class DataProspekService : IDataProspekService
    {
        private ITemenosDBContext dBContext;
        private IHttpContextAccessor httpCtxAccess;
        public DataProspekService(ITemenosDBContext temenosDBContext, IHttpContextAccessor httpContextAccessor)
        {
            dBContext = temenosDBContext;
            httpCtxAccess = httpContextAccessor;
        }

        public Customer GetCustomerById(int customerId)
        {
            return dBContext.Customers.FirstOrDefault(c => c.RowId == customerId);
        }

        public IQueryable<Customer> GetAllCustomers()
        {
            return dBContext.Customers.AsQueryable();
        }

        public Customer GetCustomerByCIF(string cifNo)
        {
            return dBContext.Customers.FirstOrDefault(c => c.CIFNo == cifNo);
        }


        public long AddNewCustomer(Customer customer)
        {
            var trx = dBContext.Database.CurrentTransaction;
            if (trx == null)
            {
                trx = dBContext.Database.BeginTransaction(System.Data.IsolationLevel.ReadCommitted);
            }
            try
            {
                ArgumentNullException.ThrowIfNull(customer, nameof(customer));                
                ArgumentException.ThrowIfNullOrEmpty(customer.CIFNo, nameof(customer.CIFNo));
                ArgumentException.ThrowIfNullOrEmpty(customer.Nama, nameof(customer.Nama));

                if(customer.FlagBadanUsaha != "I" && customer.FlagBadanUsaha != "B")
                {
                    throw new ArgumentException("pilih perorangan atau badan usaha pengusaha", nameof(customer.FlagBadanUsaha));
                }

                var httpContext = httpCtxAccess.HttpContext;
                var userName = httpContext.User.Identity?.Name;

                var newData = new Customer
                {
                    CIFNo = customer.CIFNo,
                    Nama = customer.Nama,
                    FlagBadanUsaha = customer.FlagBadanUsaha,
                    NPWP = customer.NPWP,
                    NoKTP = customer.NoKTP,
                    JenisKelamin = customer.JenisKelamin,
                    NoAkta = customer.NoAkta,
                    Alamat = customer.Alamat,
                    NoTelepon = customer.NoTelepon,
                    Email = customer.Email,
                    CreatedBy = userName,
                    CreatedDate = DateTime.Now
                };

                dBContext.Customers.Add(newData);
                dBContext.Entry(newData).State = EntityState.Added;
                dBContext.SaveChanges();
                dBContext.Entry(newData).Reload();

                trx.Commit();

                return newData.RowId;

            }
            catch (Exception)
            {
                if (trx != null)
                {
                    trx.Rollback();
                    trx.Dispose();
                    trx = null;
                }
                throw;
            }

        }

    }
}
