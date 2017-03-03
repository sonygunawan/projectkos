using LihatKos.Common;
using LihatKos.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.BusinessFacade
{
    public class FavoriteSystem
    {
        //Master
        public bool InsertFormKosFavorit(Int64 Id, Int64 UserId)
        {
            return new FavoriteDA().InsertFormKosFavorit(Id, UserId);
        }

        public bool GetFormKosFavorit(Int64 Id, Int64 UserId)
        {
            return new FavoriteDA().GetFormKosFavorit(Id, UserId);
        }
        //Dashboard
        public List<FormKosData> GetMyFavoriteForm(Int64 UserID)
        {
            return new FavoriteDA().GetMyFavoriteForm(UserID);
        }
    }
}
