using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class FormKosSystem
    {
        public Int64 InsertFormKos(FormKosData Data)
        {
            return new FormKosDA().InsertFormKos(Data);
        }
        public string GetMaxFormKos()
        {
            return new FormKosDA().GetMaxFormKos();
        }
        public bool InsertKosHarga(KosHargaData Data)
        {
            return new FormKosDA().InsertKosHarga(Data);
        }
        public List<KosHargaData> GetKosHargaByFormID(Int64 Id)
        {
            return new FormKosDA().GetKosHargaByFormID(Id);
        }
        public List<KosFasilitasData> GetKosFasilitasByFormID(Int64 Id)
        {
            return new FormKosDA().GetKosFasilitasByFormID(Id);
        }
        public List<KosLingkunganData> GetKosLingkunganByFormID(Int64 Id)
        {
            return new FormKosDA().GetKosLingkunganByFormID(Id);
        }
        public Int64 InsertFormKosLengkap(FormKosData Data)
        {
            return new FormKosDA().InsertFormKosLengkap(Data);
        }

        public List<FormKosData> GetAllFormKos(Int64 Id, string Search)
        {
            return new FormKosDA().GetAllFormKos(Id, Search);
        }

        public List<FormKosData> GetAllFormKosByLocation(string Latitude, string Longitude, int TipeKosID, int SatuanHargaID, string Fasilitas)
        {
            return new FormKosDA().GetAllFormKosByLocation(Latitude, Longitude, TipeKosID, SatuanHargaID, Fasilitas);
        }
       
        public bool UpdateFormKosView(Int64 Id)
        {
            return new FormKosDA().UpdateFormKosView(Id);
        }
        
        public List<FormKosData> GetHighestFormKosByArea(int AreaID)
        {
            return new FormKosDA().GetHighestFormKosByArea(AreaID);
        }
        public FormKosData GetPriceRangeByKecamatan(string NamaProvinsi, string NamaKabupaten, string NamaKecamatan)
        {
            return new FormKosDA().GetPriceRangeByKecamatan(NamaProvinsi, NamaKabupaten, NamaKecamatan);
        }
        public List<FormKosData> GetAllFormKosByKecamatan(string NamaProvinsi, string NamaKabupaten, string NamaKecamatan)
        {
            return new FormKosDA().GetAllFormKosByKecamatan(NamaProvinsi, NamaKabupaten, NamaKecamatan);
        }
        public bool UpdateFormKosApproval(Int64 Id, int StatusApproval)
        {
            return new FormKosDA().UpdateFormKosApproval(Id, StatusApproval);
        }
        public bool UpdateFormKosAktif(Int64 Id, int StatusAktif, string AuditUserName)
        {
            return new FormKosDA().UpdateFormKosAktif(Id, StatusAktif, AuditUserName);
        }

        #region Kos Telepon

        public List<KosTeleponData> GetKosTeleponByFormID(Int64 Id)
        {
            return new FormKosDA().GetKosTeleponByFormID(Id);
        }

        #endregion 
        
        #region Kamar

        public List<KosKamarData> GetKosKamarByFormID(Int64 Id)
        {
            return new FormKosDA().GetKosKamarByFormID(Id);
        }
        public bool InsertKosKamar(KosKamarData Data)
        {
            return new FormKosDA().InsertKosKamar(Data);
        }

        #endregion 

    }
}
