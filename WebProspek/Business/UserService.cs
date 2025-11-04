using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;
using WebProspek.Entities.SeleniumApp;
using WebProspek.Interfaces;

namespace WebProspek.Business
{
  

    public class UserService : IUserService
    {
        private ITemenosDBContext dBContext;
        private IHttpContextAccessor httpCtxAccess;
        public UserService(ITemenosDBContext temenosDBContext, IHttpContextAccessor httpContextAccessor)
        {
            dBContext = temenosDBContext;
            httpCtxAccess = httpContextAccessor;
        }

        public IQueryable<AppUser> GetAllListUsers()
        {
            return dBContext.AppUsers.AsQueryable();
        }

        public AppUser GetUserById(string userId)
        {
            return dBContext.AppUsers.FirstOrDefault(u => u.Username == userId);
        }

        public AppUser ValidateUser(string userId, string password)
        {
            return dBContext.AppUsers.FirstOrDefault(u => u.Username == userId && u.Password == password);
        }


        public async Task<bool> LoginAsync(string userId, string password)
        {
            var user = ValidateUser(userId, password);
            if (user != null)
            {
                var identity = new ClaimsIdentity(new[]
                {
                    new Claim(ClaimTypes.Name, user.Username)
                }, CookieAuthenticationDefaults.AuthenticationScheme);

                var authProperties = new AuthenticationProperties
                {
                    IsPersistent = true, // Cookie akan bertahan setelah browser ditutup
                    ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(30)
                };

                var httpContext = httpCtxAccess.HttpContext;

                await httpContext.SignInAsync(
                    CookieAuthenticationDefaults.AuthenticationScheme,
                    new ClaimsPrincipal(identity),
                    authProperties);

                return true;
            }
            else
            {
                return false;
            }
        }

        public async Task LogoutAsync()
        {
            var httpContext = httpCtxAccess.HttpContext;
            await httpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        }


    }
}
