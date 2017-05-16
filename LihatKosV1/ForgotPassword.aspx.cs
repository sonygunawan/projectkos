using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = string.Empty;
            string password = string.Empty;

            var userData = new UserSystem().DoPassword(txtEmail.Text.Trim());

            if (userData.UserName != null)
            {
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "Password has been sent to your email address. <br>Email ada kemungkinan berada di-SPAM Folder";
            }
            else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "This email address does not match our records.";
            }
        }
    }
}