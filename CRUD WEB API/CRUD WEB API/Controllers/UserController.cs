using CRUD_WEB_API.Model;
using CRUD_WEB_API.Repo;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CRUD_WEB_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserRepo repo;
        public UserController(IUserRepo repo)
        {
            this.repo = repo;
        }



        [HttpGet("GetAllUser")]
        public IActionResult GetAll()
        {
            var _list = repo.GetAllUser();
            userList.AddRange(_list);
            if (_list != null)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }

        [HttpGet("GetAllUserCount")]
        public IActionResult GetAllUserCount()
        {
            int count = repo.GetAllUserCount();
            if (count >= 0) // Assuming count will never be negative
            {
                return Ok(count);
            }
            else
            {
                return Ok(count);
            }
        }



        private List<User> userList = new List<User>();
        //[HttpGet("GetUserByFilter")]
        //public IEnumerable<User> Get(int page = 1, int pageSize = 10)
        //{
        //    var _list = repo.GetAllUser();
        //    userList.AddRange(_list);
        //    var totalcount = userList.Count();
        //    var totalPages = (int)Math.Ceiling((decimal)totalcount / pageSize);
        //    var productsPerPage = userList
        //        .Skip((page - 1) * pageSize)
        //        .Take(pageSize).ToList();
        //    return productsPerPage;
        //}

        //==========================================================================================================================
        [HttpGet("GetUserByFilter")]
        public IEnumerable<User> GetAllUser(int page = 1, int pageSize = 10)
        {
            var _list = repo.GetAllUserByFilter(page, pageSize);
            return _list;
        }
        //==========================================================================================================================





        [HttpGet("GetUserById/{UserId}")]
        public IActionResult GetById(int UserId)
        {
            var _list = repo.GetUserById(UserId);
            if (_list != null)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }
        [HttpGet("RemoveUser/{UserId}")]
        public IActionResult Remove(int UserId)
        {
            var _list = repo.RemoveUser(UserId);
            if (_list)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }

        [HttpPost("CreateUser")]
        public IActionResult Create([FromBody] User user)
        {
            var _list = repo.CreateUser(user);
            if (_list)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }

        [HttpPut("UpdateUser")]
        public IActionResult Update([FromBody] User user)
        {
            var _list = repo.UpdateUser(user);
            if (_list)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }

    }
}
