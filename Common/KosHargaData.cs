using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common
{
    public class KosHargaData
    {
        public Int64 FormKosID { get; set; }
        public int SatuanHargaID { get; set; }
        public decimal Harga { get; set; }
        public string Deskripsi { get; set; }

    }
}
