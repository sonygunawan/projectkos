using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class FasilitasSystem
    {
        public List<FasilitasData> GetAllFasilitas()
        {
            return new FasilitasDA().GetAllFasilitas();
        }
    }
}
