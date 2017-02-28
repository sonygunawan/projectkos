using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common
{
    public class TipeKosData
    {
        public int ID { get; set; }
        public string Kode { get; set; }
        public string Nama { get; set; }
        public string Deskripsi { get; set; }

        public string NamaRdl { get { return Nama + "&nbsp;&nbsp;&nbsp;&nbsp;"; }  }

    }
}
