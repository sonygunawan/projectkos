using BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.Admin
{
    public partial class FormBanner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void LoadBanner()
        {
            gvBanner.DataSource = new BannerSystem().GetAllBanner();
            gvBanner.DataBind();
        }
        protected void gvBanner_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvBanner_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBanner.PageIndex = e.NewPageIndex;
        }

        protected void lbtnEdit_Command(object sender, CommandEventArgs e)
        {

        }

        protected void lbtnDelete_Command(object sender, CommandEventArgs e)
        {

        }
    }
}