using LihatKos.BusinessFacade;
using LihatKos.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class CariLokasi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlPropinsi.DataSource = new WilayahSystem().GetAllPropinsi();
                ddlPropinsi.DataTextField = "Nama";
                ddlPropinsi.DataValueField = "IDProvinsi";
                ddlPropinsi.DataBind();
                ddlPropinsi.Items.Insert(0, new ListItem("- Semua - ", "0"));
                ddlPropinsi.SelectedValue = "0";

                ddlKabupaten.Items.Insert(0, new ListItem("- Semua - ", "0"));
                ddlKecamatan.Items.Insert(0, new ListItem("- Semua - ", "0"));


                if (!String.IsNullOrEmpty(Request.QueryString["lokasi"]))
                {
                    txtSearch.Text = Server.HtmlDecode(Request.QueryString["lokasi"]);
                }
                ddlTipeKos.DataSource = new TipeKosSystem().GetAllTipeKos();
                ddlTipeKos.DataTextField = "Nama";
                ddlTipeKos.DataValueField = "ID";
                ddlTipeKos.DataBind();
                ddlTipeKos.Items.Insert(0, new ListItem { Value = "0", Text = "Semua" });
                ddlTipeKos.SelectedValue = "1";

                ddlSatuanHarga.DataSource = new SatuanHargaSystem().GetAllSatuanHarga();
                ddlSatuanHarga.DataTextField = "Nama";
                ddlSatuanHarga.DataValueField = "ID";
                ddlSatuanHarga.DataBind();
                ddlSatuanHarga.SelectedValue = "3";

                chkFasilitas.DataSource = new FasilitasSystem().GetAllFasilitas();
                chkFasilitas.DataTextField = "NamaFasilitas";
                chkFasilitas.DataValueField = "ID";
                chkFasilitas.DataBind();
                if (!String.IsNullOrEmpty(Request.QueryString["latLng"]) || Convert.ToString(Request.QueryString["latLng"]).Split(',')[0] == "")
                {
                    if (Request.QueryString["latLng"] != "")
                    {
                        string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
                        hidLatitude.Value = splitLatLng[0];
                        hidLongitude.Value = splitLatLng[1];
                    }
                }
                //if (!String.IsNullOrEmpty(Request.QueryString["tipeKos"]))
                //{
                //    ddlTipeKos.SelectedValue = Request.QueryString["tipeKos"];
                //}
                //if (!String.IsNullOrEmpty(Request.QueryString["jkWkt"]))
                //{
                //    ddlSatuanHarga.SelectedValue = Request.QueryString["jkWkt"];
                //}
                
                //if (!String.IsNullOrEmpty(Request.QueryString["fasilitas"]))
                //{
                //    string[] FasilitasItems = Request.QueryString["fasilitas"].ToString().Split(',');
                //    foreach (ListItem item in chkFasilitas.Items)
                //    {
                //        var value = FasilitasItems.Where(i => i == item.Value).ToList();
                //        if (value.Count > 0)
                //        {
                //            if (value.ToString() != "")
                //            {
                //                item.Selected = true;
                //            }
                //        }
                //    }
                //}
                if (!String.IsNullOrEmpty(Request.QueryString["propinsi"]))
                {
                    ddlPropinsi.SelectedValue = Request.QueryString["propinsi"].ToString();
                    ddlPropinsi_SelectedIndexChanged(null, null);
                }

            }
            int tipeKos = 0;
            int jkWkt = 0;
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
                rptListByLoc.DataSource = new FormKosSystem().GetAllFormKosByKecamatan(propinsi, kabupaten, kecamatan);
                rptListByLoc.DataBind();
            }
            else
            {

                if (String.IsNullOrEmpty(Request.QueryString["latLng"]) || Convert.ToString(Request.QueryString["latLng"]).Split(',')[0] == "")
                {
                    rptListByLoc.DataSource = new FormKosSystem().GetAllFormKos(0, "");
                    rptListByLoc.DataBind();
                }
                else
                {
                    string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
                    //Fasilitas
                    rptListByLoc.DataSource = new FormKosSystem().GetAllFormKosByLocation(splitLatLng[0], splitLatLng[1], tipeKos, jkWkt, fasilitas);
                    rptListByLoc.DataBind();
                }
            }
            //if (!String.IsNullOrEmpty(Request.QueryString["latLng"]))
            //{
            //    string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
            //    hidLatitude.Value = splitLatLng[0];
            //    hidLongitude.Value = splitLatLng[1];
            //}
        }

        private void LoadPriceRange()
        {
            var provinsi = (ddlPropinsi.SelectedItem.Text == "- Semua - ") ? "" : ddlPropinsi.SelectedItem.Text;
            var kabupaten = (ddlKabupaten.SelectedItem.Text == "- Semua - ") ? "" : ddlKabupaten.SelectedItem.Text;
            var kecamatan = (ddlKecamatan.SelectedItem.Text == "- Semua - ") ? "" : ddlKecamatan.SelectedItem.Text;

            var formKosMin = new FormKosSystem().GetPriceRangeByKecamatan(provinsi, kabupaten, kecamatan);

            var MinimumPrice = formKosMin.MinimumPrice.ToString("G0");
            var MaximumPrice = formKosMin.MaximumPrice.ToString("G0");
            multiHandle2_1_BoundControl.Text = MinimumPrice;
            multiHandleSliderExtenderTwo.Minimum = Convert.ToInt32(MinimumPrice);
            multiHandle2_2_BoundControl.Text = MaximumPrice;
            multiHandleSliderExtenderTwo.Maximum = Convert.ToInt32(MaximumPrice);
        }
        protected void ddlPropinsi_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlKabupaten.DataSource = new WilayahSystem().GetAllKabupaten(Convert.ToInt32(ddlPropinsi.SelectedValue));
            ddlKabupaten.DataTextField = "Nama";
            ddlKabupaten.DataValueField = "IDKabupaten";
            ddlKabupaten.DataBind();
            ddlKabupaten.Items.Insert(0, new ListItem("- Semua - ", "0"));
            if (!String.IsNullOrEmpty(Request.QueryString["kabupaten"]))
            {
                ddlKabupaten.SelectedValue = Request.QueryString["kabupaten"].ToString();
            }

            LoadPriceRange();
            ddlKabupaten_SelectedIndexChanged(null, null);
        }
        protected void ddlKabupaten_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlKecamatan.DataSource = new WilayahSystem().GetAllKecamatan(Convert.ToInt32(ddlKabupaten.SelectedValue));
            ddlKecamatan.DataTextField = "Nama";
            ddlKecamatan.DataValueField = "IDKecamatan";
            ddlKecamatan.DataBind();
            ddlKecamatan.Items.Insert(0, new ListItem("- Semua - ", "0"));

            if (!String.IsNullOrEmpty(Request.QueryString["kecamatan"]))
            {
                ddlKecamatan.SelectedValue = Request.QueryString["kecamatan"].ToString();
            }

            LoadPriceRange();
            //ddlKecamatan_SelectedIndexChanged(null, null);
        }
        protected void chkFasilitas_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (chkFasilitas.Items[0].Selected == true)
            //{
            //    foreach (ListItem item in chkFasilitas.Items)
            //    {
            //        item.Selected = true;
            //    }
            //}
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
        String fasilitas;
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            fasilitas = "";
            foreach (ListItem item in chkFasilitas.Items)
            {
                if (item.Selected == true)
                    fasilitas += item.Value + ",";
            }
            fasilitas = (fasilitas != "") ? fasilitas.Substring(0, fasilitas.Length - 1) : "";
            //Response.Redirect("/CariLokasi?tipeKos=" + ddlTipeKos.SelectedValue + "&lokasi=" + Server.HtmlEncode(txtSearch.Text) + "&fasilitas=" + fasilitas
            //    + "&jkWkt=" + ddlSatuanHarga.SelectedValue + "&latLng=" + hidLatitude.Value + "," + hidLongitude.Value + "&propinsi=" + ddlPropinsi.SelectedValue
            //    + "&kabupaten=" + ddlKabupaten.SelectedValue + "&kecamatan=" + ddlKecamatan.SelectedValue + "&minimum=" + multiHandle2_1_BoundControl.Text
            //    + "&maximum=" + multiHandle2_2_BoundControl.Text);
        }
    }
}