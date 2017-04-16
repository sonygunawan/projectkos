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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //room.Visible = false;
            if (!Page.IsPostBack)
            {
                ddlPropinsi.DataSource = new WilayahSystem().GetAllPropinsi();
                ddlPropinsi.DataTextField = "Nama";
                ddlPropinsi.DataValueField = "IDProvinsi";
                ddlPropinsi.DataBind();
                ddlPropinsi.Items.Insert(0, new ListItem("- Semua - ", "0"));
                //ddlPropinsi.Items.Insert(0, "- Semua -");
                ddlPropinsi.SelectedValue = "0";

                ddlKabupaten.Items.Insert(0, new ListItem("- Semua - ", "0"));
                ddlKecamatan.Items.Insert(0, new ListItem("- Semua - ", "0"));

                hidMinimumPrice.Value = hidMinimumSetValue.Value = "0";
                hidMaximumPrice.Value = hidMaximumSetValue.Value = "5000000";

                LoadPriceRange();
            }
            //RunClientScript();
        }
        private void RunClientScript()
        {
            ClientScript.RegisterStartupScript(GetType(), "multislider", "$('#slider-3').slider({ " +
                            " range: true, min: 0, max: 5000000, step: 5000, values: [0, 2000000], " +
                            " slide: function (event, ui) { " +
                            " $('#price').val('Rp.' + ui.values[0] + ' - Rp.' + ui.values[1]); " +
                            " $('#hidMinimumSetValue').val(ui.values[0]); " +
                            " $('#hidMaximumSetValue').val(ui.values[1]); }  }); " +
                            " $('#price').val('Rp.' + $('#slider-3').slider('values', 0) + " +
                            " ' - Rp.' + $('#slider-3').slider('values', 1));"
                // + "$('#hidMinimumSetValue').val($('#slider-3').slider('values', 0)); " + 
                //"$('#hidMaximumSetValue').val($('#slider-3').slider('values', 1)); "
                        , true);

        }
        protected void ddlPropinsi_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlKabupaten.DataSource = new WilayahSystem().GetAllKabupaten(Convert.ToInt32(ddlPropinsi.SelectedValue));
            ddlKabupaten.DataTextField = "Nama";
            ddlKabupaten.DataValueField = "IDKabupaten";
            ddlKabupaten.DataBind();
            ddlKabupaten.Items.Insert(0, new ListItem("- Semua - ", "0"));

            LoadPriceRange();
            //ddlKabupaten.SelectedValue = "0";
        }

        protected void ddlKabupaten_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlKecamatan.DataSource = new WilayahSystem().GetAllKecamatan(Convert.ToInt32(ddlKabupaten.SelectedValue));
            ddlKecamatan.DataTextField = "Nama";
            ddlKecamatan.DataValueField = "IDKecamatan";
            ddlKecamatan.DataBind();
            ddlKecamatan.Items.Insert(0, new ListItem("- Semua - ", "0"));
            //ddlKabupaten.SelectedValue = "0";
            LoadPriceRange();
            //RunClientScript();
        }

        private void LoadPriceRange()
        {
            var provinsi = (ddlPropinsi.SelectedItem.Text == "- Semua - ") ? "" : ddlPropinsi.SelectedItem.Text;
            var kabupaten = (ddlKabupaten.SelectedItem.Text == "- Semua - ") ? "" : ddlKabupaten.SelectedItem.Text;
            var kecamatan = (ddlKecamatan.SelectedItem.Text == "- Semua - ") ? "" : ddlKecamatan.SelectedItem.Text;

            var formKosMin = new FormKosSystem().GetPriceRangeByKecamatan(provinsi, kabupaten, kecamatan);

            var MinimumPrice = formKosMin.MinimumPrice.ToString("G0");
            var MaximumPrice = formKosMin.MaximumPrice.ToString("G0");
            multiHandle2_1_BoundControl.Text = hidMinimumPrice.Value = hidMinimumSetValue.Value = MinimumPrice;
            multiHandleSliderExtenderTwo.Minimum = Convert.ToInt32(MinimumPrice);
            multiHandle2_2_BoundControl.Text = hidMaximumPrice.Value = hidMaximumSetValue.Value = MaximumPrice;
            multiHandleSliderExtenderTwo.Maximum = Convert.ToInt32(MaximumPrice);
            multiHandleSliderExtenderTwo.ClientState = MinimumPrice + "," + MaximumPrice;          
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var provinsi = ddlPropinsi.SelectedValue; //(ddlPropinsi.SelectedItem.Text == "- Semua -") ? "" : ddlPropinsi.SelectedItem.Text;
            var kabupaten = ddlKabupaten.SelectedValue; // (ddlKabupaten.SelectedItem.Text == "- Semua -") ? "" : ddlKabupaten.SelectedItem.Text;
            var kecamatan = ddlKecamatan.SelectedValue; //(ddlKecamatan.SelectedItem.Text == "- Semua -") ? "" : ddlKecamatan.SelectedItem.Text;

            Response.Redirect("/CariLokasi?tipeKos=&lokasi=&latLng=" +
                "&propinsi=" + provinsi + "&kabupaten=" + kabupaten + "&kecamatan=" + kecamatan+ "&minimum=" + multiHandle2_1_BoundControl.Text + "&maximum=" + multiHandle2_2_BoundControl.Text);
        }
    }
}