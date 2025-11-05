using Microsoft.VisualBasic.ApplicationServices;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using WinFormsSelenium1.Entities.SeleniumApp;
using WinFormsSelenium1.Interfaces; 

namespace WinFormsSelenium1.Business
{
   
    public class FormProspekAutomationService : IFormInputAutomationService
    {
        private EdgeDriver driver;
        private IDataSourceService dsSvc;
        private ISeleniumLoggerService logger;
        private List<OpenQA.Selenium.Cookie> currentSessionCookie;

        public FormProspekAutomationService(
            IDataSourceService dataSourceService,
            ISeleniumLoggerService seleniumLoggerService
            )
        {
            dsSvc = dataSourceService;
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


        public void ApplySessionCookie(List<OpenQA.Selenium.Cookie> cookies)
        {
            try
            {
                if (cookies == null || cookies.Count == 0)
                {
                    throw new Exception("No cookies to apply");
                }
                currentSessionCookie = cookies;                                
            }
            catch (Exception ex)
            {                
                throw new Exception($"Error applying session cookies: {ex.Message} {ex.StackTrace}");
            }
        }

        public void RestartFormInputSequence(string baseAddress, string user)
        {
            try
            {
                InitializeDriver();
                RecreateRegNumber();

                driver.Manage().Cookies.DeleteAllCookies();

                var url = new Uri(new Uri(baseAddress), "/Home/Index");
                driver.Url = url.AbsoluteUri;
                
                foreach (var cookie in currentSessionCookie)
                {
                    driver.Manage().Cookies.AddCookie(new OpenQA.Selenium.Cookie(cookie.Name, cookie.Value));
                }

                driver.Manage().Window.Maximize();
                driver.Url = url.AbsoluteUri;
                driver.Navigate();

                var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(30));
                wait.Until(ExpectedConditions.UrlContains("/Home/Index"));
                if (driver.Url.ToLower().Contains("login"))
                {
                    throw new Exception("Session expired, please login again.");
                }

                
                logger.LogStep(ReqNumber, 1, "START", "OK", $"Navigated to {url.AbsoluteUri}", user);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 1, "START", "9999", $"{ex.Message} {ex.StackTrace}", user);
                throw;
            }
        }


        public void Step1SelectSequence(DataToInput data, string username)
        {
            try
            {
                if (data.FlagBadanUsaha == "I")
                {
                    driver.FindElement(OpenQA.Selenium.By.Id("rbFlagBadanUsaha1")).Click();
                }
                else
                {
                    driver.FindElement(OpenQA.Selenium.By.Id("rbFlagBadanUsaha2")).Click();
                }

                var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(30));
                if (data.FlagBadanUsaha == "I")
                {
                    wait.Until(ExpectedConditions.ElementIsVisible(OpenQA.Selenium.By.ClassName("div-orang")));

                }
                else
                {
                    wait.Until(ExpectedConditions.ElementIsVisible(OpenQA.Selenium.By.ClassName("div-pengusaha")));

                }

                logger.LogStep(ReqNumber, 2, "STEP01", "OK", $"{data?.CIFNo}: Input FlagBadanUsaha: {data?.FlagBadanUsaha}", username);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 2, "STEP01", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }

