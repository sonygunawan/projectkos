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

        public bool InsertContactUs(Int64 Id, Int64 UserId)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertFormKosFavorit");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Id);
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, UserId);

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
