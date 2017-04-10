using AjaxControlToolkit;
using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.UserControl.CariLokasi
{
    public partial class SearchControlDetail : System.Web.UI.UserControl
    {
        String fasilitas;
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

                if (!String.IsNullOrEmpty(Request.QueryString["tipeKos"]))
                {
                    ddlTipeKos.SelectedValue = Request.QueryString["tipeKos"];
                }
                if (!String.IsNullOrEmpty(Request.QueryString["jkWkt"]))
                {
                    ddlSatuanHarga.SelectedValue = Request.QueryString["jkWkt"];
                }
                if (!String.IsNullOrEmpty(Request.QueryString["latLng"]) || Convert.ToString(Request.QueryString["latLng"]).Split(',')[0] == "")
                {
                    if (Request.QueryString["latLng"] != "")
                    {
                        string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
                        hidLatitude.Value = splitLatLng[0];
                        hidLongitude.Value = splitLatLng[1];
                    }
                }
                if (!String.IsNullOrEmpty(Request.QueryString["fasilitas"]))
                {
                    string[] FasilitasItems = Request.QueryString["fasilitas"].ToString().Split(',');
                    foreach (ListItem item in chkFasilitas.Items)
                    {
                        var value = FasilitasItems.Where(i => i == item.Value).ToList();
                        if (value.Count > 0)
                        {
                            if (value.ToString() != "")
                            {
                                item.Selected = true;
                            }
                        }
                    }
                }
                if (!String.IsNullOrEmpty(Request.QueryString["propinsi"]))
                {
                    ddlPropinsi.SelectedValue = Request.QueryString["propinsi"].ToString();
                    ddlPropinsi_SelectedIndexChanged(null, null);
                }

            }
            
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
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            fasilitas = "";
            foreach (ListItem item in chkFasilitas.Items)
            {
                if (item.Selected == true)
                    fasilitas += item.Value + ",";
            }
            fasilitas = (fasilitas != "") ? fasilitas.Substring(0, fasilitas.Length - 1) : "";
            Response.Redirect("/CariLokasi?tipeKos=" + ddlTipeKos.SelectedValue + "&lokasi=" + Server.HtmlEncode(txtSearch.Text) + "&fasilitas=" + fasilitas
                + "&jkWkt=" + ddlSatuanHarga.SelectedValue + "&latLng=" + hidLatitude.Value + "," + hidLongitude.Value + "&propinsi=" + ddlPropinsi.SelectedValue 
                + "&kabupaten=" + ddlKabupaten.SelectedValue + "&kecamatan=" + ddlKecamatan.SelectedValue + "&minimum=" + multiHandle2_1_BoundControl.Text 
                + "&maximum=" + multiHandle2_2_BoundControl.Text);
        }

    }
}