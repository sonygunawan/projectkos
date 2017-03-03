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
    public partial class DetailKos : System.Web.UI.Page
    {
        private Int64 ID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                chkFasilitas.DataSource = new FasilitasSystem().GetAllFasilitas();
                chkFasilitas.DataTextField = "NamaFasilitas";
                chkFasilitas.DataValueField = "ID";
                chkFasilitas.DataBind();

                chkLingkungan.DataSource = new LingkunganSystem().GetAllLingkungan();
                chkLingkungan.DataTextField = "Nama";
                chkLingkungan.DataValueField = "ID";
                chkLingkungan.DataBind();

                ddlArea.DataSource = new AreaSystem().GetAllArea();
                ddlArea.DataTextField = "Nama";
                ddlArea.DataValueField = "ID";
                ddlArea.DataBind();

                rdlTipeKos.DataSource = new TipeKosSystem().GetAllTipeKos();
                rdlTipeKos.DataTextField = "NamaRdl";
                rdlTipeKos.DataValueField = "ID";
                rdlTipeKos.DataBind();
                rdlTipeKos.SelectedValue = "1";
                rdlPet.SelectedValue = "0";

                ddlMinimumBayarMonth.DataSource = new PaymentSystem().GetAllPaymentBulan();
                ddlMinimumBayarMonth.DataTextField = "Nama";
                ddlMinimumBayarMonth.DataValueField = "ID";
                ddlMinimumBayarMonth.DataBind();
                //if (Request.QueryString["latLng"] != null)
                //{
                //    string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
                //}
                //FormKosData Data = new FormKosData();
                //Data.Kode = new FormKosSystem().GetMaxFormKos();
                //Data.Nama = txtNama.Text;
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    ID = Convert.ToInt64(Request.QueryString["ID"]);
                }
                FormKosData Data = new FormKosSystem().GetAllFormKos(ID)[0];
                lblSisaKamar.Text = (Data.JmlKamar - Data.JmlKamarKosong).ToString();
                lblNama.Text = Data.Nama;
                txtDeskripsi.Text = Data.Deskripsi;
                ddlArea.SelectedValue = Data.AreaID.ToString();
                txtAlamat.Text = Data.Alamat;
                hidLatitude.Value = txtLatitude.Text = Data.Latitude.ToString().Replace(',','.');
                hidLongitude.Value = txtLongitude.Text = Data.Longitude.ToString().Replace(',', '.');
                txtPemilik.Text = Data.NamaPemilik;
                txtAlamatPemilik.Text = Data.AlamatPemilik;
                txtTlpPemilik.Text = Data.KontakPemilik;
                txtNamaPengelola.Text = Data.NamaPengelola;
                txtTlpPengelola.Text = Data.KontakPengelola;
                ddlMinimumBayarMonth.SelectedValue = Data.MinimumBayarMonth.ToString();
                txtMinimumBayarDesc.Text = Data.MinimumBayarDesc;
                //txtJmlKamar.Text = Data.JmlKamar.ToString();
                txtLuasKamar.Text = Data.LuasKamar.ToString().Replace('.', ',');
                rdlTipeKos.SelectedValue = Data.TipeKosID.ToString();
                //txtJmlKamarKosong.Text = Data.JmlKamarKosong.ToString();
                rdlPet.SelectedValue = (Data.PetID == true) ? "1" : "0";
                txtKeteranganLain.Text = Data.Keterangan;

                Data.KosHarga = new FormKosSystem().GetKosHargaByFormID(ID);
                var bayarKos = Data.KosHarga.Where(i => i.SatuanHargaID == 1).ToList();
                if (bayarKos.Count > 0)
                    lblHarian.Text = Data.KosHarga.Where(i => i.SatuanHargaID == 1).ToList()[0].Harga.ToString("N0");
                else
                    lblHarian.Text = "-";

                bayarKos = Data.KosHarga.Where(i => i.SatuanHargaID == 2).ToList();
                if (bayarKos.Count > 0)
                    lblMingguan.Text = Data.KosHarga.Where(i => i.SatuanHargaID == 2).ToList()[0].Harga.ToString("N0");
                else
                    lblMingguan.Text = "-";

                bayarKos = Data.KosHarga.Where(i => i.SatuanHargaID == 3).ToList();
                if (bayarKos.Count > 0)
                    lblBulanan.Text = Data.KosHarga.Where(i => i.SatuanHargaID == 3).ToList()[0].Harga.ToString("N0");
                else
                    lblBulanan.Text = "-";

                bayarKos = Data.KosHarga.Where(i => i.SatuanHargaID == 4).ToList();
                if (bayarKos.Count > 0)
                    lblTahunan.Text = Data.KosHarga.Where(i => i.SatuanHargaID == 4).ToList()[0].Harga.ToString("N0");
                else
                    lblTahunan.Text = "-";

                Data.KosFasilitas = new FormKosSystem().GetKosFasilitasByFormID(ID);
                Data.KosLingkungan = new FormKosSystem().GetKosLingkunganByFormID(ID);
                chkFasilitas.DataSource = Data.KosFasilitas;
                chkFasilitas.DataValueField = "FormKosFasilitasID";
                chkFasilitas.DataTextField = "NamaFasilitas";
                chkFasilitas.DataBind();

                foreach (ListItem item in chkFasilitas.Items)
                {
                    var dataFasi = Data.KosFasilitas.Where(i => i.FormKosFasilitasID == Convert.ToInt32(item.Value) && i.Status == 1).ToList();
                    if (dataFasi.Count > 0 )
                        item.Selected = true;
                }

                chkLingkungan.DataSource = Data.KosLingkungan;
                chkLingkungan.DataValueField = "FormKosLingkunganID";
                chkLingkungan.DataTextField = "NamaLingkungan";
                chkLingkungan.DataBind();

                foreach (ListItem item in chkLingkungan.Items)
                {
                    var dataLink = Data.KosLingkungan.Where(i => i.FormKosLingkunganID == Convert.ToInt32(item.Value) && i.Status == 1).ToList();
                    if (dataLink.Count > 0)
                        item.Selected = true;
                }

                if (Session["UserID"] != null)
                {
                    //lblNamaPengelola.Text = Data.NamaPengelola;
                    //lblNmrTlpnPengelola.Text = Data.KontakPengelola;
                    //btnBook.Visible = false;
                    bool favVal = new FavoriteSystem().GetFormKosFavorit(ID, Convert.ToInt64(Session["UserID"]));
                    btnFavorit.Enabled = (favVal == true) ? false : true;
                }
                new FormKosSystem().UpdateFormKosView(ID);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Uri halaman = Request.UrlReferrer;
                //Response.Redirect("/Login?Link=" + Server.HtmlEncode(halaman.PathAndQuery));
            }
        }

        protected void btnFavorit_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Uri halaman = Request.UrlReferrer;
                Response.Redirect("/Login?Link=" + Server.HtmlEncode(halaman.PathAndQuery));
            }
            else
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    ID = Convert.ToInt64(Request.QueryString["ID"]);
                }
                bool retVal = new FavoriteSystem().InsertFormKosFavorit(ID, Convert.ToInt64(Session["UserID"]));
                btnFavorit.Enabled = (retVal == true) ? false : true;
            }
        }
    }
}