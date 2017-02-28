using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class SatuanHargaSystem
    {
        public List<SatuanHargaData> GetAllSatuanHarga()
        {
            return new SatuanHargaDA().GetAllSatuanHarga();
        }
    }
}
