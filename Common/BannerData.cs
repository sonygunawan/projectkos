using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common
{
    public class BannerData
    {
        public int ID { get; set; }
        public string Kode { get; set; }
        public string Nama { get; set; }
        public string Deskripsi { get; set; }
        public string FilePath { get; set; }
        public string Url { get; set; }
        public int Prioritas { get; set; }
    }
}
