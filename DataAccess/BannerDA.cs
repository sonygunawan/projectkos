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
    public class BannerDA
    {

        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public BannerDA()
        {
            db = dbConnection.CreateDatabase();
        }

        public List<string> GetAllBanner()
        {
            try
            {
                List<string> retVal = new List<string>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllBanner");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    string data = "";
                    while (dataReader.Read())
                    {
                        data = Convert.ToString(dataReader["FilePath"]);
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

        public List<string> GetAllBanner()
        {
            try
            {
                List<string> retVal = new List<string>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllBanner");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    string data = "";
                    while (dataReader.Read())
                    {
                        data = Convert.ToString(dataReader["FilePath"]);
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
