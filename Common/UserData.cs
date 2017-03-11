using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common
{
    public class UserData
    {
        public Int64 ID { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public int TipeUserID { get; set; }
        public string TipeUser { get; set; }
        public DateTime LastActivityDate { get; set; }
    }
}
