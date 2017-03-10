using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common
{
    public class FormKosData
    {
        public Int64 ID { get; set; }
        public string Kode { get; set; }
        public string Nama { get; set; }
        public string Deskripsi { get; set; }
        public string Alamat { get; set; }
        public int AreaID { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public int ImageID { get; set; }
        public string NamaPemilik { get; set; }
        public string AlamatPemilik { get; set; }
        public string KontakPemilik { get; set; }
        public string NamaPengelola { get; set; }
        public string AlamatPengelola { get; set; }
        public string KontakPengelola { get; set; }
        public int MinimumBayarMonth { get; set; }
        public string MinimumBayarDesc { get; set; }
        public  int JmlKamar { get; set; }
        public float LuasKamar { get; set; }
        public int TipeKosID { get; set; }
        public string NamaTipeKos { get; set; }
        public int JmlKamarKosong { get; set; }
        public bool PetID { get; set; }
        public int FormKosFasilitasID { get; set; }
        public int FormKosLingkunganID { get; set; }
        public string Keterangan { get; set; }
        public Int64 UserID { get; set; }
        public string UserName { get; set; }

        public decimal Harga { get; set; }
        public string SatuanHarga { get; set; }
        public string NamaArea { get; set; }

        public List<KosHargaData> KosHarga{get; set;}
        public List<KosFasilitasData> KosFasilitas { get; set; }
        public List<KosLingkunganData> KosLingkungan { get; set; }

    }
}
