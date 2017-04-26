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
                db.AddInParameter(dbCommand, "MinimumBayarDesc", DbType.String, Data.MinimumBayarDesc);
                db.AddInParameter(dbCommand, "JmlKamar", DbType.Int32, Data.JmlKamar);
                db.AddInParameter(dbCommand, "LuasKamar", DbType.Double, Data.LuasKamar);
                db.AddInParameter(dbCommand, "TipeKosID", DbType.Int32, Data.TipeKosID);
                db.AddInParameter(dbCommand, "JmlKamarKosong", DbType.Int32, Data.JmlKamarKosong);
                db.AddInParameter(dbCommand, "PetID", DbType.Boolean, Data.PetID);
                db.AddInParameter(dbCommand, "Keterangan", DbType.String, Data.Keterangan);
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, Data.UserID);
                db.AddInParameter(dbCommand, "NamaProvinsi", DbType.String, Data.NamaProvinsi);
                db.AddInParameter(dbCommand, "NamaKabupaten", DbType.String, Data.NamaKabupaten.ToString().Replace("Kota ", ""));
                db.AddInParameter(dbCommand, "NamaKecamatan", DbType.String, Data.NamaKecamatan);
                db.AddInParameter(dbCommand, "NamaKelurahan", DbType.String, Data.NamaKelurahan);
                db.AddParameter(dbCommand, "RETURN_VALUE", DbType.Int64, ParameterDirection.ReturnValue, null, DataRowVersion.Default, null);
                db.ExecuteNonQuery(dbCommand);

                string FormID = "";
                if (Convert.ToInt64(db.GetParameterValue(dbCommand, "RETURN_VALUE")) >= 0)
                {
                    FormID = db.GetParameterValue(dbCommand, "RETURN_VALUE").ToString();
                }
                else
                { return 0; }

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
                        Data.Harga = Convert.ToDecimal(dataReader["Harga"].ToString());
                        Data.MinimumBayar = Convert.ToInt32(dataReader["MinimumBayar"]);
                        Data.Deskripsi = dataReader["Deskripsi"].ToString(); 

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
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetKosFasilitasByFormID");
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
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetKosLingkunganByFormID");
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
                db.AddInParameter(dbCommand, "MinimumBayar", DbType.Int32, Data.MinimumBayar);
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
        public bool DeleteKosHarga(long FormKosID)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DeleteKosHarga");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, FormKosID);
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
        public bool DeleteKosFasilitas(long FormKosID)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DeleteKosFasilitas");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, FormKosID);
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
        public bool DeleteKosLingkungan(long FormKosID)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DeleteKosLingkungan");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, FormKosID);
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

                    foreach(KosTeleponData detail in Data.KosTelepon)
                    {
                        detail.FormKosID = FormID;
                        retVal = InsertKosTelepon(detail);

                        if (retVal == false)
                            throw new DataAccessException("error InsertKosTelepon. ");
                    }
                    foreach (KosKamarData detail in Data.KosKamar)
                    {
                        detail.FormKosID = FormID;
                        retVal = InsertKosKamar(detail);

                        if (retVal == false)
                            throw new DataAccessException("error InsertKosKamar. ");
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

        public List<FormKosData> GetAllFormKos(Int64 Id, string Search)
        {
            try
            {
                List<FormKosData> formKos = new List<FormKosData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllFormKos");
                db.AddInParameter(dbCommand, "ID", DbType.Int64, Id);
                db.AddInParameter(dbCommand, "Search", DbType.String, Search);
                
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        FormKosData data = new FormKosData();
                        data.ID = Convert.ToInt64(dataReader["ID"].ToString());
                        data.Nama = dataReader["Nama"].ToString();
                        data.Deskripsi = dataReader["Deskripsi"].ToString();
                        data.Alamat = dataReader["Alamat"].ToString();
                        data.AreaID = Convert.ToInt32(dataReader["AreaID"].ToString());
                        data.NamaArea = dataReader["NamaArea"].ToString();
                        data.Latitude = (decimal) Convert.ToDecimal(dataReader["Altitude"].ToString());
                        data.Longitude = (decimal)Convert.ToDecimal(dataReader["Longitude"].ToString());
                        data.NamaPemilik = dataReader["NamaPemilik"].ToString();
                        data.AlamatPemilik = dataReader["AlamatPemilik"].ToString();
                        data.KontakPemilik = dataReader["KontakPemilik"].ToString();
                        data.NamaPengelola = dataReader["NamaPengelola"].ToString();
                        data.KontakPengelola = dataReader["KontakPengelola"].ToString();
                        data.MinimumBayarMonth = Convert.ToInt32(dataReader["MinimumBayarMonth"].ToString());
                        data.MinimumBayarDesc = dataReader["MinimumBayarDesc"].ToString();
                        data.JmlKamar = Convert.ToInt32(dataReader["JmlKamar"].ToString());
                        data.JmlKamarKosong = Convert.ToInt32(dataReader["JmlKamarKosong"].ToString());
                        data.LuasKamar = (float)Convert.ToDouble(dataReader["Luaskamar"].ToString());
                        data.TipeKosID = Convert.ToInt32(dataReader["TipeKosID"].ToString());
                        data.NamaTipeKos = dataReader["NamaTipeKos"].ToString();
                        data.PetID = Convert.ToBoolean(dataReader["PetID"].ToString());
                        data.Keterangan = dataReader["Keterangan"].ToString();
                        data.Harga = Convert.ToDecimal(dataReader["Harga"].ToString());
                        data.SatuanHarga = dataReader["SatuanHarga"].ToString();
                        data.UserID = Convert.ToInt64(dataReader["UserID"].ToString());
                        data.UserName = dataReader["UserName"].ToString();
                        data.StatusApproval = Convert.ToInt32(dataReader["StatusApproval"].ToString());
                        data.AuditTime = Convert.ToDateTime(dataReader["AuditTime"].ToString());
                        data.StatusAktif = Convert.ToInt32(dataReader["StatusAktif"].ToString());
                        data.LastActiveDate = Convert.ToDateTime(dataReader["LastActiveDate"].ToString());
                        data.NamaProvinsi = Convert.ToString(dataReader["NamaProvinsi"]);
                        data.NamaKabupaten = Convert.ToString(dataReader["NamaKabupaten"]);
                        data.NamaKecamatan = Convert.ToString(dataReader["NamaKecamatan"]);
                        data.NamaKelurahan = Convert.ToString(dataReader["NamaKelurahan"]);
                        formKos.Add(data);
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
        public List<FormKosData> GetAllFormKosByKecamatan(string NamaProvinsi, string NamaKabupaten, string NamaKecamatan, int minimum = 0, int maximum = 0, string fasilitas = "", int tipeKosId = 0, int satuanHargaID = 3)
        {
            try
            {
                List<FormKosData> formKos = new List<FormKosData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetAllFormKosByKecamatan");
                db.AddInParameter(dbCommand, "NamaProvinsi", DbType.String, NamaProvinsi);
                db.AddInParameter(dbCommand, "NamaKabupaten", DbType.String, NamaKabupaten);
                db.AddInParameter(dbCommand, "NamaKecamatan", DbType.String, NamaKecamatan);
                db.AddInParameter(dbCommand, "minimum", DbType.Int32, minimum);
                db.AddInParameter(dbCommand, "maximum", DbType.Int32, maximum);
                db.AddInParameter(dbCommand, "TipeKosId", DbType.Int32, tipeKosId);
                db.AddInParameter(dbCommand, "SatuanHargaId", DbType.Int32, satuanHargaID);
                db.AddInParameter(dbCommand, "fasilitas", DbType.String, fasilitas);

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
        public bool UpdateFormKosApproval(Int64 Id, int StatusApproval)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateFormKosApproval");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Id);
                db.AddInParameter(dbCommand, "StatusApproval", DbType.Int32, StatusApproval);

                db.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public bool UpdateFormKosAktif(Int64 Id, int StatusAktif, string AuditUserName)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateFormKosAktif");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Id);
                db.AddInParameter(dbCommand, "StatusAktif", DbType.Int32, StatusAktif);
                db.AddInParameter(dbCommand, "AuditUserName", DbType.String, AuditUserName);

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

        public FormKosData  GetPriceRangeByKecamatan(string NamaProvinsi, string NamaKabupaten, string NamaKecamatan, int SatuanHargaID = 3 )
        {
            try
            {
                var Data = new FormKosData();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetPriceRangeByKecamatan");
                db.AddInParameter(dbCommand, "NamaProvinsi", DbType.String, NamaProvinsi);
                db.AddInParameter(dbCommand, "NamaKabupaten", DbType.String, NamaKabupaten);
                db.AddInParameter(dbCommand, "NamaKecamatan", DbType.String, NamaKecamatan);
                db.AddInParameter(dbCommand, "SatuanHargaID", DbType.Int32, SatuanHargaID);
                
                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        Data.MinimumPrice = Convert.ToDecimal(dataReader["Minimum"].ToString() == "" ? "0" : dataReader["Minimum"].ToString());
                        Data.MaximumPrice = Convert.ToDecimal(dataReader["Maximum"].ToString() == "" ? "0" : dataReader["Maximum"].ToString());

                    }
                    dataReader.Close();
                }
                return Data;
            }
            catch (Exception ex)
            {
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }

        #region KosTelepon

        public List<KosTeleponData> GetKosTeleponByFormID(Int64 Id)
        {
            try
            {
                List<KosTeleponData> formKos = new List<KosTeleponData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetKosTeleponByFormID");
                db.AddInParameter(dbCommand, "FormID", DbType.Int64, Id);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        KosTeleponData Data = new KosTeleponData();
                        Data.FormKosID = Convert.ToInt64(dataReader["FormKosID"].ToString());
                        Data.OrderID = Convert.ToInt32(dataReader["OrderID"].ToString());
                        Data.PhoneID = Convert.ToInt32(dataReader["PhoneID"].ToString());
                        Data.Value = dataReader["Value"].ToString();
                        Data.Deskripsi = dataReader["Deskripsi"].ToString(); 

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

        public bool DeleteKosTelepon(long FormKosID)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DeleteKosTlp");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, FormKosID);
                db.ExecuteNonQuery(dbCommand);

                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }
        public bool InsertKosTelepon(KosTeleponData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertFormKosTelepon");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Data.FormKosID);
                db.AddInParameter(dbCommand, "OrderID", DbType.Int32, Data.OrderID);
                db.AddInParameter(dbCommand, "PhoneID", DbType.Int32, Data.PhoneID);
                db.AddInParameter(dbCommand, "Value", DbType.Decimal, Data.Value);
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

        public bool DeleteKosKamar(long FormKosID)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_DeleteKosKamar");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, FormKosID);
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

        #region Kamar

        public List<KosKamarData> GetKosKamarByFormID(Int64 Id)
        {
            try
            {
                List<KosKamarData> formKos = new List<KosKamarData>();
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_GetKosKamarByFormID");
                db.AddInParameter(dbCommand, "FormID", DbType.Int64, Id);

                using (IDataReader dataReader = db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        KosKamarData Data = new KosKamarData();
                        Data.FormKosID = Convert.ToInt64(dataReader["FormKosID"].ToString());
                        Data.OrderID = Convert.ToInt32(dataReader["OrderID"].ToString());
                        Data.Luas = dataReader["Luas"].ToString();
                        Data.FasilitasKamar = Convert.ToInt32(dataReader["FasilitasKamar"].ToString());
                        Data.JmlKamar = Convert.ToInt32(dataReader["JmlKamar"].ToString());
                        Data.KamarKosong = Convert.ToInt32(dataReader["KamarKosong"].ToString());
                        
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

        public bool InsertKosKamar(KosKamarData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_InsertFormKosKamar");
                db.AddInParameter(dbCommand, "FormKosID", DbType.Int64, Data.FormKosID);
                db.AddInParameter(dbCommand, "OrderID", DbType.Int32, Data.OrderID);
                db.AddInParameter(dbCommand, "Luas", DbType.String, Data.Luas);
                db.AddInParameter(dbCommand, "FasilitasKamar", DbType.Int32, Data.FasilitasKamar);
                db.AddInParameter(dbCommand, "JmlKamar", DbType.Int32, Data.JmlKamar);
                db.AddInParameter(dbCommand, "KamarKosong", DbType.Int32, Data.KamarKosong);
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

        
        #region Update
        public Int64 UpdateFormKos(FormKosData Data)
        {
            try
            {
                DbCommand dbCommand = dbConnection.GetStoredProcCommand(db, "dbo.LIK_UpdateFormKos");
                db.AddInParameter(dbCommand, "ID", DbType.Int64, Data.ID);
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
                db.AddInParameter(dbCommand, "MinimumBayarDesc", DbType.String, Data.MinimumBayarDesc);
                db.AddInParameter(dbCommand, "JmlKamar", DbType.Int32, Data.JmlKamar);
                db.AddInParameter(dbCommand, "LuasKamar", DbType.Double, Data.LuasKamar);
                db.AddInParameter(dbCommand, "TipeKosID", DbType.Int32, Data.TipeKosID);
                db.AddInParameter(dbCommand, "JmlKamarKosong", DbType.Int32, Data.JmlKamarKosong);
                db.AddInParameter(dbCommand, "PetID", DbType.Boolean, Data.PetID);
                db.AddInParameter(dbCommand, "Keterangan", DbType.String, Data.Keterangan);
                db.AddInParameter(dbCommand, "UserID", DbType.Int64, Data.UserID);
                db.AddInParameter(dbCommand, "NamaProvinsi", DbType.String, Data.NamaProvinsi);
                db.AddInParameter(dbCommand, "NamaKabupaten", DbType.String, Data.NamaKabupaten.ToString().Replace("Kota ", ""));
                db.AddInParameter(dbCommand, "NamaKecamatan", DbType.String, Data.NamaKecamatan);
                db.AddInParameter(dbCommand, "NamaKelurahan", DbType.String, Data.NamaKelurahan);
                db.AddParameter(dbCommand, "RETURN_VALUE", DbType.Int64, ParameterDirection.ReturnValue, null, DataRowVersion.Default, null);
                db.ExecuteNonQuery(dbCommand);

                string FormID = "";
                if (Convert.ToInt64(db.GetParameterValue(dbCommand, "RETURN_VALUE")) >= 0)
                {
                    FormID = db.GetParameterValue(dbCommand, "RETURN_VALUE").ToString();
                }
                else
                { return 0; }

                return Convert.ToInt64(FormID);
            }
            catch (Exception ex)
            {
                return 0;
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }

        public long UpdateFormKosLengkap(FormKosData Data)
        {
            bool retVal = true;
            Int64 retFormID = 0;
            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                DbTransaction transaction = connection.BeginTransaction();

                try
                {
                    Int64 FormID = UpdateFormKos(Data);
                    //set return
                    retFormID = FormID;
                    DeleteKosHarga(FormID);
                    foreach (KosHargaData detail in Data.KosHarga)
                    {
                        detail.FormKosID = FormID;
                        
                        retVal = InsertKosHarga(detail);

                        if (retVal == false)
                            throw new DataAccessException("error UpdateKosHarga. ");
                    }
                    DeleteKosFasilitas(FormID);
                    foreach (KosFasilitasData detail in Data.KosFasilitas)
                    {
                        detail.FormKosID = FormID;
                        retVal = InsertKosFasilitas(detail);

                        if (retVal == false)
                            throw new DataAccessException("error UpdateKosFasilitas. ");
                    }
                    DeleteKosLingkungan(FormID);
                    foreach (KosLingkunganData detail in Data.KosLingkungan)
                    {
                        detail.FormKosID = FormID;
                        //todo:
                        retVal = InsertKosLingkungan(detail);

                        if (retVal == false)
                            throw new DataAccessException("error UpdateKosLingkungan. ");
                    }
                    DeleteKosTelepon(FormID);
                    foreach (KosTeleponData detail in Data.KosTelepon)
                    {
                        detail.FormKosID = FormID;
                        retVal = InsertKosTelepon(detail);

                        if (retVal == false)
                            throw new DataAccessException("error UpdateKosTelepon. ");
                    }
                    DeleteKosKamar(FormID);
                    foreach (KosKamarData detail in Data.KosKamar)
                    {
                        detail.FormKosID = FormID;
                        retVal = InsertKosKamar(detail);

                        if (retVal == false)
                            throw new DataAccessException("error updateKosKamar. ");
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
        #endregion 

    
    }
}
