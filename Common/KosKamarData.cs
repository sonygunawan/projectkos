using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common
{
    public class KosKamarData
    {
        public Int64 FormKosID { get; set; }
        public int OrderID { get; set; }
        public string Luas { get; set; }
        public int FasilitasKamar { get; set; }
        public int JmlKamar { get; set; }
        public int KamarKosong { get; set; }
    }
}
