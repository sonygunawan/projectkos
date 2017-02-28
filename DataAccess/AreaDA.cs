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
    public class AreaDA
    {

        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public AreaDA()
        {
            db = dbConnection.CreateDatabase();
        }
        public List<AreaData> GetAllArea()
        {
            try
            {
                List<AreaData> retVal = new List<AreaData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllArea");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        AreaData data = new AreaData();
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
    }
}
