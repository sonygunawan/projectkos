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

        public List<ContentData> GetAllSubjectContact()
        {
            return new ContentDA().GetAllSubjectContact();
        }
        public ContentData GetPageContent(Int32 Id)
        {
            return new ContentDA().getPageContent(Id);
        }
    }
}
