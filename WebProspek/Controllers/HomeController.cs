using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebProspek.Entities.SeleniumApp;
using WebProspek.Interfaces;
using WebProspek.Models;

namespace WebProspek.Controllers
{

    [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private IDataProspekService dataSvc;

        public HomeController(
            IDataProspekService dataProspekService,
            ILogger<HomeController> logger)
        {
            dataSvc = dataProspekService;
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public IActionResult Submit(Customer data)
        {
            try
            {
                var result = dataSvc.AddNewCustomer(data);  
                if(result >= 0)
                {
                    return this.Json(new { IsSuccess = true, Message = "Data has been saved successfully." });
                }
                else
                {
                    throw new Exception("Failed to save data.");
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error in Submit");
                return this.Json(new { IsSuccess = false, Message = $"Save Failed ! {ex.Message}" });
            }
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
