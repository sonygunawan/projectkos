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
                //ToolkitScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "testSearch",
                //    "$(function () {$(\"#slider-3\").slider({" +
                //        "range: true, min: 0, max: 500, values: [75, 300], slide: function (event, ui) { $(\"#price\").val(\"$\" + ui.values[0] + \" - $\" + ui.values[1]); } " +
                //    "}); $(\"#price\").val(\"$\" + $(\"#slider-3\").slider(\"values\", 0) + \" - $\" + $(\"#slider-3\").slider(\"values\", 1)); }); "
                //    , true);
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
                }

            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            fasilitas = "";
            foreach (ListItem item in chkFasilitas.Items)
            {
                if (item.Selected == true)
                    fasilitas += item.Value + ",";
            }
            fasilitas = (fasilitas != "") ? fasilitas.Substring(0,fasilitas.Length - 1) : "";
            Response.Redirect("/CariLokasi?tipeKos="+ ddlTipeKos.SelectedValue +"&lokasi="+ Server.HtmlEncode(txtSearch.Text) +"&fasilitas=" + fasilitas 
                + "&jkWkt=" + ddlSatuanHarga.SelectedValue + "&latLng=" + hidLatitude.Value + "," + hidLongitude.Value + "&propinsi=" + ddlPropinsi.SelectedValue + 
                "&kabupaten=" + ddlKabupaten.SelectedValue + "&kecamatan=" + ddlKecamatan.SelectedValue);
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
        }
    }
}