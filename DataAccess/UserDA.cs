using LihatKos.Common;
using LihatKos.DataAccess.Helper;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;

namespace LihatKos.DataAccess
{
    public class UserDA
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public UserDA()
        {
            db = dbConnection.CreateDatabase();
        }
        
        public string DoRegister(string UserName, string Email, string Password)
        {
            Int64 UserID = 0;
            string message = "";
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DoRegister");
                db.AddInParameter(dbCommand, "UserName", DbType.String,UserName);
                db.AddInParameter(dbCommand, "Email", DbType.String, Email);
                db.AddInParameter(dbCommand, "Password", DbType.String, Password);
                
                UserID = Convert.ToInt64(db.ExecuteScalar(dbCommand));
                switch (UserID)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        break;
                    default:
                        message = "Registration successful. Activation email has been sent.";
                        new MailHelper().SendEmailActivation(UserID, Email, UserName);
                        break;
                }
                
                //db.ExecuteNonQuery(dbCommand);
                //using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                //{
                    
                //    dataReader.Close();
                    
                //}
                return message ;
            }
            catch (Exception ex)
            {
                return "Register Error";
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }


        public Int64 DoSignIn(string Email, string Password)
        {
            try
            {
                Int64 retVal = 0;

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DoSignIn");
                db.AddInParameter(dbCommand, "Email", DbType.String, Email);
                db.AddInParameter(dbCommand, "Password", DbType.String, Password);
                
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {

                    while (dataReader.Read())
                    {
                        retVal = Convert.ToInt64(dataReader["ID"]);
                    }
                    dataReader.Close();
                }

                return retVal;
            }
            catch (Exception ex)
            {

                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public List<UserData> GetUsers(Int64 UserID)
        {
            try
            {
                var retVal = new List<UserData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetUser");
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, UserID);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        var data = new UserData();
                        data.ID = Convert.ToInt64(dataReader["ID"].ToString());
                        data.Email = dataReader["Email"].ToString();
                        data.UserName = dataReader["UserName"].ToString();
                        data.TipeUser = dataReader["TipeUser"].ToString();
                        data.TipeUserID = Convert.ToInt32(dataReader["TipeUserID"].ToString());
                        data.LastActivityDate = Convert.ToDateTime(dataReader["LastActivityDate"].ToString());
                        retVal.Add(data);
                    }
                    dataReader.Close();
                }

                return retVal;
            }
            catch (Exception ex)
            {

                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
    }
}
