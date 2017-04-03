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
            LoadBanner();
        }
        private void LoadBanner()
        {
            gvBanner.DataSource = new BannerSystem().GetListBanner();
            gvBanner.DataBind();
        }
        protected void gvBanner_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvBanner_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBanner.PageIndex = e.NewPageIndex;
        }

        protected void btnAddBanner_Click(object sender, EventArgs e)
        {
            string maxBanner = new BannerSystem().GetMaxBanner();
            ViewState["MaxBanner"] = maxBanner;
            litPopupTitle.Text = "Add Banner: " + maxBanner;
            MPEForm.Show();
        }
        protected void lbtnEdit_Command(object sender, CommandEventArgs e)
        {

        }

        protected void lbtnDelete_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {

        }

    }
}