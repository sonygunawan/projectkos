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
    public class FavoriteDA
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public FavoriteDA()
        {
            db = dbConnection.CreateDatabase();
        }
        public bool InsertFormKosFavorit(Int64 Id, Int64 UserId)
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
        public bool DeleteFormKosFavorit(Int64 Id, Int64 UserId)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DeleteFormKosFavorit");
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
        public bool GetFormKosFavorit(Int64 Id, Int64 UserId)
        {
            try
            {
                bool retVal = false;
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetFormKosFavorit");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Id);
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, UserId);
                
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        retVal = true;
                    }
                    dataReader.Close();
                }
                return retVal;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }

        public List<FormKosData> GetMyFavoriteForm(Int64 UserID)
        {
            try
            {
                List<FormKosData> formKos = new List<FormKosData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetMyFavoriteForm");
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, UserID);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        FormKosData Data = new FormKosData();

                        Data.ID = Convert.ToInt64(dataReader["ID"].ToString());
                        Data.Nama = dataReader["Nama"].ToString();
                        Data.Alamat = dataReader["Alamat"].ToString();
                        Data.Harga = Convert.ToDecimal(dataReader["Harga"].ToString());
                        Data.SatuanHarga = dataReader["SatuanHarga"].ToString();

                        formKos.Add(Data);
                    }
                    dataReader.Close();
                }
                return formKos;
            }
            catch (Exception ex)
            {
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
    }
}
