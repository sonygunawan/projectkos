using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class EmailConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                string activationCode = !string.IsNullOrEmpty(Request.QueryString["Code"]) ? Request.QueryString["Code"] : Guid.Empty.ToString();
                ltMessage.Text = new MailSystem().DeleteUserActivation( new Guid(activationCode.ToUpper()));
                
            }
        }
    }
}