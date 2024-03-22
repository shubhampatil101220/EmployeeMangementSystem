using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace CRUD_WEB_API.Model.Data
{
    public class DapperDBContext
    {
        private readonly string connectionstring;

        public DapperDBContext(string connectionString)
        {
            this.connectionstring = connectionString;
        }

        public IDbConnection CreateConnection() => new SqlConnection(connectionstring);
    }
}
