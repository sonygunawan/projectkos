using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class AreaSystem
    {
        public List<AreaData> GetAllArea()
        {
            return new AreaDA().GetAllArea();
        }
    }
}
