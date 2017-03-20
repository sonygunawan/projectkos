using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class WilayahSystem
    {
        public List<WilayahData> GetAllPropinsi()
        {
            return new WilayahDA().GetAllPropinsi();
        }
        public List<WilayahData> GetAllKabupaten(int IDProvinsi)
        {
            return new WilayahDA().GetAllKabupaten(IDProvinsi);
        }
        public List<WilayahData> GetAllKecamatan(int IDKabupaten)
        {
            return new WilayahDA().GetAllKecamatan(IDKabupaten);
        }
    }
}
