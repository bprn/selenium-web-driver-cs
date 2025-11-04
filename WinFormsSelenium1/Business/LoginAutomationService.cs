using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using WinFormsSelenium1.Interfaces;


namespace WinFormsSelenium1.Business
{
    

    public class LoginAutomationService : ILoginAutomationService
    {
        private EdgeDriver driver;
        private ISeleniumLoggerService logger;
        public LoginAutomationService(
            ISeleniumLoggerService seleniumLoggerService
            )
        {
            logger = seleniumLoggerService;

        }

        protected void InitializeDriver()
        {
            if (driver != null)
            {
                driver.Quit();
            }
            var options = new EdgeOptions();
            options.UseWebView = false;
            driver = new EdgeDriver(options);
        }


        private string ReqNumber;
        protected void RecreateRegNumber()
        {
            ReqNumber = $"{DateTime.Now:ddMMyyHH}-{DateTime.Now:mmss}{DateTime.Now.Millisecond:000000}";
        }


        public void RestartLoginSequence(string baseAddress, string user)
        {
            try
            {
                currentSessionCookie = null;
                InitializeDriver();
                RecreateRegNumber();
                var url = new Uri(new Uri(baseAddress), "/Account/Login");
                driver.Url = url.AbsoluteUri;
                driver.Navigate();

                logger.LogStep(ReqNumber, 1, "START", "OK", $"Navigated to {url.AbsolutePath}", user);
            }
            catch (Exception ex)
            {
                if(driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 1, "START", "99", $"{ex.Message} {ex.StackTrace}", user);
                throw;
            }
        }

        public List<OpenQA.Selenium.Cookie> LoginSequence(string username, string password)
        {
            try
            {
                
                driver.FindElement(OpenQA.Selenium.By.Id("txtUserName")).SendKeys(username);
                driver.FindElement(OpenQA.Selenium.By.Id("txtPassword")).SendKeys(password);
                driver.FindElement(OpenQA.Selenium.By.Id("btnSubmit")).Click();
                var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(300));
                var alert = wait.Until(ExpectedConditions.AlertIsPresent());
                var alertText = alert.Text;
                alert.Accept();

                List<OpenQA.Selenium.Cookie> cookies = new List<OpenQA.Selenium.Cookie>();
                if (alertText?.ToUpper()?.Contains("SUKSES") == true)
                {
                    cookies = driver.Manage().Cookies.AllCookies.ToList();

                    //sukses
                    logger.LogStep(ReqNumber, 2, "LOGIN", "OK", $"Login success for user {username}", username);
                }
                else
                {
                    //error
                    logger.LogStep(ReqNumber, 2, "LOGIN", "99", $"Login Failed {alertText}", username);
                }
                Thread.Sleep(2000);
                driver.Quit();

                return cookies;
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 2, "LOGIN", "99", $"{ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }


        public void LogoutSequence(string baseAddress, string user)
        {
            try
            {
                var url = new Uri(new Uri(baseAddress), "/Account/Logout");
                driver.Url = url.AbsoluteUri;
                driver.Navigate();

                var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(300));
                if (wait.Until(ExpectedConditions.UrlContains("/Account/Login")))
                {
                    driver.Quit();
                }

                logger.LogStep(ReqNumber, 1, "LOGOUT", "OK", $"Logout User", user);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 1, "LOGOUT", "99", $"{ex.Message} {ex.StackTrace}", user);
                throw;
            }
        }



        public bool Login(string baseAddress, string userName, string password)
        {

            try
            {
                RestartLoginSequence(baseAddress, userName);
                currentSessionCookie =   LoginSequence(userName, password);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        private List<OpenQA.Selenium.Cookie> currentSessionCookie = null;
        public List<OpenQA.Selenium.Cookie> GetCurrentCookies()
        {
            return currentSessionCookie;
        }


        public bool Logout(string baseAddress, string userName)
        {
            try
            {
                RestartLoginSequence(baseAddress, userName);
                LogoutSequence(baseAddress, userName);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
