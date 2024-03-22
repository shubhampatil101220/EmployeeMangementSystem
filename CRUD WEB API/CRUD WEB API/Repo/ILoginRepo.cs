using CRUD_WEB_API.Model;

namespace CRUD_WEB_API.Repo
{
    public interface ILoginRepo

    {
        public IEnumerable<User> CheckCredentials(Login login);

        public bool CheckMail(Login login);

        public User VerifyOTP(Login login);

    }
}
