﻿using System;
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
        //https://www.aspsnippets.com/Articles/Send-user-Confirmation-email-after-Registration-with-Activation-Link-in-ASPNet.aspx
        private void SendActivationEmail(int userId)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string activationCode = Guid.NewGuid().ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO UserActivation VALUES(@UserId, @ActivationCode)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            using (MailMessage mm = new MailMessage("sender@gmail.com", txtEmail.Text))
            {
                mm.Subject = "Account Activation";
                string body = "Hello " + txtUsername.Text.Trim() + ",";
                body += "<br /><br />Please click the following link to activate your account";
                body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("CS.aspx", "CS_Activation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
                body += "<br /><br />Thanks";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("sender@gmail.com", "<password>");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtPasswordConfirm.Text)
            {
                ValidationError.Display("Password not match!");
            }
            else
            {

                bool retVal = new UserSystem().DoRegister(txtName.Text.Trim(), txtEmail.Text.Trim(), txtPassword.Text.Trim());
                if (retVal == true)
                {
                    pnlSuccess.Visible = true;
                    Response.AddHeader("REFRESH", "2;URL=/");
                    //Response.Redirect("/");
                }
                else
                    ValidationError.Display("Invalid Data");
            }
        }
    }
}