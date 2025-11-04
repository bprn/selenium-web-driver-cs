using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsSelenium1.Entities.SeleniumApp;

namespace WinFormsSelenium1.Interfaces
{
    public interface ITemenosDBContext : IEFRepositoryContext
    {
        DbSet<AppUser> AppUsers { get; set; }

        DbSet<Customer> Customers { get; set; }

        DbSet<DataToInput> DataToInputs { get; set; }

        DbSet<SeleniumLog> SeleniumLogs { get; set; }

    }
}
