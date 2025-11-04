using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsSelenium1.Entities.SeleniumApp;
using WinFormsSelenium1.Interfaces;

namespace WinFormsSelenium1.Business
{
   
    public class DummyDataSourceService : IDataSourceService
    {
        private ITemenosDBContext dBContext;
        public DummyDataSourceService(
            ITemenosDBContext temenosDBContext
            )
        {
            dBContext = temenosDBContext;
        }


        public IQueryable<DataToInput> GetAllListDataToInput()
        {
            return dBContext.DataToInputs.AsQueryable();
        }

        public IQueryable<DataToInput> GetAllListDataToInputPerorangan()
        {
            return dBContext.DataToInputs.Where(c => c.FlagBadanUsaha == "I").AsQueryable();
        }

        public IQueryable<DataToInput> GetAllListDataToInputPengusahaBadanUsaha()
        {
            return dBContext.DataToInputs.Where(c => c.FlagBadanUsaha == "B").AsQueryable();
        }

    }
}
