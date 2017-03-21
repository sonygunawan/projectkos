using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LihatKos.Web.Controls;
using LihatKos.BusinessFacade;

namespace LihatKosV1
{
    public partial class RegisterForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtPasswordConfirm.Text)
            {
                ValidationError.Display("Password not match!");
            }
            else
            {

                string retVal = new UserSystem().DoRegister(txtName.Text.Trim(), txtEmail.Text.Trim(), txtPassword.Text.Trim());
                if (retVal == "")
                {
                    pnlSuccess.Visible = true;
                    Response.AddHeader("REFRESH", "2;URL=/");

                    //Response.Redirect("/");
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + retVal + "');", true);
                    ValidationError.Display(retVal);
                }
            }
        }

    }
}