        public void Step2InputSequence(DataToInput data, string username)
        {
            try
            {
                driver.FindElement(OpenQA.Selenium.By.Id("txtCIFNo")).SendKeys(data?.CIFNo);

                logger.LogStep(ReqNumber, 3, "STEP02", "OK", $"{data?.CIFNo}: Input CIFNo: {data?.CIFNo}", username);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 3, "STEP02", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }

        public void Step3InputSequence(DataToInput data, string username)
        {
            try
            {
                driver.FindElement(OpenQA.Selenium.By.Id("txtNama")).SendKeys(data?.Nama);

                logger.LogStep(ReqNumber, 4, "STEP03", "OK", $"{data?.CIFNo}: Input Nama: {data?.Nama}", username);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 4, "STEP03", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }


        public void Step4InputSequence(DataToInput data, string username)
        {
            try
            {
                driver.FindElement(OpenQA.Selenium.By.Id("txtEmail")).SendKeys(data?.Email);

                logger.LogStep(ReqNumber, 5, "STEP04", "OK", $"{data?.CIFNo}: Input Email: {data?.Email}", username);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 5, "STEP04", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }

        public void Step5InputSequence(DataToInput data, string username)
        {
            try
            {
                driver.FindElement(OpenQA.Selenium.By.Id("txtNPWP")).SendKeys(data?.NPWP);

                logger.LogStep(ReqNumber, 6, "STEP05", "OK", $"{data?.CIFNo}: Input NPWP: {data?.NPWP}", username);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 6, "STEP05", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }

        public void Step6InputSequence(DataToInput data, string username)
        {
            try
            {
                if (data.FlagBadanUsaha == "I")
                {
                    var element = driver.FindElement(OpenQA.Selenium.By.Id("cboJenisKelamin"));
                    if (element == null)
                    {
                        throw new Exception("Element Jenis Kelamin not found");
                    }
                    else
                    {
                        var selectElement = new SelectElement(element);
                        selectElement.SelectByValue(data?.JenisKelamin);
                    }

                    logger.LogStep(ReqNumber, 7, "STEP06", "OK", $"{data?.CIFNo}: Input JenisKelamin: {data?.JenisKelamin}", username);
                }
                else
                {
                    logger.LogStep(ReqNumber, 7, "STEP06", "OK", $"{data?.CIFNo}: PASS NO INPUT", username);
                }
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 7, "STEP06", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }

        public void Step7InputSequence(DataToInput data, string username)
        {
            try
            {
                if (data.FlagBadanUsaha == "I")
                {
                    driver.FindElement(OpenQA.Selenium.By.Id("txtNoKTP")).SendKeys(data?.NoKTP);

                    logger.LogStep(ReqNumber, 8, "STEP07", "OK", $"{data?.CIFNo}: Input NoKTP: {data?.NoKTP}", username);
                }
                else
                {
                    logger.LogStep(ReqNumber, 8, "STEP07", "OK", $"{data?.CIFNo}: PASS NO INPUT", username);
                }
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 8, "STEP07", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }

        public void Step8InputSequence(DataToInput data, string username)
        {
            try
            {
                if (data.FlagBadanUsaha == "B")
                {
                    driver.FindElement(OpenQA.Selenium.By.Id("txtNoAkta")).SendKeys(data?.NoAkta);

                    logger.LogStep(ReqNumber, 9, "STEP08", "OK", $"{data?.CIFNo}: Input NoAkta: {data?.NoAkta}", username);
                }
                else
                {
                    logger.LogStep(ReqNumber, 9, "STEP08", "OK", $"{data?.CIFNo}: PASS NO INPUT", username);
                }
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 9, "STEP08", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }

        public void Step9InputSequence(DataToInput data, string username)
        {
            try
            {
                driver.FindElement(OpenQA.Selenium.By.Id("txtAlamat")).SendKeys(data?.Alamat);

                logger.LogStep(ReqNumber, 10, "STEP09", "OK", $"{data?.CIFNo}: Input Alamat: {data?.Alamat}", username);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 10, "STEP09", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }


        public void Step10InputSequence(DataToInput data, string username)
        {
            try
            {
                driver.FindElement(OpenQA.Selenium.By.Id("txtNoTelepon")).SendKeys(data?.NoTelepon);

                logger.LogStep(ReqNumber, 11, "STEP10", "OK", $"{data?.CIFNo}: Input NoTelepon: {data?.NoTelepon}", username);
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 11, "STEP10", "9999", $"{data?.CIFNo}: {ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }

        public void Step11SubmitSequence(DataToInput data, string username)
        {
            try
            {
                Thread.Sleep(2000);
                driver.FindElement(OpenQA.Selenium.By.Id("btnSimpan")).Click();
                var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(300));
                var alert = wait.Until(ExpectedConditions.AlertIsPresent());
                var alertText = alert.Text;
                alert.Accept();

                if (alertText?.ToUpper()?.Contains("SUKSES") == true
                    || alertText?.ToLower()?.Contains("success") == true
                    )
                {
                    //sukses
                    logger.LogStep(ReqNumber, 12, "STEP11", "OK", $"{data?.CIFNo}: Submit success for user {username}", username);
                }
                else
                {
                    //error
                    logger.LogStep(ReqNumber, 12, "STEP11", "9999", $"{data?.CIFNo}: Submit Failed {alertText}", username);
                }
                Thread.Sleep(2000);
                driver.Quit();
            }
            catch (Exception ex)
            {
                if (driver != null)
                {
                    driver.Quit();
                }
                logger.LogStep(ReqNumber, 12, "LOGIN", "99", $"{ex.Message} {ex.StackTrace}", username);
                throw;
            }
        }


        public bool InputForm(string baseAddress, string username)
        {
            try
            {
                var data = dsSvc.GetAllListDataToInput().ToList();
                
                foreach (var item in data)
                {
                    RestartFormInputSequence(baseAddress, username);
                    Step1SelectSequence(item, username);
                    Step2InputSequence(item, username);
                    Step3InputSequence(item, username);
                    Step4InputSequence(item, username);
                    Step5InputSequence(item, username);
                    Step6InputSequence(item, username);
                    Step7InputSequence(item, username);
                    Step8InputSequence(item, username);
                    Step9InputSequence(item, username);
                    Step10InputSequence(item, username);
                    Step11SubmitSequence(item, username);
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}