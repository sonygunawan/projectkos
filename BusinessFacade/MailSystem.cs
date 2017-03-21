using LihatKos.DataAccess.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class MailSystem
    {
        public string DeleteUserActivation(Guid ActivationCode)
        {
            return new MailHelper().DeleteUserActivation(ActivationCode);
        }
    }
}
