using LihatKos.BusinessFacade;
using LihatKos.Common;
using System;
using System.Collections.Generic;
using System.IO;
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

                //ddlArea.DataSource = new AreaSystem().GetAllArea();
                //ddlArea.DataTextField = "Nama";
                //ddlArea.DataValueField = "ID";
                //ddlArea.DataBind();

                rdlTipeKos.DataSource = new TipeKosSystem().GetAllTipeKos();
                rdlTipeKos.DataTextField = "NamaRdl";
                rdlTipeKos.DataValueField = "ID";
                rdlTipeKos.DataBind();
                rdlTipeKos.SelectedValue = "1";
                rdlPet.SelectedValue = "0";

                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    ID = Convert.ToInt64(Request.QueryString["ID"]);
                }
                FormKosData Data = new FormKosSystem().GetAllFormKos(ID,"")[0];
                lblSisaKamar.Text = (Data.JmlKamar - Data.JmlKamarKosong).ToString();
                lblNama.Text = Data.Nama;
                txtDeskripsi.Text = Data.Deskripsi;
                txtLokasi.Text = Data.Alamat;
                //ddlArea.SelectedValue = Data.AreaID.ToString();
                //txtAlamat.Text = Data.Alamat;
                hidLatitude.Value = txtLatitude.Text = Data.Latitude.ToString().Replace(',','.');
                hidLongitude.Value = txtLongitude.Text = Data.Longitude.ToString().Replace(',', '.');
                txtPemilik.Text = Data.NamaPemilik;
                //txtAlamatPemilik.Text = Data.AlamatPemilik;
                //txtTlpPemilik.Text = Data.KontakPemilik;
                //txtNamaPengelola.Text = Data.NamaPengelola;
                //txtTlpPengelola.Text = Data.KontakPengelola;
                //ddlMinimumBayarMonth.SelectedValue = Data.MinimumBayarMonth.ToString();
                //txtMinimumBayarDesc.Text = Data.MinimumBayarDesc;
                //txtJmlKamar.Text = Data.JmlKamar.ToString();
                //txtLuasKamar.Text = Data.LuasKamar.ToString().Replace('.', ',');
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
                Data.KosTelepon = new FormKosSystem().GetKosTeleponByFormID(ID);
                Data.KosKamar = new FormKosSystem().GetKosKamarByFormID(ID);

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
                //KosTelepon 
                //gvKosTelepon.DataSource = Data.KosTelepon;
                //gvKosTelepon.DataBind();
                //KosKamar
                //gvKamarKos.DataSource = Data.KosKamar;
                //gvKamarKos.DataBind();

                if (Session["UserID"] != null)
                {
                    bool favVal = new FavoriteSystem().GetFormKosFavorit(ID, Convert.ToInt64(Session["UserID"]));
                    //btnFavorit.Enabled = (favVal == true) ? false : true;
                }
                rptGambarKos.DataSource = AmbilListGambar(Data.UserID,ID);
                rptGambarKos.DataBind();
                new FormKosSystem().UpdateFormKosView(ID);

            }
            LoadPage();
        }
        private void LoadPage()
        {

            if (Session["UserID"] == null)
            {
                //liTambahKos.Visible = false;
                //liLogin.Visible = true;
                //liRegister.Visible = true;
                pWelcome.Visible = false;
                liAdmin.Visible = false;

                //MPELogin.Show();
            }
            else
            {
                //liTambahKos.Visible = true;
                pWelcome.Visible = true;
                var user = new UserSystem().GetUsers(Convert.ToInt64(Session["UserID"]))[0];
                if (user.TipeUserID == 1 || user.TipeUserID == 2)
                    liAdmin.Visible = true;
                else
                    liAdmin.Visible = false;

                litUsername.Text = user.UserName;

                //MPELogin.Hide();
            }
        }
        private List<string> AmbilListGambar(Int64 UserID, Int64 ID)
        {
            string StrUserID = "User-" + UserID.ToString();
            string StrKosID = "Kos-" + ID.ToString();
            List<string> listStr = new List<string>();
            var remPath = System.Web.Hosting.HostingEnvironment.MapPath("~/"); //Path.GetFullPath("/");
            string[] FolderList = Directory.GetDirectories(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID));
            int CountFolder = FolderList.Count();
            //string[] FolderList = Directory.GetFiles(MapPath("~/UploadedImage/User-" + UserID + "/Kos-" + ID.ToString() + "/"));
            foreach(string arrItem in FolderList)
            {
                string[] files = Directory.GetFiles(arrItem);
                foreach (string file in files)
                {
                    //string newFolder = "folder-" + (CountFolder + 1).ToString();
                    if (file.Contains("849.jpg"))
                    {
                        var arr = file.Replace(remPath, "");
                        listStr.Add(arr);
                    }
                }
            }
            return listStr;
        }

        private void LoadDropDownTelepon(ref DropDownList ddlPhone)
        {
            ddlPhone.Items.Add(new ListItem("Ponsel", "1"));
            ddlPhone.Items.Add(new ListItem("Rumah", "2"));
            ddlPhone.Items.Add(new ListItem("Kantor", "3"));
            ddlPhone.SelectedIndex = 0;
        }
        protected void gvKosTelepon_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                KosTeleponData data = (KosTeleponData)e.Row.DataItem;
                e.Row.Cells[0].Text = data.OrderID.ToString();
                TextBox txtValue = (TextBox)e.Row.Cells[1].FindControl("txtValue");
                txtValue.Text = data.Value;
                DropDownList ddlPhoneID = (DropDownList)e.Row.Cells[2].FindControl("ddlPhoneID");
                LoadDropDownTelepon(ref ddlPhoneID);
                ddlPhoneID.SelectedValue = data.PhoneID.ToString();

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
                //btnFavorit.Enabled = (retVal == true) ? false : true;
            }
        }

        protected void rptGambarKos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string DataStr = (string)e.Item.DataItem;
                
                Image imgKos = (Image)e.Item.FindControl("imgKos");
                imgKos.Width = 600;
                imgKos.Height = 400;
                imgKos.ImageUrl = DataStr;
                //imgKos.Attributes.Add("Style", "width:100%;");
            }
        }

        protected void gvKamarKos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                KosKamarData data = (KosKamarData)e.Row.DataItem;
                TextBox txtLuas = (TextBox)e.Row.Cells[1].FindControl("txtLuas");
                RadioButtonList rblFasilitas = (RadioButtonList)e.Row.Cells[2].FindControl("rblFasilitas");
                TextBox txtJmlKamar = (TextBox)e.Row.Cells[3].FindControl("txtJmlKamar");
                TextBox txtKamarKosong = (TextBox)e.Row.Cells[4].FindControl("txtKamarKosong");
                txtLuas.Text = data.Luas;
                rblFasilitas.SelectedValue = data.FasilitasKamar.ToString();
                txtJmlKamar.Text = data.JmlKamar.ToString();
                txtKamarKosong.Text = data.KamarKosong.ToString();
            }
        }

        protected void rptImageKos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}