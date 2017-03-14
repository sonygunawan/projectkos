using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.MasterPage
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                liLogin.Visible = true;
                liRegister.Visible = true;

                pWelcome.Visible = false;
            }
            else
            {
                liLogin.Visible = false;
                liRegister.Visible = false;
                //liLogout.Visible = true;
                pWelcome.Visible = true;
                var user = new UserSystem().GetUsers(Convert.ToInt64(Session["UserID"]))[0];
                litUsername.Text = user.UserName;
            }
            
        }
    }
}