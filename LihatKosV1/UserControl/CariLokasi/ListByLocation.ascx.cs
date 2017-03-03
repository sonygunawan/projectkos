using LihatKos.BusinessFacade;
using LihatKos.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.UserControl.CariLokasi
{
    public partial class ListByLocation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int tipeKos = 0;
            int jkWkt = 0;
            string Fasilitas = "";
            if (!String.IsNullOrEmpty(Request.QueryString["tipeKos"]))
            {
                tipeKos = Convert.ToInt32(Request.QueryString["tipeKos"]);
            }
            if (!String.IsNullOrEmpty(Request.QueryString["jkWkt"]))
            {
                jkWkt = Convert.ToInt32(Request.QueryString["jkWkt"]);
            }
            if (!String.IsNullOrEmpty(Request.QueryString["fasilitas"]))
            {
                Fasilitas = Request.QueryString["fasilitas"].ToString();
            }
            if (String.IsNullOrEmpty(Request.QueryString["latLng"]) || Convert.ToString(Request.QueryString["latLng"]).Split(',')[0] == "")
            {
                rptListByLoc.DataSource = new FormKosSystem().GetAllFormKos(0);
                rptListByLoc.DataBind();
            }
            else
            {
                string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
                rptListByLoc.DataSource = new FormKosSystem().GetAllFormKosByLocation(splitLatLng[0], splitLatLng[1], tipeKos, jkWkt, Fasilitas);
                rptListByLoc.DataBind();
            }

            if (!Page.IsPostBack)
            {
                
            }
        }

        protected void rptListByLoc_ItemDataBound(object sender, RepeaterItemEventArgs e)
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