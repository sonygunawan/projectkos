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
        public UserData DoSignIn(string Email, string Password)
        {
            return new UserDA().DoSignIn(Email, Password);
        }
        public UserData DoPassword(string Name)
        {
            return new UserDA().DoPassword(Name);
        }
        public List<UserData> GetUsers(Int64 UserID)
        {
            return new UserDA().GetUsers(UserID);
        }
        public bool UpdateUser(UserData user)
        {
            return new UserDA().UpdateUser(user);
        }
        public bool UpdateUserAktif(long UserID, int Aktif)
        {
            var user = new UserData();
            user.ID = UserID;
            user.IsActive = Aktif;
            return new UserDA().UpdateUserAktif(user);
        }

        #region TipeUser
        public List<TipeUserData> GetAllTipeUser()
        {
            return new UserDA().GetAllTipeUser();
        }

        #endregion

    }
}
