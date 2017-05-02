using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                litAddress.Text = new ContentSystem().GetPageContent(3).PageContent;

                ddlSubject.DataSource = new ContentSystem().GetAllSubjectContact();
                ddlSubject.DataValueField = "ID";
                ddlSubject.DataTextField = "Nama";
                ddlSubject.DataBind();

            }
        }
    }
}