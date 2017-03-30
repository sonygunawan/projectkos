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
    public class DefaultImageDA
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public DefaultImageDA()
        {
            db = dbConnection.CreateDatabase();
        }
        public bool UpdateDefaultPhotoByFormID(Int64 Id, string FilePath)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateDefaultPhotoByFormID");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Id);
                db.AddInParameter(dbCommand, "FilePath", DbType.String, FilePath);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public DefaultImageData GetDefaultPhotoByFormID(Int64 Id)
        {
            try
            {
                DefaultImageData data = new DefaultImageData();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetKosDefaultPhotoByFormID");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Id);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        //retVal = true;
                        data.FormKosID = Convert.ToInt64(dataReader["ID"].ToString());
                        data.FilePath = dataReader["FilePath"].ToString();
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
    }
}
