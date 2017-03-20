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
                rdlTipeKos.DataSource = new TipeKosSystem().GetAllTipeKos();
                rdlTipeKos.DataTextField = "Nama";
                rdlTipeKos.DataValueField = "ID";
                rdlTipeKos.DataBind();
                rdlTipeKos.Items.Insert(0, new ListItem { Value = "0", Text = "Semua" });
                rdlTipeKos.SelectedValue = "0";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("/CariLokasi?tipeKos=" + rdlTipeKos.SelectedValue + "&lokasi="+ Server.HtmlEncode(txtSearch.Text) 
                +"&latLng=" + hidLatitude.Value + "," +  hidLongitude.Value);
        }
    }
}