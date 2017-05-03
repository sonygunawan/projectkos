using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common
{
    public class ContentData
    {
        public int ID { get; set; }
        public string Kode { get; set; }
        public string Nama { get; set; }
        public string PageTitle { get;set;}
        public string PageContent { get; set; }
    }

    public class ContactData
    {
        public long ID { get; set; }
        public int SubjectID { get; set; }
        public string Message { get; set; }
        public long UserID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string SubjectContact { get; set; }
        public int Status { get; set; }
        public string StrStatus
        {
            get {
                if (Status == 0)
                    return "Not Approved";
                else if (Status == 1)
                    return "Approved";
                else if (Status == -1)
                    return "Rejected";
                else
                    return "";
            }
        }
    }

}
