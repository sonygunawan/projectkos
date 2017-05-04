using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class ContentSystem
    {
        public ContentData GetPageContent(Int32 Id)
        {
            return new ContentDA().getPageContent(Id);
        }

        public bool UpdatePageContent(ContentData Data)
        {
            return new ContentDA().UpdatePageContent(Data);
        }

        #region Contact

        public List<ContactData> GetContactData(long Id = 0)
        {
            return new ContentDA().GetContactData(Id);
        }
        public object GetContactDataSmp(string search)
        {
            var tempcontacts = new ContentDA().GetContactData();
            var contacts = tempcontacts.Where(x => x.Message.Contains(search) 
                || x.Email.Contains(search) 
                || x.SubjectContact.Contains(search)).ToList();
            return contacts;
        }
        public List<ContentData> GetAllSubjectContact()
        {
            return new ContentDA().GetAllSubjectContact();
        }
        public bool InsertContactUs(ContactData Data)
        {
            return new ContentDA().InsertContactUs(Data);
        }
        public bool UpdateContactAktif(long ID, int Status)
        {
            var data = new ContactData();
            data.ID = ID;
            data.Status = Status;
            return new ContentDA().UpdateContactAktif(data);
        }
        #endregion 
    
    
    }
}
