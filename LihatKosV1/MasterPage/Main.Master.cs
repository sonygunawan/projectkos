using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.MasterPage
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                liTambahKos.Visible = false;
                liLogin.Visible = true;
                liRegister.Visible = true;
                //liLogout.Visible = false;
                pWelcome.Visible = false;
            }
            else
            {
                liTambahKos.Visible = true;
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