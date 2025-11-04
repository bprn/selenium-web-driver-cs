using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Windows.Forms.Design;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using WinFormsSelenium1.DbContexts;
using WinFormsSelenium1.Interfaces;
using WinFormsSelenium1.Business;

namespace WinFormsSelenium1
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // Create a service collection
            var services = new ServiceCollection();

            // Register services and forms
            ConfigureServices(services);

            // Build the service provider
            var serviceProvider = services.BuildServiceProvider();

            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            Application.Run(serviceProvider.GetRequiredService<Form1>());
        }


        private static void ConfigureServices(ServiceCollection services)
        {
            try
            {
                // Load configuration from appsettings.json
                var appsetting = new ConfigurationBuilder()                    
                    .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                    .Build();

                services.AddSingleton<IConfiguration>(appsetting);
                services.AddDbContext<ITemenosDBContext, TemenosDBContext>((svc, options) =>
                {                    
                    var connstring = Properties.Settings.Default.ConnectionStrings;
                    options.UseSqlServer(connstring);
                });

                services.AddScoped<ISeleniumLoggerService, SeleniumLoggerService>();
                services.AddScoped<IDataSourceService, DummyDataSourceService>();
                services.AddScoped<ILoginAutomationService, LoginAutomationService>();
                services.AddScoped<IFormInputAutomationService, FormProspekAutomationService>();

                // Register forms
                services.AddTransient<Form1>();

                // Register other services
                //services.AddSingleton<IMyService, MyService>();
            }
            catch (Exception ex)
            {
                // Handle registration errors
                MessageBox.Show($"Service registration failed: {ex.Message}", "Configuration Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                throw; // Re-throw to ensure the application doesn't proceed in an invalid state
            }
        }
    }

}



