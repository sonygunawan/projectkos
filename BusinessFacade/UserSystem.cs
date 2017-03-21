using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class UserSystem
    {
        public string DoRegister(string UserName, string Email, string Password)
        {
            //Return Message
            return new UserDA().DoRegister(UserName, Email, Password);
        }

        public Int64 DoSignIn(string Email, string Password)
        {
            return new UserDA().DoSignIn(Email, Password);
        }

        public List<UserData> GetUsers(Int64 UserID)
        {
            return new UserDA().GetUsers(UserID);
        }

    }
}
