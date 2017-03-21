using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace LihatKos.DataAccess.Helper
{
    public class MailHelper
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();

        private String SMTPServer;
        private int Port = 25;
        public MailHelper()
        {
            try
            {
                db = dbConnection.CreateDatabase();
                try
                {
                    SMTPServer = "smtp.binus.ac.id";
                }
                catch
                {
                    SMTPServer = "smtp.binus.ac.id";
                }
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public void SendEmail(string email, string subject, string message)
        {
            MailMessage mail = new MailMessage("noreply@psinformatika.com", email);
            SmtpClient client = new SmtpClient();
            //client.Port = 25;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.UseDefaultCredentials = false;
            //client.Host = "113.20.31.137";
            mail.Subject = subject;
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
                string url = "http://demo.lihatkos.com/CS_Activation.aspx?ActivationCode=";
                body += "<br /><br />Please click the following link to activate your account";
                body += "<br /><a href = '" + url + activationCode + "'>Click here to activate your account.</a>";
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
                
                throw;
            }

        }
    }
}
