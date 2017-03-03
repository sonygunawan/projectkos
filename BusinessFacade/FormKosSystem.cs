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
        public bool InsertFormKosLengkap(FormKosData Data)
        {
            return new FormKosDA().InsertFormKosLengkap(Data);
        }

        public List<FormKosData> GetAllFormKos(Int64 Id)
        {
            return new FormKosDA().GetAllFormKos(Id);
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
    }
}
