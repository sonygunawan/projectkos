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


        public UserData DoSignIn(string Email, string Password)
        {
            try
            {
                //Int64 retVal = 0;
                var retVal = new UserData();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DoSignIn");
                db.AddInParameter(dbCommand, "Email", DbType.String, Email);
                db.AddInParameter(dbCommand, "Password", DbType.String, Password);
                
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {

                    while (dataReader.Read())
                    {
                        retVal.ID = Convert.ToInt64(dataReader["ID"]);
                        retVal.IsActive = Convert.ToInt32(dataReader["IsActive"]);
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
                        data.IsActive = Convert.ToInt32(dataReader["Aktif"]);
                        data.LastActivityDate = Convert.ToDateTime(dataReader["LastActivityDate"].ToString());
                        data.LastChangeAktifDate = Convert.ToDateTime(dataReader["LastChangeAktifDate"].ToString());
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
        public bool UpdateUser(UserData user)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateUser");
                db.AddInParameter(dbCommand, "ID", DbType.Int64, user.ID);
                db.AddInParameter(dbCommand, "UserName", DbType.String, user.UserName);
                db.AddInParameter(dbCommand, "LastActivityDate", DbType.DateTime, user.LastActivityDate);
                db.AddInParameter(dbCommand, "Email", DbType.String, user.Email);
                db.AddInParameter(dbCommand, "TipeUser", DbType.Int32, user.TipeUserID);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public bool UpdateUserAktif(UserData user)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateUserAktif");
                db.AddInParameter(dbCommand, "ID", DbType.Int64, user.ID);
                db.AddInParameter(dbCommand, "Aktif", DbType.Int32, user.IsActive);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }


        #region TipeUser
        public List<TipeUserData> GetAllTipeUser()
        {
            try
            {
                List<TipeUserData> retVal = new List<TipeUserData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllTipeUser");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        TipeUserData data = new TipeUserData();
                        data.ID = Convert.ToInt32(dataReader["ID"]);
                        data.Kode = Convert.ToString(dataReader["Kode"]);
                        data.Nama = Convert.ToString(dataReader["Nama"]);
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

        #endregion

    }
}
