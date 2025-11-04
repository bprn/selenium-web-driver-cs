using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using System.Text.Json.Serialization;
using WebProspek.Business;
using WebProspek.CommonSystem;
using WebProspek.DbContexts;
using WebProspek.Interfaces;

namespace WebProspek
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            var appsetting = builder.Configuration.AddJsonFile("appsettings.json").AddEnvironmentVariables().Build();

            builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme) 
                            .AddCookie(CookieAuthenticationDefaults.AuthenticationScheme, options =>
                            {
                                options.Cookie.Name = "TemenosCookie";
                                options.Cookie.HttpOnly = false;
                                options.Cookie.SameSite = SameSiteMode.Unspecified;                                
                                options.LoginPath = "/Account/Login";  
                                options.AccessDeniedPath = "/Account/AccessDenied";  
                                options.ExpireTimeSpan = TimeSpan.FromMinutes(30);  
                                options.SlidingExpiration = true;
                                
                            });
            builder.Services.AddAuthorization();

            builder.Services.AddSession();            
            builder.Services.AddHttpContextAccessor();
            builder.Services.AddSingleton<IConfiguration>(appsetting);
            builder.Services.AddDbContext<ITemenosDBContext, TemenosDBContext>((svc, options) =>
            {
                var configuration = svc.GetRequiredService<IConfiguration>();
                var connstring = configuration.GetValue<string>("ConnectionStrings:SeleniumApp");
                options.UseSqlServer(connstring);
            });

            // Add services to the container.
            builder.Services.AddControllersWithViews()
                .AddRazorRuntimeCompilation()
                 .AddJsonOptions(options =>
                 {
                     options.JsonSerializerOptions.PropertyNamingPolicy = new DefaultNoNamingChangePolicy();
                     options.JsonSerializerOptions.PropertyNameCaseInsensitive = true;
                     options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
                 })
                 .AddSessionStateTempDataProvider()
                 ; 

            builder.Services.AddScoped<IUserService, UserService>();
            builder.Services.AddScoped<IDataProspekService  , DataProspekService>();


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }


            app.UseHttpsRedirection();
            app.UseCors();
            app.UseStaticFiles();

            app.UseAuthentication();
            app.UseAuthorization();
                      
            

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
