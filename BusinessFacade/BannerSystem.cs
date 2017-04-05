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
        public BannerData GetBanner(int ID)
        {
            return new BannerDA().GetBanner(ID);
        }
        public bool UpdateBanner(BannerData data)
        {
            return new BannerDA().UpdateBanner(data);
        }
        public bool DeleteBanner(int ID)
        {
            return new BannerDA().DeleteBanner(ID);
        }
    }
}
