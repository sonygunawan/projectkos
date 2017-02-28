using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.UserControl
{
    public partial class SearchControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rdlTipeKos2.DataSource = new TipeKosSystem().GetAllTipeKos();
                rdlTipeKos2.DataTextField = "Nama";
                rdlTipeKos2.DataValueField = "ID";
                rdlTipeKos2.DataBind();
                rdlTipeKos2.SelectedValue = "1";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("/CariLokasi?latLng=" + hidLatitude.Value + "," +  hidLongitude.Value);
        }
    }
}