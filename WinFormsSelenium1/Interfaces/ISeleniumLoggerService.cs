using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinFormsSelenium1.Interfaces
{
    public interface ISeleniumLoggerService
    {
        void LogStep(string sessionReg, int seq, string stepName, string status, string message, string user);
    }
}
