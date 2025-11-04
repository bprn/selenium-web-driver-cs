using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsSelenium1.Entities.SeleniumApp;

namespace WinFormsSelenium1.Interfaces
{
    public interface IDataSourceService
    {
        IQueryable<DataToInput> GetAllListDataToInput();
        IQueryable<DataToInput> GetAllListDataToInputPengusahaBadanUsaha();
        IQueryable<DataToInput> GetAllListDataToInputPerorangan();
    }

}
