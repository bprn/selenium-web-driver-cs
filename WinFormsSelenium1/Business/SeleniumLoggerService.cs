using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsSelenium1.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace WinFormsSelenium1.Business
{
  

    public class SeleniumLoggerService : ISeleniumLoggerService
    {
        private ITemenosDBContext dBContext;
        public SeleniumLoggerService(
            ITemenosDBContext temenosDBContext
            )
        {
            dBContext = temenosDBContext;
        }


        public void LogStep(string sessionReg, int seq, string stepName, string status, string message, string user)
        {
             
            try
            {
                ArgumentNullException.ThrowIfNullOrWhiteSpace(sessionReg);
                ArgumentNullException.ThrowIfNullOrWhiteSpace(stepName);
                ArgumentNullException.ThrowIfNullOrWhiteSpace(status);
                var list = dBContext.AppUsers.ToList();
                var log = new Entities.SeleniumApp.SeleniumLog
                {
                    Id = Guid.NewGuid(),
                    RegNo = sessionReg,
                    Sequence = seq,
                    Step = stepName,
                    Status = status,
                    Message = message,
                    RunAsUser = user,
                    LogDate = DateTime.Now
                };
                dBContext.SeleniumLogs.Add(log);
                dBContext.Entry(log).State = Microsoft.EntityFrameworkCore.EntityState.Added;
                dBContext.SaveChanges();
               

            }
            catch (Exception)
            {
                 
                throw;
            }
        }


        public IQueryable<Entities.SeleniumApp.SeleniumLog> GetLogsBySession(string sessionReg)
        {
            ArgumentNullException.ThrowIfNullOrWhiteSpace(sessionReg);
            return dBContext.SeleniumLogs.Where(x => x.RegNo == sessionReg).AsQueryable();            
        }

        public IQueryable<Entities.SeleniumApp.SeleniumLog> GetAllLogs()
        {
            return dBContext.SeleniumLogs.AsQueryable();            
        }

        public IQueryable<Entities.SeleniumApp.SeleniumLog> GetLatestLogs(int logCount)
        {
            return dBContext.SeleniumLogs.OrderByDescending(l => l.LogDate).Take(logCount).AsQueryable();
        }



    }
}
