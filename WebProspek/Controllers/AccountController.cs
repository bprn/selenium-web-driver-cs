using Microsoft.AspNetCore.Mvc;
using WebProspek.Interfaces;

namespace WebProspek.Controllers
{
    public class AccountController : Controller
    {
        private IUserService userSvc;
        
        public AccountController(IUserService userService)
        {
            userSvc = userService;
        }

        public IActionResult Login(string ReturnUrl)
        {
           
            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> SubmitLogin(string userId, string password)
        {
            if (await userSvc.LoginAsync(userId, password))
            {
                return this.Json(new { IsSuccess = true, Message = "Login successful." });
            }
            else
            {
                return this.Json(new { IsSuccess = false, Message = "Invalid user ID or password." });
            }
        }


        public async Task<IActionResult> Logout()
        {
            await userSvc.LogoutAsync();

            return RedirectToAction("Login", "Account");
        }


    }
}
