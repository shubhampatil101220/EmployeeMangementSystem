using CRUD_WEB_API.Model;

namespace CRUD_WEB_API.Repo
{
    public interface IUserRepo
    {
        public IEnumerable<User> GetAllUser();

        public int  GetAllUserCount();

        //
        public IEnumerable<User> GetAllUserByFilter(int page = 1, int pageSize = 10);
        //

        public IEnumerable<User> GetUserById(int UserId);

        public bool CreateUser(User user);

        public bool UpdateUser(User user);

        public bool RemoveUser(int UserId);
    }
}
