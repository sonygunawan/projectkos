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
            //if (!Page.IsPostBack)
            //{
            //    if (Request.Cookies["email"] == null || Request.Cookies["email"].Value.ToString().Trim() == "")
            //    {
            //        //txtEmail.Text = txtPassword.Text = "";
            //    }
            //    else
            //    {
            //        Int64 retVal = new UserSystem().DoSignIn(Request.Cookies["email"].Value.ToString().Trim()
            //            , Request.Cookies["passwrd"].Value.ToString().Trim());
            //        if (retVal != 0)
            //        {
            //            Session["UserID"] = retVal;
            //        }
            //    }
            //}
            if (Session["UserID"] == null)
            {
                liTambahKos.Visible = false;
                //liLogin.Visible = true;
                //liRegister.Visible = true;
                pWelcome.Visible = false;
                liAdmin.Visible = false;

                MPELogin.Show();
            }
            else
            {
                liTambahKos.Visible = true;
                //liLogin.Visible = false;
                //liRegister.Visible = false;
                pWelcome.Visible = true;
                var user = new UserSystem().GetUsers(Convert.ToInt64(Session["UserID"]))[0];
                if (user.TipeUserID == 1 || user.TipeUserID == 2)
                    liAdmin.Visible = true;
                else
                    liAdmin.Visible = false;

                litUsername.Text = user.UserName;

            }
        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            MPELogin.Show();
        }
    }
}