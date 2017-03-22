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
            if (!Page.IsPostBack)
            {
                chkRemember.Checked = true;
            }
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
            LoadPage();
        }
        private void LoadPage ()
        {
         
            if (Request.Cookies["email"] == null || Request.Cookies["email"].Value.ToString().Trim() == "")
            {
                //txtEmail.Text = txtPassword.Text = "";
            }
            else
            {
                txtEmail.Text = Request.Cookies["email"].Value.ToString().Trim();
                txtPassword.Attributes["value"] = Request.Cookies["passwrd"].Value.ToString().Trim();
                //txtPassword.Text = Request.Cookies["passwrd"].Value.ToString().Trim();
            }
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
                pWelcome.Visible = true;
                var user = new UserSystem().GetUsers(Convert.ToInt64(Session["UserID"]))[0];
                if (user.TipeUserID == 1 || user.TipeUserID == 2)
                    liAdmin.Visible = true;
                else
                    liAdmin.Visible = false;

                litUsername.Text = user.UserName;

                MPELogin.Hide();
            }
        }
        protected void btnLoginShort_Click(object sender, EventArgs e)
        {
            var retVal = new UserSystem().DoSignIn(txtEmail.Text.Trim(), txtPassword.Text.Trim());
            if (retVal.ID != 0)
            {
                if (retVal.IsActive != 0)
                {
                    Session["UserID"] = retVal.ID;
                    if (chkRemember.Checked == true)
                    {
                        Response.Cookies["email"].Value = txtEmail.Text;
                        Response.Cookies["passwrd"].Value = txtPassword.Text;
                    }
                    LoadPage();
                    MPELogin.Hide();
                }
                else
                    lblLoginErrorMsg.Text = "Email belum terverifikasi.";
                //if (String.IsNullOrEmpty(Request.QueryString["Link"]))
                //{
                //    Response.Redirect("/");
                //}
                //else
                //{
                //    Response.Redirect( Server.HtmlDecode(Request.QueryString["Link"]));
                //}

            }
            else
            {
                lblLoginErrorMsg.Text = "Wrong Username or Password!!";
                //MPELogin.Show();
            }
        
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPasswordRegister.Text != txtPasswordConfirm.Text)
            {
                lblRegisterErrorMsg.Text = "Password not match";
            }
            else
            {

                string retVal = new UserSystem().DoRegister(txtName.Text.Trim(), txtEmail.Text.Trim(), txtPassword.Text.Trim());
                if (retVal == "")
                {
                    lblRegisterSuccessMsg.Text = "Register Success. Activation email has been sent.";
                    Response.AddHeader("REFRESH", "2;URL=/");
                }
                else
                {
                    lblRegisterErrorMsg.Text = retVal;
                    //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + retVal + "');", true);
                    //ValidationError.Display(retVal);
                }
            }
        }

        //protected void lbtnLogin_Click(object sender, EventArgs e)
        //{
        //    MPELogin.Show();
        //}
    }
}