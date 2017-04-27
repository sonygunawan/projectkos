using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Text;

namespace LihatKos.DataAccess.Helper
{
    public class MailHelper
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();

        private String SMTPServer;
        private int Port = 25;

        #region SendEmail

        public MailHelper()
        {
            try
            {
                db = dbConnection.CreateDatabase();
                try
                {
                    SMTPServer = "lihatkos.com"; //"smtp.binus.ac.id";
                }
                catch
                {
                    SMTPServer = "lihatkos.com";
                }
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public void SendEmail(string email, string subject, string message)
        {
            MailMessage mail = new MailMessage("noreply@lihatkos.com", email);
            SmtpClient client = new SmtpClient();
            //client.Port = 25;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.UseDefaultCredentials = false;
            //client.Host = "113.20.31.137";
            mail.Subject = subject;
            mail.IsBodyHtml = true;
            mail.Body = message;
            client.Send(mail);
        }
        public void SendEmailActivation(Int64 UserID, string Email, string UserName)
        {
            try
            {
                string activationCode = Guid.NewGuid().ToString();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertUserActivation");
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, UserID);
                db.AddInParameter(dbCommand, "ActivationCode", DbType.String, activationCode);

                db.ExecuteNonQuery(dbCommand);

                string body = "Hello " + UserName.Trim() + ",";
                string url = "http://localhost:10981/EmailConfirmation?Code=" + activationCode;
                body += "<br /><br />Please click the following link to activate your account";
                body += "<br /><a href = '" + url + "'>Click here to activate your account.</a>";
                body += "<br /><br />Thanks";
                SendEmail(Email, "Account Activation LihatKos.com", body);
                //using (MailMessage mm = new MailMessage("AutoEmail@LihatKos.com", Email))
                //{
                //    mm.Subject = "Account Activation LihatKos.com";
                //    string body = "Hello " + UserName.Trim() + ",";
                //    string url = "http://demo.lihatkos.com/CS_Activation.aspx?ActivationCode=";
                //    body += "<br /><br />Please click the following link to activate your account";
                //    body += "<br /><a href = '" + url + activationCode + "'>Click here to activate your account.</a>";
                //    body += "<br /><br />Thanks";
                //    mm.Body = body;
                //    mm.IsBodyHtml = true;
                //    SmtpClient smtp = new SmtpClient();
                //    smtp.Host = "smtp.binus.ac.id";
                //    smtp.EnableSsl = true;
                //    NetworkCredential NetworkCred = new NetworkCredential("AutoEmail@LihatKos.com", "<password>");
                //    smtp.UseDefaultCredentials = true;
                //    smtp.Credentials = NetworkCred;
                //    smtp.Port = 587;
                //    smtp.Send(mm);
                //}
                
            }
            catch (Exception ex)
            {

                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }

        }

        public void SendEmailFormKosAktif(long Id, int StatusAktif)
        {
            try
            {
                var formKos = new FormKosDA().GetAllFormKos(Id, "")[0];
                var user = new UserDA().GetUsers(formKos.UserID)[0];
                string body = "Hello " + user.UserName.Trim() + ",";
                var statusBackground = StatusAktif == 1 ? "<p style='background-color:green;'>Re-activate</p>" : "<p style='background-color:red;'>Deactivated</p>";
                var statusSubject = StatusAktif == 1 ? "Re-activated" : "Deactivated";
                body += "<br /><br />Your Data Kos has been " + statusBackground;
                body += "<br />Please follow this link: <a href='\\DetailKos?ID=" + formKos.ID + "' />" +  formKos.Nama + "(lokasi: " + formKos.Alamat + ")</a>";
                body += "<br /><br />Thanks";
                
                SendEmail(user.Email, "LihatKos.com: Data Kos has been " + statusSubject, body);
            }
            catch (Exception ex)
            {
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
#endregion 

        public string DeleteUserActivation(Guid ActivationCode)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DeleteUserActivation");
                db.AddInParameter(dbCommand, "ActivationCode", DbType.Guid, ActivationCode);

                string message = "";
                int rowsAffected = db.ExecuteNonQuery(dbCommand);
                if (rowsAffected == 1)
                {
                    message = "Activation successful.";
                }
                else
                {
                    message = "Invalid Activation code.";
                }
                return message;
            }
            catch (Exception ex)
            {

                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }

        }

    }
}
