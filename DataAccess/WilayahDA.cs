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
    public class WilayahDA
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public WilayahDA()
        {
            db = dbConnection.CreateDatabase();
        }
        public List<WilayahData> GetAllPropinsi()
        {
            try
            {
                List<WilayahData> retVal = new List<WilayahData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllProvinsi");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        WilayahData data = new WilayahData();
                        data.IDProvinsi = Convert.ToInt32(dataReader["IDProvinsi"]);
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
        public List<WilayahData> GetAllKabupaten(int IDProvinsi)
        {
            try
            {
                List<WilayahData> retVal = new List<WilayahData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllKabupaten");
                db.AddInParameter(dbCommand, "IDProvinsi", DbType.Int32, IDProvinsi);
                
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        WilayahData data = new WilayahData();
                        data.IDKabupaten = Convert.ToInt32(dataReader["IDKabupaten"]);
                        data.Nama = Convert.ToString(dataReader["Nama"]);
                        data.IDProvinsi = Convert.ToInt32(dataReader["IDProvinsi"]);
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
        public List<WilayahData> GetAllKecamatan(int IDKabupaten)
        {
            try
            {
                List<WilayahData> retVal = new List<WilayahData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllKecamatan");
                db.AddInParameter(dbCommand, "IDKabupaten", DbType.Int32, IDKabupaten);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        WilayahData data = new WilayahData();
                        data.IDKecamatan = Convert.ToInt32(dataReader["IDKecamatan"]);
                        data.Nama = Convert.ToString(dataReader["Nama"]);
                        data.IDKabupaten = Convert.ToInt32(dataReader["IDKabupaten"]);
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
