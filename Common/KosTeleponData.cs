using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common
{
    [Serializable]
    public class KosTeleponData
    {
        public Int64 FormKosID { get; set; }
        public int OrderID { get; set; }
        public int PhoneID { get; set; }
        public string Value { get; set; }
        public string Deskripsi { get; set; }

    }
}
