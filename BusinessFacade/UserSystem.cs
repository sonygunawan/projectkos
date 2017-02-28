using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class UserSystem
    {
        public bool DoRegister(string UserName, string Email, string Password)
        {
            return new UserDA().DoRegister(UserName, Email, Password);
        }

        public Int64 DoSignIn(string Email, string Password)
        {
            return new UserDA().DoSignIn(Email, Password);
        }
    }
}
