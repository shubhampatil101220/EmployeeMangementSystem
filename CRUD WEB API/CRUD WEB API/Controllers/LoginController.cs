using CRUD_WEB_API.Model;
using CRUD_WEB_API.Repo;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace CRUD_WEB_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly ILoginRepo repo;
        public LoginController(ILoginRepo repo)
        {
            this.repo = repo;

        }
     

        [HttpPost]
        [Route("loginUser")]
        public IActionResult Login([FromBody] Login model)
        {
            var _list = repo.CheckCredentials(model);
            if (_list != null)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }
        }
        [HttpPost]
        [Route("checkMail")]
        public IActionResult checkMailAvailable([FromBody] Login model)
        {
            var _list = repo.CheckMail(model);
        
            if (_list)
            {
                return Ok(true);
            }
            else
            {
                return Ok(false);
            }
        }
        [HttpPost]
        [Route("verifyOTP")]
        public IActionResult verifyUser([FromBody] Login model)
        {
            var user = repo.VerifyOTP(model);
            if (user != null)
            {
               

                // Return user details along with the token
                return Ok(user);
            }
            else
            {
                return NotFound();
            }
        }
      
    }
}
