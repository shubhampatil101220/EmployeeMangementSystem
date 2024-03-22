using CRUD_WEB_API.Model;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;

namespace CRUD_WEB_API.Repo
{
    public class CustomerRepo : ICustomerRepo
    {
        private readonly string conn;

        public CustomerRepo(string conn)
        {
            this.conn = conn;
        }

        public bool CreateCustomer(Customer customer)
        {
            //string query = "Insert into CRUD(FirstName,LastName,MiddleName,JobTitle,PersonalEmail,WorkEmail,CompanyContactEmail,Country,State,City,Linkedin,CreatedDate,Status) values (@FirstName,@LastName,@MiddleName,@JobTitle,@PersonalEmail,@WorkEmail,@CompanyContactEmail,@Country,@State,@City,@Linkedin,@CreatedDate,@Status)";
            //var parameters = new DynamicParameters();
            //parameters.Add("FirstName",user.FirstName,DbType.String);
            //parameters.Add("LastName", user.LastName, DbType.String);
            //parameters.Add("MiddleName", user.MiddleName, DbType.String);
            //parameters.Add("JobTitle", user.JobTitle, DbType.String);
            //parameters.Add("PersonalEmail", user.PersonalEmail, DbType.String);
            //parameters.Add("WorkEmail", user.WorkEmail, DbType.String);
            //parameters.Add("CompanyContactEmail", user.CompanyContactEmail, DbType.String);
            //parameters.Add("Country", user.Country, DbType.String);
            //parameters.Add("State", user.State, DbType.String);
            //parameters.Add("City", user.WorkEmail, DbType.String);
            //parameters.Add("Linkedin", user.Linkedin, DbType.String);
            //parameters.Add("CreatedDate", user.CreatedDate, DbType.DateTime);
            //parameters.Add("Status", user.Status, DbType.String);

            //using (var connection = new SqlConnection(conn))
            //{
            //    var res = connection.Query<User>(query,parameters);
            //    if (res != null)
            //    {
            //        return true;
            //    }
            //}

            //return false;
            try
            {
                using (var connection = new SqlConnection(conn))
                {
                    connection.Open();

                    var parameters = new DynamicParameters();
                    //parameters.Add("UserId", UserId, DbType.Int32);
                    parameters.Add("FirstName", customer.FirstName, DbType.String);
                    parameters.Add("LastName", customer.LastName, DbType.String);
                    parameters.Add("MiddleName", customer.MiddleName, DbType.String);
                    parameters.Add("JobTitle", customer.JobTitle, DbType.String);
                    parameters.Add("PersonalEmail", customer.PersonalEmail, DbType.String);
                    parameters.Add("WorkEmail", customer.WorkEmail, DbType.String);
                    parameters.Add("CompanyContactEmail", customer.CompanyContactEmail, DbType.String);
                    parameters.Add("Country", customer.Country, DbType.String);
                    parameters.Add("State", customer.State, DbType.String);
                    parameters.Add("City", customer.City, DbType.String);
                    parameters.Add("Linkedin", customer.Linkedin, DbType.String);
                    parameters.Add("Status", customer.Status, DbType.String);
                    parameters.Add("CreatedBy", customer.CreatedBy, DbType.String);
                    parameters.Add("CreatedId", customer.CreatedId, DbType.String);

                    int rowsAffected = connection.Execute("SP_Create_Customer", parameters, commandType: CommandType.StoredProcedure);

                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
                // Log or handle the exception appropriately
                return false;
            }
        }



        public IEnumerable<Customer> GetAllCustomer()
        {
            string query = "SELECT * FROM tblLeadDetail where isDeleted=0";
            using (var connection = new SqlConnection(conn))
            {
                var res = connection.Query<Customer>(query);
                return res;
            }
        }
        //==========================================================================================================================
        public IEnumerable<Customer> GetAllCustomerByFilter(int page = 1, int pageSize = 10)
        {
            using (var connection = new SqlConnection(conn))
            {
                var parameters = new { Page = page, PageSize = pageSize };
                return connection.Query<Customer>("sp_GetAllCustomerByFilter", parameters, commandType: CommandType.StoredProcedure);
            }
        }
        //==========================================================================================================================
        public IEnumerable<Customer> GetAllCustomerByFilterId(int page = 1, int pageSize = 10,int CreatedId=1)
        {
            using (var connection = new SqlConnection(conn))
            {
                var parameters = new { Page = page, PageSize = pageSize };
                return connection.Query<Customer>("sp_GetUsersCustomerByFilterId", parameters, commandType: CommandType.StoredProcedure);
            }
        }


        //==========================================================================================================================

        public int GetAllCustomerCount()
        {
            string query = "SELECT COUNT(*)  FROM tblLeadDetail WHERE isDeleted = 0";
            using (var connection = new SqlConnection(conn))
            {
                connection.Open();
                int count = connection.ExecuteScalar<int>(query);
                return count;
            }
        }


        public IEnumerable<Customer> GetAllCustomerOfUser(string createdBy)
        {
            string query = "SELECT * FROM tblLeadDetail WHERE CreatedBy = @CreatedBy AND isDeleted = 0";
            using (var connection = new SqlConnection(conn))
            {
                var parameters = new { CreatedBy = createdBy };
           var res = connection.Query<Customer>(query, parameters);
                return res;
            }
        }
        public IEnumerable<Customer> GetAllCustomerOfUser(int UserId)
        {
            string query = "SELECT * FROM tblLeadDetail WHERE CreatedId = @UserId AND isDeleted = 0";
            using (var connection = new SqlConnection(conn))
            {
                var parameters = new { UserId = UserId };
                var res = connection.Query<Customer>(query, parameters);
                return res;
            }
        }
        public int GetAllUsersCustomerCount(int UserId)
        {
            string query = "SELECT COUNT(*)  FROM tblLeadDetail WHERE CreatedId = @UserId AND isDeleted = 0";
            using (var connection = new SqlConnection(conn))
            {
                connection.Open();
                var parameters = new { UserId = UserId };
                int count = connection.ExecuteScalar<int>(query,parameters);
                return count;
            }
        }


        public IEnumerable<Customer> GetCustomerById(int LeadId)
        {
            string query = "SELECT * FROM tblLeadDetail where LeadId=@LeadId AND isDeleted = 0";
            using (var connection = new SqlConnection(conn))
            {
                var res = connection.Query<Customer>(query, new { LeadId });
                return res;
            }
        }

        public bool RemoveCustomer(int LeadId)
        {

            string query = "UPDATE tblLeadDetail SET isDeleted = 1  WHERE LeadId = @LeadId;";
            using (var connection = new SqlConnection(conn))
            {
                var res = connection.Query<Customer>(query, new { LeadId });
                if (res != null)
                {
                    return true;
                }
            }
            return false;
        }

        public bool UpdateCustomer(Customer customer)
        {
            try
            {
                using (var connection = new SqlConnection(conn))
                {
                    connection.Open();

                    var parameters = new DynamicParameters();
                    parameters.Add("LeadId", customer.LeadId, DbType.Int32);
                    parameters.Add("FirstName", customer.FirstName, DbType.String);
                    parameters.Add("LastName", customer.LastName, DbType.String);
                    parameters.Add("MiddleName", customer.MiddleName, DbType.String);
                    parameters.Add("JobTitle", customer.JobTitle, DbType.String);
                    parameters.Add("PersonalEmail", customer.PersonalEmail, DbType.String);
                    parameters.Add("WorkEmail", customer.WorkEmail, DbType.String);
                    parameters.Add("CompanyContactEmail", customer.CompanyContactEmail, DbType.String);
                    parameters.Add("Country", customer.Country, DbType.String);
                    parameters.Add("State", customer.State, DbType.String);
                    parameters.Add("City", customer.City, DbType.String);
                    parameters.Add("Linkedin", customer.Linkedin, DbType.String);
                    parameters.Add("Status", customer.Status, DbType.String);
                    parameters.Add("CreatedBy", customer.CreatedBy, DbType.String);

                    int rowsAffected = connection.Execute("SP_Update_Customer", parameters, commandType: CommandType.StoredProcedure);

                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
                // Log or handle the exception appropriately
                return false;
            }
        }
    }
}
