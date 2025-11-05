using OpenQA.Selenium.Edge;
using WinFormsSelenium1.Interfaces;

namespace WinFormsSelenium1
{
    public partial class Form1 : Form
    {
        private ILoginAutomationService loginAuto;
        private IFormInputAutomationService inputAuto;
        private ISeleniumLoggerService loggerSvc;
        private List<OpenQA.Selenium.Cookie> sessionCookie;

        public Form1(
             ILoginAutomationService loginAutomationService,
             IFormInputAutomationService formInputAutomationService,
             ISeleniumLoggerService seleniumLoggerService
            )
        {
             loginAuto = loginAutomationService;
             inputAuto = formInputAutomationService;
             loggerSvc = seleniumLoggerService;

            InitializeComponent();
        }


        private void RefreshGrid()
        {
            var ds = loggerSvc.GetLatestLogs(1000).ToList();
            gvLogs.DataSource = ds;
            gvLogs.Refresh();
        }


        private void button1_Click(object sender, EventArgs e)
        {
            //var options = new EdgeOptions();
            //options.UseWebView = false;
            //var driver = new EdgeDriver(options);
            //var url = new Uri(new Uri(txtBaseAddress.Text), "/Account/Login");
            //driver.Url = url.AbsoluteUri;
            //driver.Navigate();


            var result = loginAuto.Login(txtBaseAddress.Text, txtUsername.Text, txtPassword.Text);
            if (result)
            {
                MessageBox.Show("Login Completed");
                sessionCookie = loginAuto.GetCurrentCookies();
            }
            else
            {
                MessageBox.Show("Login Failed or Error");
            }
            RefreshGrid();
            this.BringToFront();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            var result = loginAuto.Logout(txtBaseAddress.Text, txtUsername.Text);
            if (result)
            {
                MessageBox.Show("Logout Completed");
            }
            else
            {
                MessageBox.Show("Logout Failed or Error");
            }
            RefreshGrid();
            this.BringToFront();
        }

        private void btnAutoInputProspek_Click(object sender, EventArgs e)
        {
            if (sessionCookie != null)
            {
                inputAuto.ApplySessionCookie(sessionCookie);
            }
            var result = inputAuto.InputForm(txtBaseAddress.Text, txtUsername.Text);
            if (result)
            {
                MessageBox.Show("Input Data Completed");
            }
            else
            {
                MessageBox.Show("Input Data Failed or Contain Error");
            }
            RefreshGrid();
            this.BringToFront();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            RefreshGrid();
        }
    }
}
