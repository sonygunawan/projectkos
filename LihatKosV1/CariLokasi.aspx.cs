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
                    //txtSearch.Text = Server.HtmlDecode(Request.QueryString["lokasi"]);
                }
                ddlTipeKos.DataSource = new TipeKosSystem().GetAllTipeKos();
                ddlTipeKos.DataTextField = "Nama";
                ddlTipeKos.DataValueField = "ID";
                ddlTipeKos.DataBind();
                ddlTipeKos.Items.Insert(0, new ListItem { Value = "0", Text = "Semua" });
                //ddlTipeKos.SelectedValue = "1";

                ddlSatuanHarga.DataSource = new SatuanHargaSystem().GetAllSatuanHarga();
                ddlSatuanHarga.DataTextField = "Nama";
                ddlSatuanHarga.DataValueField = "ID";
                ddlSatuanHarga.DataBind();
                ddlSatuanHarga.SelectedValue = "3";

                chkFasilitas.DataSource = new FasilitasSystem().GetAllFasilitas();
                chkFasilitas.DataTextField = "NamaFasilitas";
                chkFasilitas.DataValueField = "ID";
                chkFasilitas.DataBind();
                foreach (ListItem item in chkFasilitas.Items)
                {
                    item.Selected = true;
                }
                string strFasilitas = "";
                foreach (ListItem item in chkFasilitas.Items)
                {
                    if (item.Selected == true)
                        strFasilitas += item.Value + ",";
                }
                strFasilitas = (strFasilitas == "") ? "" : strFasilitas.Substring(0, strFasilitas.Length - 1);
                Session["Fasilitas"] = strFasilitas;
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
                if (!String.IsNullOrEmpty(Request.QueryString["kabupaten"]))
                {
                    ddlKabupaten.SelectedValue = Request.QueryString["kabupaten"].ToString();
                    //ddlKabupaten_SelectedIndexChanged(null, null);
                }
                if (!String.IsNullOrEmpty(Request.QueryString["kecamatan"]))
                {
                    ddlKecamatan.SelectedValue = Request.QueryString["kecamatan"].ToString();
                    //ddlKecamatan_SelectedIndexChanged(null, null);
                }
                //Load Minimum-Maximum Price
                LoadPriceRange();
                var MinimumPrice = 0;
                if (!String.IsNullOrEmpty(Request.QueryString["minimum"]))
                {
                    MinimumPrice = Convert.ToInt32(Request.QueryString["minimum"]);
                    if (MinimumPrice > 0)
                    {
                        //multiHandle2_1_BoundControl.Text = MinimumPrice.ToString();
                    }
                }
                var MaximumPrice = 0;
                if (!String.IsNullOrEmpty(Request.QueryString["maximum"]))
                {
                    MaximumPrice = Convert.ToInt32(Request.QueryString["maximum"]);
                    if (Convert.ToInt32(Request.QueryString["maximum"]) > 0)
                    {
                        //multiHandle2_2_BoundControl.Text = MaximumPrice.ToString();
                    }
                }
                multiHandleSliderExtenderTwo.ClientState = MinimumPrice + "," + MaximumPrice;          
                
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
            }
            //else
            //{
            //    LoadPriceRange();
            //}
            
            //if (!String.IsNullOrEmpty(Request.QueryString["latLng"]))
            //{
            //    string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
            //    hidLatitude.Value = splitLatLng[0];
            //    hidLongitude.Value = splitLatLng[1];
            //}
            //Dim lnkFull As LinkButton = TryCast(row.FindControl("lnkFull"), LinkButton)
            //ScriptManager.GetCurrent(this).RegisterPostBackControl(lnkSliderChanged);
        }

        private void LoadPriceRange()
        {
            var provinsi = (ddlPropinsi.SelectedItem.Text == "- Semua - ") ? "" : ddlPropinsi.SelectedItem.Text;
            var kabupaten = (ddlKabupaten.SelectedItem.Text == "- Semua - ") ? "" : ddlKabupaten.SelectedItem.Text;
            var kecamatan = (ddlKecamatan.SelectedItem.Text == "- Semua - ") ? "" : ddlKecamatan.SelectedItem.Text;
            //ddlSatuanHarga
            var satuanHargaID = Convert.ToInt32(ddlSatuanHarga.SelectedValue);
            var formKosMin = new FormKosSystem().GetPriceRangeByKecamatan(provinsi, kabupaten, kecamatan, satuanHargaID);

            var MinimumPrice = formKosMin.MinimumPrice.ToString("G0");
            var MaximumPrice = formKosMin.MaximumPrice.ToString("G0");
            multiHandle2_1_BoundControl.Text = MinimumPrice;
            multiHandleSliderExtenderTwo.Minimum = Convert.ToInt32(MinimumPrice);
            multiHandle2_2_BoundControl.Text = MaximumPrice;
            multiHandleSliderExtenderTwo.Maximum = Convert.ToInt32(MaximumPrice);
            multiHandleSliderExtenderTwo.ClientState = MinimumPrice + "," + MaximumPrice;          
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
            BindGridView();
            //ddlKabupaten_SelectedIndexChanged(null, null);
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
            BindGridView();
            //ddlKecamatan_SelectedIndexChanged(null, null);
        }

        protected void ddlKecamatan_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPriceRange();
            BindGridView();
        }
        protected void chkFasilitas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strFasilitas = "";
            foreach (ListItem item in chkFasilitas.Items)
            {
                if (item.Selected == true)
                    strFasilitas += item.Value + ",";
            }
            strFasilitas = (strFasilitas == "") ? "" : strFasilitas.Substring(0, strFasilitas.Length - 1);
            Session["Fasilitas"] = strFasilitas;
            BindGridView();
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
            //fasilitas = "";
            //foreach (ListItem item in chkFasilitas.Items)
            //{
            //    if (item.Selected == true)
            //        fasilitas += item.Value + ",";
            //}
            //fasilitas = (fasilitas != "") ? fasilitas.Substring(0, fasilitas.Length - 1) : "";

            //Response.Redirect("/CariLokasi?tipeKos=" + ddlTipeKos.SelectedValue + "&lokasi=" + Server.HtmlEncode(txtSearch.Text) + "&fasilitas=" + fasilitas
            //    + "&jkWkt=" + ddlSatuanHarga.SelectedValue + "&latLng=" + hidLatitude.Value + "," + hidLongitude.Value + "&propinsi=" + ddlPropinsi.SelectedValue
            //    + "&kabupaten=" + ddlKabupaten.SelectedValue + "&kecamatan=" + ddlKecamatan.SelectedValue + "&minimum=" + multiHandle2_1_BoundControl.Text
            //    + "&maximum=" + multiHandle2_2_BoundControl.Text);
        }
        private void BindGridView()
        {
            var provinsi = (ddlPropinsi.SelectedItem.Text == "- Semua - ") ? "" : ddlPropinsi.SelectedItem.Text;
            var kabupaten = (ddlKabupaten.SelectedItem.Text == "- Semua - ") ? "" : ddlKabupaten.SelectedItem.Text;
            var kecamatan = (ddlKecamatan.SelectedItem.Text == "- Semua - ") ? "" : ddlKecamatan.SelectedItem.Text;
            var minimum = Convert.ToInt32(multiHandle2_1_BoundControl.Text);
            var maximum = Convert.ToInt32(multiHandle2_2_BoundControl.Text);
            var satuanHargaId = Convert.ToInt32(ddlSatuanHarga.SelectedValue);
            
            var formKosMin = new FormKosSystem().GetPriceRangeByKecamatan(provinsi, kabupaten, kecamatan, satuanHargaId);

            var MinimumPrice = formKosMin.MinimumPrice.ToString("G0");
            var MaximumPrice = formKosMin.MaximumPrice.ToString("G0");
            multiHandleSliderExtenderTwo.Minimum = Convert.ToInt32(MinimumPrice);
            multiHandleSliderExtenderTwo.Maximum = Convert.ToInt32(MaximumPrice);
            multiHandleSliderExtenderTwo.ClientState = minimum + "," + maximum;
            string fasilitas = Session["Fasilitas"].ToString();

            var tipeKosId = Convert.ToInt32(ddlTipeKos.SelectedValue);
            
            rptListByLoc.DataSource = new FormKosSystem().GetAllFormKosByKecamatanMinMax(provinsi, kabupaten, kecamatan, minimum, maximum, fasilitas, tipeKosId, satuanHargaId);
            rptListByLoc.DataBind();
        }
        protected void lnkSliderChanged_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void multiHandle2_1_BoundControl_TextChanged(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void multiHandle2_2_BoundControl_TextChanged(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void ddlTipeKos_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPriceRange();
            BindGridView();
        }

        protected void ddlSatuanHarga_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPriceRange();
            BindGridView();
        }

    }
}