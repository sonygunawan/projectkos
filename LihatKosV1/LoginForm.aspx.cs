using LihatKos.BusinessFacade;
using LihatKos.Web.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["email"] == null || Request.Cookies["email"].Value.ToString().Trim() == "")
                {
                    txtEmail.Text = txtPassword.Text = "";
                }
                else
                {
                    txtEmail.Text = Request.Cookies["email"].Value.ToString().Trim();
                    txtPassword.Text = Request.Cookies["passwrd"].Value.ToString().Trim();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Int64 retVal = new UserSystem().DoSignIn(txtEmail.Text.Trim(), txtPassword.Text.Trim());
            if (retVal != 0)
            {
                Session["UserID"] = retVal;
                if (chkRemember.Checked == true)
                {
                    Response.Cookies["email"].Value = txtEmail.Text;
                    Response.Cookies["passwrd"].Value = txtPassword.Text;
                }
                if (String.IsNullOrEmpty(Request.QueryString["Link"]))
                {
                    Response.Redirect("/");
                }
                else
                {
                    Response.Redirect( Server.HtmlDecode(Request.QueryString["Link"]));
                }
                
            }
            else
                ValidationError.Display("Wrong Username or Password!!");
        }
    }
}