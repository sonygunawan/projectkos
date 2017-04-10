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
            if (!String.IsNullOrEmpty(Request.QueryString["propinsi"]))
            {

                var propinsiStr = Convert.ToInt32(Request.QueryString["propinsi"].ToString());
                var propinsi = "";
                var propinsis = new WilayahSystem().GetAllPropinsi();
                if (propinsiStr > 0)
                {
                    propinsi = propinsis.Where(a => a.IDProvinsi == propinsiStr).ToList()[0].Nama; //Request.QueryString["propinsi"].ToString();
                }
                var kabupaten = "";
                if (Convert.ToInt32(Request.QueryString["kabupaten"].ToString()) > 0)
                {
                    var kabupatenStr = Convert.ToInt32(Request.QueryString["kabupaten"].ToString());
                    kabupaten = new WilayahSystem().GetAllKabupaten(propinsiStr).Where(a => a.IDKabupaten == kabupatenStr).ToList()[0].Nama;
                }
                var kecamatan = "";
                if (Convert.ToInt32(Request.QueryString["kecamatan"].ToString()) > 0)
                {
                    var kecamatanStr = Convert.ToInt32(Request.QueryString["kabupaten"].ToString());
                    kecamatan = new WilayahSystem().GetAllKecamatan(kecamatanStr)[0].Nama;
                }
                rptListByLoc.DataSource = new FormKosSystem().GetAllFormKosByKecamatan(propinsi,kabupaten,kecamatan);
                rptListByLoc.DataBind();
            }
            else
            {

                if (String.IsNullOrEmpty(Request.QueryString["latLng"]) || Convert.ToString(Request.QueryString["latLng"]).Split(',')[0] == "")
                {
                    rptListByLoc.DataSource = new FormKosSystem().GetAllFormKos(0,"");
                    rptListByLoc.DataBind();
                }
                else
                {
                    string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
                    rptListByLoc.DataSource = new FormKosSystem().GetAllFormKosByLocation(splitLatLng[0], splitLatLng[1], tipeKos, jkWkt, Fasilitas);
                    rptListByLoc.DataBind();
                }
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
                Image imgDetail = (Image)e.Item.FindControl("imgDetail");
                lblHargaBulanan.Text = Data.Harga.ToString("N2");
                lblLocation.Text = Data.Nama;
                hlDetailLink.NavigateUrl = "../../DetailKos?id=" + Data.ID.ToString();
                var defaultImage = new DefaultImageSystem().GetDefaultPhotoByFormID(Data.ID);
                imgDetail.Width = 64;
                imgDetail.Height = 64;
                imgDetail.ImageUrl = defaultImage.FilePath;
            }
        }
    }
}