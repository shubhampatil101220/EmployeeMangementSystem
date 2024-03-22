namespace CRUD_WEB_API.Model
{
    public class User
    {
      

        public int UserId { get; set; }

        public string? FirstName { get; set; }

        public string? LastName { get; set; }

        public string? MiddleName { get; set; }

        public string? Email { get; set; }

        public string? Password { get; set; }

        public DateTime CreatedDate { get; set; }

        public int isDeleted { get; set; }
    
        public int RoleId { get; set;}

        public string? Token { get; set; }

    }
}
