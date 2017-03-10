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
    public class FormKosDA
    {
        private Database db;
        DataAccessConnection dbConnection = new DataAccessConnection();
        public FormKosDA()
        {
            db = dbConnection.CreateDatabase();
        }
        //string Kode, string Nama, string Deskripsi, string Alamat, int AreaID, float Altitude, float Longitude,
        //    Int64 ImageID, string NamaPemilik, string AlamatPemilik, string KontakPemilik, string NamaPengelola, string AlamatPengelola,
        //    string KontakPengelola, int MinimumBayarMonth, string MinimumBayarDesc, int JmlKamar, float LuasKamar, int TipeKosID,
        //    int JmlKamarKosong, bool PetID, int FormKosFasilitasID, int FormKosLingkunganID, string Keterangan, Int64 UserID
        public Int64 InsertFormKos (FormKosData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertFormKos");
                db.AddInParameter(dbCommand, "Kode", DbType.String, Data.Kode);
                db.AddInParameter(dbCommand, "Nama", DbType.String, Data.Nama);
                db.AddInParameter(dbCommand, "Deskripsi", DbType.String, Data.Deskripsi);
                db.AddInParameter(dbCommand, "Alamat", DbType.String, Data.Alamat);
                db.AddInParameter(dbCommand, "AreaID", DbType.Int32, Data.AreaID);
                db.AddInParameter(dbCommand, "Altitude", DbType.Decimal, Data.Latitude);
                db.AddInParameter(dbCommand, "Longitude", DbType.Decimal, Data.Longitude);
                db.AddInParameter(dbCommand, "ImageID", DbType.Int64, Data.ImageID);
                db.AddInParameter(dbCommand, "NamaPemilik", DbType.String, Data.NamaPemilik);
                db.AddInParameter(dbCommand, "AlamatPemilik", DbType.String, Data.AlamatPemilik);
                db.AddInParameter(dbCommand, "KontakPemilik", DbType.String, Data.KontakPemilik);
                db.AddInParameter(dbCommand, "NamaPengelola", DbType.String, Data.NamaPengelola);
                db.AddInParameter(dbCommand, "AlamatPengelola", DbType.String, Data.AlamatPengelola);
                db.AddInParameter(dbCommand, "KontakPengelola", DbType.String, Data.KontakPengelola);
                db.AddInParameter(dbCommand, "MinimumBayarMonth", DbType.Int32, Data.MinimumBayarMonth);
                //@MinimumBayarDesc
                db.AddInParameter(dbCommand, "MinimumBayarDesc", DbType.String, Data.MinimumBayarDesc);
                db.AddInParameter(dbCommand, "JmlKamar", DbType.Int32, Data.JmlKamar);
                db.AddInParameter(dbCommand, "LuasKamar", DbType.Double, Data.LuasKamar);
                db.AddInParameter(dbCommand, "TipeKosID", DbType.Int32, Data.TipeKosID);
                db.AddInParameter(dbCommand, "JmlKamarKosong", DbType.Int32, Data.JmlKamarKosong);
                db.AddInParameter(dbCommand, "PetID", DbType.Boolean, Data.PetID);
                //db.AddInParameter(dbCommand, "FormKosFasilitasID", DbType.Int32, Data.FormKosFasilitasID);
                //db.AddInParameter(dbCommand, "FormKosLingkunganID", DbType.Int32, Data.FormKosLingkunganID);
                db.AddInParameter(dbCommand, "Keterangan", DbType.String, Data.Keterangan);
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, Data.UserID);
                //db.ExecuteNonQuery(dbCommand);
                db.AddParameter(dbCommand, "RETURN_VALUE", DbType.Int64, ParameterDirection.ReturnValue, null, DataRowVersion.Default, null);
                db.ExecuteNonQuery(dbCommand);

                string FormID = "";
                if (Convert.ToInt64(db.GetParameterValue(dbCommand, "RETURN_VALUE")) >= 0)
                {
                    FormID = db.GetParameterValue(dbCommand, "RETURN_VALUE").ToString();
                }
                else
                { return 0; }

                //using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                //{

                //    dataReader.Close();

                //}
                return Convert.ToInt64(FormID);
            }
            catch (Exception ex)
            {
                return 0;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public string GetMaxFormKos()
        {
            try
            {
                string MaxCode = "";
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetMaxFormKos");
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
        public List<KosHargaData> GetKosHargaByFormID (Int64 Id)
        {
            try
            {
                List<KosHargaData> formKos = new List<KosHargaData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetKosHargaByFormID");
                db.AddInParameter(dbCommand, "FormID", DbType.Int64, Id);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        KosHargaData Data = new KosHargaData();
                        Data.FormKosID = Convert.ToInt64(dataReader["FormKosID"].ToString());
                        Data.SatuanHargaID = Convert.ToInt32(dataReader["SatuanHargaID"].ToString());
                        Data.Harga = Convert.ToDecimal(dataReader["Harga"].ToString()); ;
                        Data.Deskripsi = dataReader["Deskripsi"].ToString(); ;

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
        public List<KosFasilitasData> GetKosFasilitasByFormID(Int64 Id)
        {
            try
            {
                List<KosFasilitasData> formKos = new List<KosFasilitasData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetKosFasilitasOnlyByFormID");
                db.AddInParameter(dbCommand, "FormID", DbType.Int64, Id);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        KosFasilitasData Data = new KosFasilitasData();
                        Data.FormKosID = Convert.ToInt64(dataReader["FormKosID"].ToString());
                        Data.FormKosFasilitasID = Convert.ToInt32(dataReader["FormKosFasilitasID"].ToString());
                        Data.NamaFasilitas = dataReader["NamaFasilitas"].ToString();
                        Data.Status = Convert.ToInt32(dataReader["Status"].ToString());

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
        public List<KosLingkunganData> GetKosLingkunganByFormID(Int64 Id)
        {
            try
            {
                List<KosLingkunganData> formKos = new List<KosLingkunganData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetKosLingkunganOnlyByFormID");
                db.AddInParameter(dbCommand, "FormID", DbType.Int64, Id);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        KosLingkunganData Data = new KosLingkunganData();
                        Data.FormKosID = Convert.ToInt64(dataReader["FormKosID"].ToString());
                        Data.FormKosLingkunganID = Convert.ToInt32(dataReader["FormKosLingkunganID"].ToString());
                        Data.NamaLingkungan = dataReader["NamaLingkungan"].ToString();
                        Data.Status = Convert.ToInt32(dataReader["Status"].ToString());

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
        

        public bool InsertKosHarga(KosHargaData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertFormKosHarga");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Data.FormKosID);
                db.AddInParameter(dbCommand, "SatuanHargaID", DbType.Int32, Data.SatuanHargaID);
                db.AddInParameter(dbCommand, "Harga", DbType.Decimal, Data.Harga);
                db.AddInParameter(dbCommand, "Deskripsi", DbType.String, Data.Deskripsi);
                db.ExecuteNonQuery(dbCommand);
                
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public bool InsertKosFasilitas(KosFasilitasData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertFormKosFasilitas");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Data.FormKosID);
                db.AddInParameter(dbCommand, "FormKosFasilitasID", DbType.Int32, Data.FormKosFasilitasID);
                db.AddInParameter(dbCommand, "Status", DbType.Decimal, Data.Status);
                db.ExecuteNonQuery(dbCommand);

                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public bool InsertKosLingkungan(KosLingkunganData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertFormKosLingkungan");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Data.FormKosID);
                db.AddInParameter(dbCommand, "FormKosLingkunganID", DbType.Int32, Data.FormKosLingkunganID);
                db.AddInParameter(dbCommand, "Status", DbType.Decimal, Data.Status);
                db.ExecuteNonQuery(dbCommand);

                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public Int64 InsertFormKosLengkap(FormKosData Data)
        {
            bool retVal = true;
            Int64 retFormID = 0;
            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                DbTransaction transaction = connection.BeginTransaction();

                try
                {
                    Int64 FormID = InsertFormKos(Data);
                    //set return
                    retFormID = FormID;
                    foreach (KosHargaData detail in Data.KosHarga)
                    {
                        detail.FormKosID = FormID;

                        retVal = InsertKosHarga(detail);

                        if (retVal == false)
                            throw new DataAccessException("error InsertKosHarga. ");
                    }
                    
                    foreach (KosFasilitasData detail in Data.KosFasilitas)
                    {
                        detail.FormKosID = FormID;
                        retVal = InsertKosFasilitas(detail);

                        if (retVal == false)
                            throw new DataAccessException("error InsertKosFasilitas. ");
                    }

                    foreach (KosLingkunganData detail in Data.KosLingkungan)
                    {
                        detail.FormKosID = FormID;
                        //todo:
                        retVal = InsertKosLingkungan(detail);

                        if (retVal == false)
                            throw new DataAccessException("error InsertKosLingkungan. ");
                    }
                }
                catch 
                {
                    retVal = false;
                }
                
            
                if (retVal)
                    transaction.Commit();
                else
                    transaction.Rollback();
                connection.Close();
            }
            return retFormID;
            
            
        }

        public List<FormKosData> GetAllFormKos(Int64 Id)
        {
            try
            {
                List<FormKosData> formKos = new List<FormKosData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllFormKos");
                db.AddInParameter(dbCommand, "ID", DbType.Int64, Id);
                
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        FormKosData Data = new FormKosData();
                        Data.ID = Convert.ToInt64(dataReader["ID"].ToString());
                        Data.Nama = dataReader["Nama"].ToString();
                        Data.Deskripsi = dataReader["Deskripsi"].ToString();
                        Data.Alamat = dataReader["Alamat"].ToString();
                        Data.AreaID = Convert.ToInt32(dataReader["AreaID"].ToString());
                        Data.NamaArea = dataReader["NamaArea"].ToString();
                        Data.Latitude = (decimal) Convert.ToDecimal(dataReader["Altitude"].ToString());
                        Data.Longitude = (decimal)Convert.ToDecimal(dataReader["Longitude"].ToString());
                        Data.NamaPemilik = dataReader["NamaPemilik"].ToString();
                        Data.AlamatPemilik = dataReader["AlamatPemilik"].ToString();
                        Data.KontakPemilik = dataReader["KontakPemilik"].ToString();
                        Data.NamaPengelola = dataReader["NamaPengelola"].ToString();
                        Data.KontakPengelola = dataReader["KontakPengelola"].ToString();
                        Data.MinimumBayarMonth = Convert.ToInt32(dataReader["MinimumBayarMonth"].ToString());
                        Data.MinimumBayarDesc = dataReader["MinimumBayarDesc"].ToString();
                        Data.JmlKamar = Convert.ToInt32(dataReader["JmlKamar"].ToString());
                        Data.JmlKamarKosong = Convert.ToInt32(dataReader["JmlKamarKosong"].ToString());
                        Data.LuasKamar = (float)Convert.ToDouble(dataReader["Luaskamar"].ToString());
                        Data.TipeKosID = Convert.ToInt32(dataReader["TipeKosID"].ToString());
                        Data.NamaTipeKos = dataReader["NamaTipeKos"].ToString();
                        Data.PetID = Convert.ToBoolean(dataReader["PetID"].ToString());
                        Data.Keterangan = dataReader["Keterangan"].ToString();
                        Data.Harga = Convert.ToDecimal(dataReader["Harga"].ToString());
                        Data.SatuanHarga = dataReader["SatuanHarga"].ToString();
                        Data.UserID = Convert.ToInt64(dataReader["UserID"].ToString());
                        Data.UserName = dataReader["UserName"].ToString();
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

        public List<FormKosData> GetAllFormKosPaging(Int64 Id, int pageNumber, int pageSize)
        {
            try
            {
                List<FormKosData> formKos = new List<FormKosData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllFormKos");
                db.AddInParameter(dbCommand, "ID", DbType.Int64, Id);
                db.AddInParameter(dbCommand, "PageNumber", DbType.Int32, pageNumber);
                db.AddInParameter(dbCommand, "PageSize", DbType.Int32, pageSize);
                db.AddOutParameter(dbCommand, "TotalPage", DbType.Int32, 10);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        FormKosData Data = new FormKosData();
                        Data.ID = Convert.ToInt64(dataReader["ID"].ToString());
                        Data.Nama = dataReader["Nama"].ToString();
                        Data.Deskripsi = dataReader["Deskripsi"].ToString();
                        Data.Alamat = dataReader["Alamat"].ToString();
                        Data.AreaID = Convert.ToInt32(dataReader["AreaID"].ToString());
                        Data.NamaArea = dataReader["NamaArea"].ToString();
                        Data.Latitude = (decimal)Convert.ToDecimal(dataReader["Altitude"].ToString());
                        Data.Longitude = (decimal)Convert.ToDecimal(dataReader["Longitude"].ToString());
                        Data.NamaPemilik = dataReader["NamaPemilik"].ToString();
                        Data.AlamatPemilik = dataReader["AlamatPemilik"].ToString();
                        Data.KontakPemilik = dataReader["KontakPemilik"].ToString();
                        Data.NamaPengelola = dataReader["NamaPengelola"].ToString();
                        Data.KontakPengelola = dataReader["KontakPengelola"].ToString();
                        Data.MinimumBayarMonth = Convert.ToInt32(dataReader["MinimumBayarMonth"].ToString());
                        Data.MinimumBayarDesc = dataReader["MinimumBayarDesc"].ToString();
                        Data.JmlKamar = Convert.ToInt32(dataReader["JmlKamar"].ToString());
                        Data.JmlKamarKosong = Convert.ToInt32(dataReader["JmlKamarKosong"].ToString());
                        Data.LuasKamar = (float)Convert.ToDouble(dataReader["Luaskamar"].ToString());
                        Data.TipeKosID = Convert.ToInt32(dataReader["TipeKosID"].ToString());
                        Data.PetID = Convert.ToBoolean(dataReader["PetID"].ToString());
                        Data.Keterangan = dataReader["Keterangan"].ToString();
                        Data.Harga = Convert.ToDecimal(dataReader["Harga"].ToString());
                        Data.SatuanHarga = dataReader["SatuanHarga"].ToString();
                        Data.UserID = Convert.ToInt64(dataReader["UserID"].ToString());
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

        public List<FormKosData> GetAllFormKosByLocation(string DataLatitude, string DataLongitude, int TipeKosID, int SatuanHargaID, string Fasilitas)
        {
            try
            {
                List<FormKosData> formKos = new List<FormKosData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllFormKosByLocation");
                db.AddInParameter(dbCommand, "Latitude", DbType.Decimal, Convert.ToDecimal(DataLatitude.Replace('.', ',')));
                db.AddInParameter(dbCommand, "Longitude", DbType.Decimal, Convert.ToDecimal(DataLongitude.Replace('.', ',')));
                db.AddInParameter(dbCommand, "TipeKosId", DbType.Int32, TipeKosID);
                db.AddInParameter(dbCommand, "SatuanHargaId", DbType.Int32, SatuanHargaID);
                db.AddInParameter(dbCommand, "Fasilitas", DbType.String, Fasilitas);

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

        public bool UpdateFormKosView(Int64 Id)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateFormKosView");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Id);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }

        public List<FormKosData> GetHighestFormKosByArea(int AreaID)
        {
            try
            {
                List<FormKosData> retVal = new List<FormKosData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetHighestFormKosByArea");
                db.AddInParameter(dbCommand, "AreaID", DbType.Int64, AreaID);


                DataSet ds = db.ExecuteDataSet(dbCommand);
                DataTable dtLatest = ds.Tables[0];
                DataTable dtFav = ds.Tables[1];
                DataTable dtSeen = ds.Tables[2];
                int countx = ds.Tables.Count;
                for (int x = 0; x < countx; x++)
                {
                    foreach (DataRow dr in ds.Tables[x].Rows)
                    {
                        var DataKos = new FormKosData();
                        DataKos.Keterangan = dr["ScoreH"].ToString();
                        DataKos.ID = Convert.ToInt64(dr["ID"].ToString());
                        DataKos.Nama = dr["Nama"].ToString();
                        DataKos.Alamat = dr["Alamat"].ToString();
                        DataKos.Harga = Convert.ToDecimal(dr["Harga"].ToString());
                        DataKos.SatuanHarga = dr["SatuanHarga"].ToString();
                        retVal.Add(DataKos);
                    }
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
