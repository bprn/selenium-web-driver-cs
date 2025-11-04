using WebProspek.Entities.SeleniumApp;

namespace WebProspek.Interfaces
{
    public interface IDataProspekService
    {
        long AddNewCustomer(Customer customer);
        IQueryable<Customer> GetAllCustomers();
        Customer GetCustomerByCIF(string cifNo);
        Customer GetCustomerById(int customerId);
    }
}
