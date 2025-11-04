using Microsoft.EntityFrameworkCore;
using WebProspek.Entities.SeleniumApp;

namespace WebProspek.Interfaces
{
    public interface ITemenosDBContext: IEFRepositoryContext
    {
          DbSet<AppUser> AppUsers { get; set; }

          DbSet<Customer> Customers { get; set; }

          DbSet<DataToInput> DataToInputs { get; set; }

          DbSet<SeleniumLog> SeleniumLogs { get; set; }

    }
}
