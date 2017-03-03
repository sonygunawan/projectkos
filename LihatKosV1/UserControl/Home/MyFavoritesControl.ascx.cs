using LihatKos.BusinessFacade;
using LihatKos.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.UserControl
{
    public partial class MyFavoritesControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                rptFavorites.DataSource = new FavoriteSystem().GetMyFavoriteForm(Convert.ToInt32(Session["UserID"]));
                rptFavorites.DataBind();
            }
        }

        protected void rptFavorites_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                FormKosData Data = (FormKosData)e.Item.DataItem;

                Label lblHargaBulanan = (Label)e.Item.FindControl("lblHargaBulanan");
                Label lblLocation = (Label)e.Item.FindControl("lblLocation");
                HyperLink hlDetailLink = (HyperLink)e.Item.FindControl("hlDetailLink");

                lblHargaBulanan.Text = Data.Harga.ToString("N2");
                lblLocation.Text = Data.Nama;
                hlDetailLink.NavigateUrl = "../../DetailKos?id=" + Data.ID.ToString();
            }
        }
    }
}