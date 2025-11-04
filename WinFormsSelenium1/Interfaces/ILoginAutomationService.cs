using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinFormsSelenium1.Interfaces
{
    public interface ILoginAutomationService
    {
        bool Login(string baseAddress, string userName, string password);
        List<OpenQA.Selenium.Cookie> LoginSequence(string username, string password);
        bool Logout(string baseAddress, string userName);
        void LogoutSequence(string baseAddress, string user);
        void RestartLoginSequence(string baseAddress, string user);
        List<OpenQA.Selenium.Cookie> GetCurrentCookies();
    }


}
