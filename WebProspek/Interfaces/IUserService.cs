using WebProspek.Entities.SeleniumApp;

namespace WebProspek.Interfaces
{
    public interface IUserService
    {
        IQueryable<AppUser> GetAllListUsers();
        AppUser GetUserById(string userId);
        Task<bool> LoginAsync(string userId, string password);
        Task LogoutAsync();
        AppUser ValidateUser(string userId, string password);
    }


}
