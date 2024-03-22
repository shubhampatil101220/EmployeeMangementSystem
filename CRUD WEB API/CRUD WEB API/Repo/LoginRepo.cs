using CRUD_WEB_API.Model;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System;
using System.Text;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;

namespace CRUD_WEB_API.Repo
{
    public class LoginRepo : ILoginRepo
    {
        private readonly string conn;

        public LoginRepo(string conn)
        {
            this.conn = conn;
        }



        public IEnumerable<User> CheckCredentials(Login login)
        {
            using (var connection = new SqlConnection(conn))
            {
                connection.Open();

                var parameters = new DynamicParameters();
                parameters.Add("@Email", login.email, DbType.String); // Assuming email corresponds to the username in your database
                parameters.Add("@Password", login.password, DbType.String);

                var result = connection.Query<User>("UserLogin", parameters, commandType: CommandType.StoredProcedure);

                return result;
            }
        }
        public User VerifyOTP(Login login)
        {
            using (var connection = new SqlConnection(conn))
            {
                connection.Open();

                var parameters = new DynamicParameters();
                parameters.Add("@Email", login.email, DbType.String);

                var user = connection.QueryFirstOrDefault<User>("UserDataRole", parameters, commandType: CommandType.StoredProcedure);
                if (user != null)
                {
                    // Generate JWT token for the user
            
                    user.Token = CreateJwt(user);
                }
                return user;
            }
        }
        public bool CheckMail(Login login)
        {
            using (var connection = new SqlConnection(conn))
            {
                connection.Open();

                var parameters = new DynamicParameters();
                parameters.Add("@Email", login.email, DbType.String);

                // Execute the stored procedure
                var result = connection.Query<User>("UserDataRole", parameters, commandType: CommandType.StoredProcedure);

                // Check if any records are returned
                if (result.Any())
                {
                    return true; // User with given email exists
                }
            }
            return false; // User with given email doesn't exist
        }

        private string CreateJwt(User user)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes("veryveryverysecretsecretsecret.....");
            var identity = new ClaimsIdentity(new Claim[]

            {
                new Claim(ClaimTypes.NameIdentifier, user.UserId.ToString()),
                new Claim(ClaimTypes.Name,user.FirstName),
                new Claim(ClaimTypes.Email,user.Email),

            });
            var credentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = identity,
                Expires = DateTime.Now.AddDays(1),
                SigningCredentials = credentials
            };
            var token = jwtTokenHandler.CreateToken(tokenDescriptor);
            return jwtTokenHandler.WriteToken(token);
        }
    }
}
