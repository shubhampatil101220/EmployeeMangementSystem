using CRUD_WEB_API.Model;
using CRUD_WEB_API.Model.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace CRUD_WEB_API.Repo
{
    public class UserRepo : IUserRepo
    {
        private readonly string conn;

        public UserRepo(string conn)
        {
            this.conn = conn;
        }

        public bool CreateUser(User user)
        {
          
            try
            {
                using (var connection = new SqlConnection(conn))
                {
                    connection.Open();

                    var parameters = new DynamicParameters();
                    //parameters.Add("UserId", UserId, DbType.Int32);
                    parameters.Add("FirstName", user.FirstName, DbType.String);
                    parameters.Add("LastName", user.LastName, DbType.String);
                    parameters.Add("MiddleName", user.MiddleName, DbType.String);   
                    parameters.Add("Email", user.Email, DbType.String);
                    parameters.Add("Password", user.Password, DbType.String);
                    parameters.Add("RoleId", user.RoleId, DbType.Int64);

                    int rowsAffected = connection.Execute("SP_Create_User", parameters, commandType: CommandType.StoredProcedure);

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
    


        public IEnumerable<User> GetAllUser()
        {
            string query = "SELECT u.*, ur.RoleId   FROM tblUser u   INNER JOIN userRoles ur ON u.UserID = ur.UserID    WHERE u.isDeleted = 0;";
            using (var connection = new SqlConnection(conn))
            {
                var res = connection.Query<User>(query);
                return res;
            }
        }

        //==========================================================================================================================
        public IEnumerable<User> GetAllUserByFilter(int page = 1, int pageSize = 10)
        {
            using (var connection = new SqlConnection(conn))
            {
                var parameters = new { Page = page, PageSize = pageSize };
                return connection.Query<User>("sp_GetAllUserByFilter", parameters, commandType: CommandType.StoredProcedure);
            }
        }
        //==========================================================================================================================
        public int GetAllUserCount()
        {
            string query = "SELECT COUNT(*)  FROM tblUser WHERE isDeleted = 0";
            using (var connection = new SqlConnection(conn))
            {
                connection.Open();
                int count = connection.ExecuteScalar<int>(query);
                return count;
            }
        }

        public  IEnumerable<User> GetUserById(int UserId)
        {
            string query = "SELECT * FROM tblUser where UserId=@UserId AND isDeleted = 0";
            using (var connection = new SqlConnection(conn))
            {
                var res = connection.Query<User>(query,new { UserId });
                return res;
            }
        }

        public bool RemoveUser(int UserId)
        {
            string query = "UPDATE tblUser SET isDeleted = 1  WHERE UserId=@UserId";
          
            using (var connection = new SqlConnection(conn))
            {
                var res = connection.Query<User>(query, new { UserId });
                if(res != null)
                {
                    return true;
                }
            }
            return false;
        }

        public bool UpdateUser(User user)
        {
            try
            {
                using (var connection = new SqlConnection(conn))
                {
                    connection.Open();

                    var parameters = new DynamicParameters();
                    parameters.Add("UserId", user.UserId, DbType.Int32);
                    parameters.Add("FirstName", user.FirstName, DbType.String);
                    parameters.Add("LastName", user.LastName, DbType.String);
                    parameters.Add("MiddleName", user.MiddleName, DbType.String);
                    parameters.Add("Email", user.Email, DbType.String);
                    parameters.Add("Password", user.Password, DbType.String);
                    parameters.Add("RoleId", user.RoleId, DbType.Int64);


                    int rowsAffected = connection.Execute("SP_Update_User", parameters, commandType: CommandType.StoredProcedure);

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
