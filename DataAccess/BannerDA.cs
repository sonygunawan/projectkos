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
    public class BannerDA
    {

        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public BannerDA()
        {
            db = dbConnection.CreateDatabase();
        }
        public string GetMaxBanner()
        {
            try
            {
                string MaxCode = "";
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetMaxBanner");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        MaxCode = Convert.ToString(dataReader["Kode"]);
                    }
                    dataReader.Close();
                }
                return MaxCode;
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
        //Modified by sony, 3 Apr 2017, TODO: Web & BusinessSystem
        public List<BannerData> GetListBanner()
        {
            try
            {
                List<BannerData> retVal = new List<BannerData>();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllBanner");
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        var data = new BannerData();
                        data.ID = Convert.ToInt32(dataReader["ID"]);
                        data.Kode = Convert.ToString(dataReader["Kode"]);
                        data.Nama = Convert.ToString(dataReader["Nama"]);
                        data.FilePath = Convert.ToString(dataReader["FilePath"]);
                        data.Url = Convert.ToString(dataReader["Url"]);
                        data.Prioritas = Convert.ToInt32(dataReader["Prioritas"]);
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
        public BannerData GetBanner(int ID)
        {
            try
            {
                var data = new BannerData();

                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllBanner");
                db.AddInParameter(dbCommand, "ID", DbType.Int32, ID);
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        data.ID = Convert.ToInt32(dataReader["ID"]);
                        data.Kode = Convert.ToString(dataReader["Kode"]);
                        data.Nama = Convert.ToString(dataReader["Nama"]);
                        data.FilePath = Convert.ToString(dataReader["FilePath"]);
                        data.Url = Convert.ToString(dataReader["Url"]);
                        data.Prioritas = Convert.ToInt32(dataReader["Prioritas"]);
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
        public bool UpdateBanner(BannerData data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateBannerByID");
                db.AddInParameter(dbCommand, "ID", DbType.Int32, data.ID);
                db.AddInParameter(dbCommand, "Kode", DbType.String, data.Kode);
                db.AddInParameter(dbCommand, "Nama", DbType.String, data.Nama);
                db.AddInParameter(dbCommand, "FilePath", DbType.String, data.FilePath);
                db.AddInParameter(dbCommand, "Url", DbType.String, data.Url);
                db.AddInParameter(dbCommand, "Prioritas", DbType.Int32, data.Prioritas);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }

        public bool DeleteBanner(int ID)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DeleteBannerByID");
                db.AddInParameter(dbCommand, "ID", DbType.Int32, ID);
                
                db.ExecuteNonQuery(dbCommand);
                return true;

            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
    }
}
