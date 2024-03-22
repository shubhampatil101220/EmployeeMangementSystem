namespace CRUD_WEB_API.Model
{
    public class Customer
    {
        public int LeadId { get; set; }

        public string? FirstName { get; set; }

        public string? LastName { get; set; }

        public string? MiddleName { get; set; }

        public string? JobTitle { get; set; }

        public string? PersonalEmail { get; set; }

        public string? WorkEmail { get; set; }

        public string? CompanyContactEmail { get; set; }

        public string? Country { get; set; }

        public string? State { get; set; }

        public string? City { get; set; }

        public string? Linkedin { get; set; }

        public string? Status { get; set; }

        public string? CreatedBy { get; set; }

        public string? CreatedId { get; set; }

        public DateTime? CreatedDate { get; set;}

        public int isDeleted { get; set; }



    }
}
