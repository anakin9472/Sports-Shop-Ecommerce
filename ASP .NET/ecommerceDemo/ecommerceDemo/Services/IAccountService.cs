using ecommerceDemo.Models;

namespace ecommerceDemo.Services
{
    public interface IAccountService
    {
       
        IEnumerable<Account> GetAllAccounts();

        Account GetAccountById(int id);


    }
}
