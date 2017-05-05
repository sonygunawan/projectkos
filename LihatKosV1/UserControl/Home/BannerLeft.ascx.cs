using BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.UserControl
{
    public partial class BannerLeft : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptBanner.DataSource = new BannerSystem().GetAllBanner();
                rptBanner.DataBind();
            }
        }

        protected void rptBanner_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                String filePath = (String)e.Item.DataItem;

                Image imgBanner = (Image)e.Item.FindControl("imgBanner");
                imgBanner.ImageUrl = "../../"+ filePath;
            }
        }
    }
}