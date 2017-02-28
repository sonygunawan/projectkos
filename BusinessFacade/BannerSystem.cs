using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessFacade
{
    public class BannerSystem
    {
        public List<string> GetAllBanner()
        {
            return new BannerDA().GetAllBanner();
        }
    }
}
