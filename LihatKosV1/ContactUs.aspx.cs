using LihatKos.BusinessFacade;
using LihatKos.Common;
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

        protected void btnContactUs_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                var Data = new ContactData();
                var UserID = Convert.ToInt64(Session["UserID"]);
                Data.SubjectID = Convert.ToInt32(ddlSubject.SelectedValue);
                Data.Message = txtMessage.Text;
                Data.Status = 0;
                Data.UserID = UserID;
                var retVal = new ContentSystem().InsertContactUs(Data);
                if (retVal == true)
                {
                    pnlSuccess.Visible = true;
                    Response.AddHeader("REFRESH", "2;URL=/");

                    Response.Redirect("/ContactUs");
                }
            }
        }
    }
}