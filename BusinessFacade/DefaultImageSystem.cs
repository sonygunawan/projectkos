using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class DefaultImageSystem
    {
        public DefaultImageData GetDefaultPhotoByFormID(Int64 Id)
        {
            return new DefaultImageDA().GetDefaultPhotoByFormID(Id);
        }
        public bool UpdateDefaultPhotoByFormID(Int64 Id, string FilePath)
        {
            return new DefaultImageDA().UpdateDefaultPhotoByFormID(Id, FilePath);
        }
    }
}
