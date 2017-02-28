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
    public class FasilitasDA
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();

        public FasilitasDA()
        {
            db = dbConnection.CreateDatabase();
        }
        public List<FasilitasData> GetAllFasilitas()
        {
            try
            {
                List<FasilitasData> retVal = new List<FasilitasData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllFasilitas");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        FasilitasData data = new FasilitasData();
                        data.ID = Convert.ToInt32(dataReader["ID"]);
                        data.Kode = Convert.ToString(dataReader["Kode"]);
                        data.NamaFasilitas = Convert.ToString(dataReader["NamaFasilitas"]);
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
