using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsSelenium1.Entities.SeleniumApp;

namespace WinFormsSelenium1.Interfaces
{
    public interface IFormInputAutomationService
    {
        void ApplySessionCookie(List<OpenQA.Selenium.Cookie> cookies);
        bool InputForm(string baseAddress, string username);
        void RestartFormInputSequence(string baseAddress, string user);
        void Step10InputSequence(DataToInput data, string username);
        void Step10BInputSequence(DataToInput data, string username);
        void Step11SubmitSequence(DataToInput data, string username);
        void Step1SelectSequence(DataToInput data, string username);
        void Step2InputSequence(DataToInput data, string username);
        void Step3InputSequence(DataToInput data, string username);
        void Step4InputSequence(DataToInput data, string username);
        void Step5InputSequence(DataToInput data, string username);
        void Step6InputSequence(DataToInput data, string username);
        void Step7InputSequence(DataToInput data, string username);
        void Step8InputSequence(DataToInput data, string username);
        void Step9InputSequence(DataToInput data, string username);
    }


}
