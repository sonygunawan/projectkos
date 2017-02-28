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
    public class TipeKosDA
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public TipeKosDA()
        {
            db = dbConnection.CreateDatabase();
        }

        public List<TipeKosData> GetAllTipeKos()
        {
            try
            {
                List<TipeKosData> retVal = new List<TipeKosData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllTipeKos");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        TipeKosData data = new TipeKosData();
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
