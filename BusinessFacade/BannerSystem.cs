using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessFacade
{
    public class BannerSystem
    {
        public string GetMaxBanner()
        {
            return new BannerDA().GetMaxBanner();
        }
        public List<string> GetAllBanner()
        {
            return new BannerDA().GetAllBanner();
        }
        public List<BannerData> GetListBanner()
        {
            return new BannerDA().GetListBanner();
        }
    }
}
