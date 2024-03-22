using CRUD_WEB_API.Model;
using CRUD_WEB_API.Repo;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Net;
using System.Net.Mail;
namespace CRUD_WEB_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
    
        private readonly ICustomerRepo repo;
        public CustomerController(ICustomerRepo repo) 
        {
            this.repo= repo;
        
        }
      

        
        [HttpGet("GetAllCustomer")]
        public IActionResult GetAll() 
        {
            var _list=  repo.GetAllCustomer();
            userList.AddRange(_list);
            if (_list !=null)
            {
                return Ok( _list);
            }
            else
            {
                return NotFound();
            }
        
        }
        [HttpGet("GetAllCustomerCount")]
        public IActionResult GetAllUserCount()
        {
            int count = repo.GetAllCustomerCount();
            if (count >= 0) // Assuming count will never be negative
            {
                return Ok(count);
            }
            else
            {
                return Ok(count);
            }
        }
        private List<Customer> userList = new List<Customer>();
        //[HttpGet("GetAllCustomerByFilter")]
        //public IEnumerable<Customer> Get(int page=1,int pageSize=10) 
        //{
        //    var _list = repo.GetAllCustomer();
        //    userList.AddRange(_list);
        //    var totalcount = userList.Count();
        //    var totalPages = (int)Math.Ceiling((decimal)totalcount / pageSize);
        //    var productsPerPage = userList
        //        .Skip((page-1)*pageSize)
        //        .Take(pageSize).ToList();
        //        return productsPerPage;
        //}

        //==========================================================================================================================
        [HttpGet("GetAllCustomerByFilter")]
        public IEnumerable<Customer> GetAll(int page = 1, int pageSize = 10)
        {
            var _list = repo.GetAllCustomerByFilter(page, pageSize);
            return _list;
        }
        //===========================================================================================================================
        [HttpGet("GetUserCustomerByFilter")]
        public IEnumerable<Customer> Get(int page = 1, int pageSize = 10,int CreatedId=1)
        {
            var _list = repo.GetAllCustomerByFilterId(page, pageSize,CreatedId);
            return _list;
        }

        //=============================================================================================================================

        //[HttpGet("GetUserCustomerByFilter")]
        //public IEnumerable<Customer> GetByUser(int page = 1, int pageSize = 10,int UserId=1)
        //{
        //    var _list = repo.GetAllCustomerOfUser(UserId);
        //    userList.AddRange(_list);
        //    var totalcount = userList.Count();
        //    var totalPages = (int)Math.Ceiling((decimal)totalcount / pageSize);
        //    var productsPerPage = userList
        //        .Skip((page - 1) * pageSize)
        //        .Take(pageSize).ToList();
        //    return productsPerPage;
        //}
       
        [HttpGet("GetAllCustomerOfUser/{CreatedBy}")]
        public IActionResult GetByUser(string CreatedBy)
        {
            var _list = repo.GetAllCustomerOfUser(CreatedBy);
            if (_list != null)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }
        [HttpGet("GetAllCustomerOfUserByCreatedId/{CreatedId}")]
        public IActionResult GetByUser(int CreatedId)
        {
            var _list = repo.GetAllCustomerOfUser(CreatedId);
            if (_list != null)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }

        [HttpGet("GetAllCustomerOfUserByCreatedIdCount/{UserId}")]
        public IActionResult GetAllUsersCustomerCount(int UserId)
        {
            int count = repo.GetAllUsersCustomerCount(UserId);
            if (count >= 0) // Assuming count will never be negative
            {
                return Ok(count);
            }
            else
            {
                return Ok(count);
            }
        }



        [HttpGet("GetCustomerById/{LeadId}")]
        public IActionResult GetById(int LeadId)
        {
            var _list = repo.GetCustomerById(LeadId);
            if (_list != null)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }
        [HttpGet("RemoveCustomer/{LeadId}")]
        public IActionResult Remove(int LeadId)
        {
            var _list = repo.RemoveCustomer(LeadId);
            if (_list)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }
        [HttpPost("CreateCustomer")]
        public IActionResult Create([FromBody]Customer customer)
        {
            var _list = repo.CreateCustomer(customer);
            if (_list)
            {
                return Ok(_list);
            }
            else
            {
                return NotFound();
            }

        }
        [HttpPut("UpdateCustomer")]
        public IActionResult Update([FromBody]Customer customer)
        {
            var _list = repo.UpdateCustomer(customer);
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
