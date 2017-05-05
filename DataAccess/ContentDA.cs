using LihatKos.Common;
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
    public class ContentDA
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public ContentDA()
        {
            db = dbConnection.CreateDatabase();
        }

        public ContentData getPageContent(int Id)
        {
            try
            {
                ContentData data = new ContentData();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetPageContent");
                db.AddInParameter(dbCommand, "ID", DbType.Int32, Id);
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        data.ID = Convert.ToInt32(dataReader["ID"]);
                        data.PageTitle = Convert.ToString(dataReader["PageTitle"]);
                        data.PageContent = Convert.ToString(dataReader["PageContent"]);
                    }
                    dataReader.Close();
                }
                return data;
            }
            catch (Exception ex)
            {
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public bool UpdatePageContent(ContentData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdatePageContent");
                db.AddInParameter(dbCommand, "ID", DbType.Int64, Data.ID);
                db.AddInParameter(dbCommand, "Content", DbType.String, Data.PageContent);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        #region Contact

        public List<ContentData> GetAllSubjectContact()
        {
            try
            {
                List<ContentData> retVal = new List<ContentData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllSubjectContact");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        ContentData data = new ContentData();
                        data.ID = Convert.ToInt32(dataReader["ID"]);
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

        public List<ContactData> GetContactData(long Id = 0)
        {
            try
            {
                List<ContactData> retVal = new List<ContactData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetContactData");
                db.AddInParameter(dbCommand, "ID", DbType.Int32, Id);
                
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        ContactData data = new ContactData();
                        data.ID = Convert.ToInt64(dataReader["ID"]);
                        data.SubjectID = Convert.ToInt32(dataReader["SubjectID"]);
                        data.SubjectContact = dataReader["SubjectContact"].ToString();
                        data.Message = dataReader["Message"].ToString();
                        data.UserID = Convert.ToInt64(dataReader["UserID"]);
                        data.UserName = dataReader["UserName"].ToString();
                        data.Email = dataReader["Email"].ToString();
                        data.Status = Convert.ToInt32(dataReader["Status"]);
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
        public bool InsertContactUs(ContactData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertContactUs");
                db.AddInParameter(dbCommand, "SubjectID", DbType.Int32, Data.SubjectID);
                db.AddInParameter(dbCommand, "Message", DbType.String, Data.Message);
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, Data.UserID);
                db.AddInParameter(dbCommand, "Status", DbType.Int32, Data.Status);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public bool UpdateContactAktif(ContactData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateContactData");
                db.AddInParameter(dbCommand, "ID", DbType.Int64, Data.ID);
                db.AddInParameter(dbCommand, "Status", DbType.Int32, Data.Status);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        #endregion 
    
    }
}
