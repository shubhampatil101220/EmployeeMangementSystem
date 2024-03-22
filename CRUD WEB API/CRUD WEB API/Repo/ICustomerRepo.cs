using CRUD_WEB_API.Model;

namespace CRUD_WEB_API.Repo
{
    public interface ICustomerRepo
    {
        public IEnumerable<Customer> GetAllCustomer();

        public int GetAllCustomerCount();

        //==========================================================================================================================
        public IEnumerable<Customer> GetAllCustomerByFilter(int page = 1, int pageSize = 10);
        //==========================================================================================================================
        public IEnumerable<Customer> GetAllCustomerByFilterId(int page = 1, int pageSize = 10, int CreatedId = 1);
        //==========================================================================================================================

        public IEnumerable<Customer> GetCustomerById(int LeadId);

        public IEnumerable<Customer> GetAllCustomerOfUser(string CreatedBy);

        public IEnumerable<Customer> GetAllCustomerOfUser(int UserId);

        public bool CreateCustomer(Customer customer);

        public bool UpdateCustomer(Customer customer);

        public bool RemoveCustomer(int LeadId);

        public int GetAllUsersCustomerCount(int UserId);
    }
}
