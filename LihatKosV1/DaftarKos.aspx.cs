﻿using AjaxControlToolkit;
using LihatKos.BusinessFacade;
using LihatKos.Common;
using LihatKos.Web.Controls;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class DaftarKos : System.Web.UI.Page
    {
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
                if (Request.QueryString["ID"] == null)
                {
                    lblTitle.Text = "Form Pendaftaran LihatKos";
                    rdlTipeKos.SelectedValue = "1";
                    rdlPet.SelectedValue = "0";

                    //ddlMinimumBayarMonth.DataSource = new PaymentSystem().GetAllPaymentBulan();
                    //ddlMinimumBayarMonth.DataTextField = "Nama";
                    //ddlMinimumBayarMonth.DataValueField = "ID";
                    //ddlMinimumBayarMonth.DataBind();

                    ViewState["CurrentTeleponList"] = null;
                    SetInitialTeleponRow();

                    BindGridHarga();

                    ViewState["CurrentKamarList"] = null;
                    SetInitialKamarRow();
                }
                else
                {
                    var ID = Request.QueryString["ID"].ToString();
                    lblTitle.Text = "Form Edit Kos";
                    LoadFormKosByID(Convert.ToInt64(ID));
                }
            }
            
            //ClientScript.RegisterStartupScript(GetType(), "checkboxBeautify",
            //      "$('input[id=*chkFasilitas]').buttonset(); " +
            //      "$('input[id=*chkLingkungan]').buttonset(); ", true);

        }

        private void LoadFormKosByID(long ID)
        {
            var formKos = new FormKosSystem().GetAllFormKos(ID);
            txtNama.Text = formKos[0].Nama;
            txtDeskripsi.Text = formKos[0].Deskripsi;
            txtLokasi.Text = formKos[0].Alamat;
            txtLatitude.Text = formKos[0].Latitude.ToString().Replace(',','.');
            txtLongitude.Text = formKos[0].Longitude.ToString().Replace(',', '.');
            txtPemilik.Text = formKos[0].NamaPemilik;

            //telepon
            var kosTelepon = new FormKosSystem().GetKosTeleponByFormID(ID);
            ViewState["CurrentTeleponList"] = kosTelepon;
            gvKosTelepon.DataSource = kosTelepon;
            gvKosTelepon.DataBind();
            //harga
            var kosHarga = GenerateHarga();
            var inputKosHarga = new FormKosSystem().GetKosHargaByFormID(ID);
            foreach (var kosHargaTemp in kosHarga)
            {
                var satuanHargaId = kosHargaTemp.SatuanHargaID;
                var inputHarga = from hrg in inputKosHarga
                                         where hrg.SatuanHargaID == satuanHargaId
                                         select hrg;
                //default
                kosHargaTemp.isChecked = false;
                if (inputHarga.ToList().Count > 0)
                {
                    kosHargaTemp.Harga = inputHarga.ToList()[0].Harga;
                    kosHargaTemp.isChecked = true;
                }
            }
            gvKosHarga.DataSource = kosHarga; 
            gvKosHarga.DataBind();
            //kamar
            var kosKamar = new FormKosSystem().GetKosKamarByFormID(ID);
            ViewState["CurrentKamarList"] = kosKamar;
            gvKamarKos.DataSource = kosKamar;
            gvKamarKos.DataBind();
            //TipeKos
            rdlTipeKos.SelectedValue = formKos[0].TipeKosID.ToString();
            //Pet
            rdlPet.SelectedValue = (formKos[0].PetID == true) ? "1" : "0";
            //fasilitas
            var fasilitas = new FormKosSystem().GetKosFasilitasByFormID(ID);
            chkFasilitas.DataSource = fasilitas;
            chkFasilitas.DataValueField = "FormKosFasilitasID";
            chkFasilitas.DataTextField = "NamaFasilitas";
            chkFasilitas.DataBind();
            foreach (ListItem item in chkFasilitas.Items)
            {
                var dataFasi = fasilitas.Where(i => i.FormKosFasilitasID == Convert.ToInt32(item.Value) && i.Status == 1).ToList();
                if (dataFasi.Count > 0 )
                    item.Selected = true;
            }
            //lingkungan
            var lingkungan = new FormKosSystem().GetKosLingkunganByFormID(ID);
            chkLingkungan.DataSource = lingkungan;
            chkLingkungan.DataValueField = "FormKosLingkunganID";
            chkLingkungan.DataTextField = "NamaLingkungan";
            chkLingkungan.DataBind();
            foreach (ListItem item in chkLingkungan.Items)
            {
                var dataLink = lingkungan.Where(i => i.FormKosLingkunganID == Convert.ToInt32(item.Value) && i.Status == 1).ToList();
                if (dataLink.Count > 0)
                    item.Selected = true;
            }
            //Keterangan
            txtKeteranganLain.Text = formKos[0].Keterangan;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            long retFormID = 0;
            if (lblTitle.Text != "Form Edit Kos")
            {
                FormKosData Data = new FormKosData();
                Data.Kode = new FormKosSystem().GetMaxFormKos();
                Data.Nama = txtNama.Text;
                Data.Deskripsi = txtDeskripsi.Text;
                Data.Alamat = txtLokasi.Text;
                Data.Latitude = Convert.ToDecimal(Convert.ToDecimal(hidLatitude.Value.Replace('.', ',')).ToString("N6"));
                Data.Longitude = Convert.ToDecimal(Convert.ToDecimal(hidLongitude.Value.Replace('.', ',')).ToString("N6"));
                Data.NamaPemilik = txtPemilik.Text;
                Data.TipeKosID = Convert.ToInt32(rdlTipeKos.SelectedValue);
                Data.PetID = (rdlPet.SelectedValue == "1") ? true : false;
                Data.Keterangan = txtKeteranganLain.Text;

                Int64 UserID = Convert.ToInt64(Session["UserID"]);
                Data.UserID = UserID;
                //Wilayah
                Data.NamaProvinsi = hidProvinsi.Value; 
                Data.NamaKabupaten = hidKabupaten.Value;
                Data.NamaKecamatan = hidKecamatan.Value;
                Data.NamaKelurahan = hidKelurahan.Value;

                List<KosTeleponData> DetailsTelepon = new List<KosTeleponData>();
                foreach (GridViewRow item in gvKosTelepon.Rows)
                {
                    KosTeleponData DetTel = new KosTeleponData();
                    DropDownList ddlPhoneID = (DropDownList)item.Cells[2].FindControl("ddlPhoneID");
                    TextBox txtValue = (TextBox)item.Cells[1].FindControl("txtValue");
                    DetTel.OrderID = Convert.ToInt32(item.Cells[0].Text);
                    DetTel.PhoneID = Convert.ToInt32(ddlPhoneID.SelectedValue);
                    DetTel.Value = txtValue.Text;
                    DetailsTelepon.Add(DetTel);
                }

                List<KosFasilitasData> DetailsFasi = new List<KosFasilitasData>();
                foreach (ListItem item in chkFasilitas.Items)
                {
                    KosFasilitasData DetFasi = new KosFasilitasData();
                    DetFasi.FormKosFasilitasID = Convert.ToInt32(item.Value);
                    if (item.Selected == true)
                        DetFasi.Status = 1;
                    else
                        DetFasi.Status = 0;
                    DetailsFasi.Add(DetFasi);
                }

                List<KosLingkunganData> DetailsLink = new List<KosLingkunganData>();
                foreach (ListItem item in chkLingkungan.Items)
                {
                    KosLingkunganData DetLink = new KosLingkunganData();
                    DetLink.FormKosLingkunganID = Convert.ToInt32(item.Value);
                    if (item.Selected == true)
                        DetLink.Status = 1;
                    else
                        DetLink.Status = 0;
                    DetailsLink.Add(DetLink);
                }
                //List
                List<KosHargaData> DetailsHarga = new List<KosHargaData>();
                foreach (GridViewRow item in gvKosHarga.Rows)
                {
                    KosHargaData DetHrg = new KosHargaData();
                    var txtHarga = (TextBox)item.Cells[1].FindControl("txtHarga");
                    var ddlMinimumBayar = (DropDownList)item.Cells[4].FindControl("ddlMinimumBayar");
                    DetHrg.SatuanHargaID = Convert.ToInt32(item.Cells[5].Text);
                    DetHrg.Harga = (txtHarga.Text != "") ? Convert.ToDecimal(txtHarga.Text) : 0;
                    DetHrg.MinimumBayar = Convert.ToInt32(ddlMinimumBayar.SelectedValue);
                    DetailsHarga.Add(DetHrg);
                }
                //List Kamar
                List<KosKamarData> DetailsKamar = new List<KosKamarData>();
                foreach (GridViewRow item in gvKamarKos.Rows)
                {
                    KosKamarData DetKam = new KosKamarData();
                    var txtLuas = (TextBox)item.Cells[1].FindControl("txtLuas");
                    var rblFasilitas = (RadioButtonList)item.Cells[2].FindControl("rblFasilitas");
                    var txtJmlKamar = (TextBox)item.Cells[3].FindControl("txtJmlKamar");
                    var txtKamarKosong = (TextBox)item.Cells[4].FindControl("txtKamarKosong");
                    DetKam.OrderID = Convert.ToInt32(item.Cells[0].Text);
                    DetKam.Luas = txtLuas.Text;
                    DetKam.FasilitasKamar = Convert.ToInt32(rblFasilitas.SelectedValue);
                    DetKam.JmlKamar = Convert.ToInt32(txtJmlKamar.Text == "" ? "0" : txtJmlKamar.Text);
                    DetKam.KamarKosong = Convert.ToInt32(txtKamarKosong.Text == "" ? "0" : txtKamarKosong.Text);
                    DetailsKamar.Add(DetKam);
                }
                //Add to List
                Data.KosHarga = DetailsHarga;
                Data.KosFasilitas = DetailsFasi;
                Data.KosLingkungan = DetailsLink;
                Data.KosTelepon = DetailsTelepon;
                Data.KosKamar = DetailsKamar;
                retFormID = new FormKosSystem().InsertFormKosLengkap(Data);
            }
            else
            {
                var ID = Request.QueryString["ID"].ToString();
                FormKosData Data = new FormKosData();
                Data.ID = Convert.ToInt64(ID);
                Data.Nama = txtNama.Text;
                Data.Deskripsi = txtDeskripsi.Text;
                Data.Alamat = txtLokasi.Text;
                Data.Latitude = Convert.ToDecimal(Convert.ToDecimal(txtLatitude.Text.Replace('.', ',')).ToString("N6"));
                Data.Longitude = Convert.ToDecimal(Convert.ToDecimal(txtLongitude.Text.Replace('.', ',')).ToString("N6"));
                Data.NamaPemilik = txtPemilik.Text;
                Data.TipeKosID = Convert.ToInt32(rdlTipeKos.SelectedValue);
                Data.PetID = (rdlPet.SelectedValue == "1") ? true : false;
                Data.Keterangan = txtKeteranganLain.Text;

                Int64 UserID = Convert.ToInt64(Session["UserID"]);
                Data.UserID = UserID;
                //Wilayah
                Data.NamaProvinsi = hidProvinsi.Value;
                Data.NamaKabupaten = hidKabupaten.Value;
                Data.NamaKecamatan = hidKecamatan.Value;
                Data.NamaKelurahan = hidKelurahan.Value;

                List<KosTeleponData> DetailsTelepon = new List<KosTeleponData>();
                foreach (GridViewRow item in gvKosTelepon.Rows)
                {
                    KosTeleponData DetTel = new KosTeleponData();
                    DropDownList ddlPhoneID = (DropDownList)item.Cells[2].FindControl("ddlPhoneID");
                    TextBox txtValue = (TextBox)item.Cells[1].FindControl("txtValue");
                    DetTel.OrderID = Convert.ToInt32(item.Cells[0].Text);
                    DetTel.PhoneID = Convert.ToInt32(ddlPhoneID.SelectedValue);
                    DetTel.Value = txtValue.Text;
                    DetailsTelepon.Add(DetTel);
                }

                List<KosFasilitasData> DetailsFasi = new List<KosFasilitasData>();
                foreach (ListItem item in chkFasilitas.Items)
                {
                    KosFasilitasData DetFasi = new KosFasilitasData();
                    DetFasi.FormKosFasilitasID = Convert.ToInt32(item.Value);
                    if (item.Selected == true)
                        DetFasi.Status = 1;
                    else
                        DetFasi.Status = 0;
                    DetailsFasi.Add(DetFasi);
                }

                List<KosLingkunganData> DetailsLink = new List<KosLingkunganData>();
                foreach (ListItem item in chkLingkungan.Items)
                {
                    KosLingkunganData DetLink = new KosLingkunganData();
                    DetLink.FormKosLingkunganID = Convert.ToInt32(item.Value);
                    if (item.Selected == true)
                        DetLink.Status = 1;
                    else
                        DetLink.Status = 0;
                    DetailsLink.Add(DetLink);
                }
                //List
                List<KosHargaData> DetailsHarga = new List<KosHargaData>();
                foreach (GridViewRow item in gvKosHarga.Rows)
                {
                    KosHargaData DetHrg = new KosHargaData();
                    var txtHarga = (TextBox)item.Cells[1].FindControl("txtHarga");
                    var ddlMinimumBayar = (DropDownList)item.Cells[4].FindControl("ddlMinimumBayar");
                    DetHrg.SatuanHargaID = Convert.ToInt32(item.Cells[5].Text);
                    DetHrg.Harga = (txtHarga.Text != "") ? Convert.ToDecimal(txtHarga.Text) : 0;
                    DetHrg.MinimumBayar = Convert.ToInt32(ddlMinimumBayar.SelectedValue);
                    DetailsHarga.Add(DetHrg);
                }
                //List Kamar
                List<KosKamarData> DetailsKamar = new List<KosKamarData>();
                foreach (GridViewRow item in gvKamarKos.Rows)
                {
                    KosKamarData DetKam = new KosKamarData();
                    var txtLuas = (TextBox)item.Cells[1].FindControl("txtLuas");
                    var rblFasilitas = (RadioButtonList)item.Cells[2].FindControl("rblFasilitas");
                    var txtJmlKamar = (TextBox)item.Cells[3].FindControl("txtJmlKamar");
                    var txtKamarKosong = (TextBox)item.Cells[4].FindControl("txtKamarKosong");
                    DetKam.OrderID = Convert.ToInt32(item.Cells[0].Text);
                    DetKam.Luas = txtLuas.Text;
                    DetKam.FasilitasKamar = Convert.ToInt32(rblFasilitas.SelectedValue);
                    DetKam.JmlKamar = Convert.ToInt32(txtJmlKamar.Text == "" ? "0" : txtJmlKamar.Text);
                    DetKam.KamarKosong = Convert.ToInt32(txtKamarKosong.Text == "" ? "0" : txtKamarKosong.Text);
                    DetailsKamar.Add(DetKam);
                }
                //Add to List
                Data.KosHarga = DetailsHarga;
                Data.KosFasilitas = DetailsFasi;
                Data.KosLingkungan = DetailsLink;
                Data.KosTelepon = DetailsTelepon;
                Data.KosKamar = DetailsKamar;
                retFormID = new FormKosSystem().UpdateFormKosLengkap(Data);
            }

            Response.Redirect("/UploadFoto?ID=" + retFormID.ToString());
        }

        #region Telepon
        private void SetInitialTeleponRow()
        { 
            //List<KosHargaData> DetailsHarga = new List<KosHargaData>();
            var kosTels = new List<KosTeleponData>();
            var data = new KosTeleponData();
            data.FormKosID = 0;
            data.OrderID = 1; data.PhoneID = 1;
            data.Value = string.Empty;
            data.Deskripsi = string.Empty;
            kosTels.Add(data);

            ViewState["CurrentTeleponList"] = kosTels;
            gvKosTelepon.DataSource = kosTels;
            gvKosTelepon.DataBind();
        }
        private void BindTeleponGrid()
        {
            var kosTels = ViewState["CurrentTeleponList"] as List<KosTeleponData>;
            int rowCount = 1;
            foreach (var data in kosTels)
            {
                data.OrderID = rowCount;
                rowCount += 1;
            }
            gvKosTelepon.DataSource = kosTels; //ViewState["CurrentTeleponList"] as List<KosTeleponData>;
            gvKosTelepon.DataBind();
        }

        private void AddNewRowToTeleponGrid()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTeleponList"] != null)
            {
                var kosTels = (List<KosTeleponData>)ViewState["CurrentTeleponList"];
                if (kosTels.Count > 0)
                {
                    foreach (var Data in kosTels)
                    {
                        TextBox txtValue = (TextBox)gvKosTelepon.Rows[rowIndex].Cells[1].FindControl("txtValue");
                        Data.Value = txtValue.Text;
                        DropDownList ddlPhoneID = (DropDownList)gvKosTelepon.Rows[rowIndex].Cells[2].FindControl("ddlPhoneID");
                        Data.PhoneID = Convert.ToInt32(ddlPhoneID.SelectedValue);
                        rowIndex++;
                    }
                }
                var countRow = kosTels.Count;
                var data = new KosTeleponData();
                data.FormKosID = 0;
                data.OrderID = countRow + 1; //data.PhoneID = 2;
                data.Value = string.Empty;
                data.Deskripsi = string.Empty;
                kosTels.Add(data);

                ViewState["CurrentTeleponList"] = kosTels;
                gvKosTelepon.DataSource = kosTels;
                gvKosTelepon.DataBind();
            }
            else
                ValidationError.Display("ViewState is null.");
        }
        private void SaveToViewState()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTeleponList"] != null)
            {
                var kosTels = (List<KosTeleponData>)ViewState["CurrentTeleponList"];
                if (kosTels.Count > 0)
                {
                    foreach (var Data in kosTels)
                    {
                        TextBox txtValue = (TextBox)gvKosTelepon.Rows[rowIndex].Cells[1].FindControl("txtValue");
                        Data.Value = txtValue.Text;
                        DropDownList ddlPhoneID = (DropDownList)gvKosTelepon.Rows[rowIndex].Cells[2].FindControl("ddlPhoneID");
                        Data.PhoneID = Convert.ToInt32(ddlPhoneID.SelectedValue);
                        rowIndex++;
                    }
                }
            }

        }
        private List<ListItem> LoadDropDownTelepon()
        {

            List<ListItem> items = new List<ListItem>();
            items.Add(new ListItem("Ponsel", "1"));
            items.Add(new ListItem("Rumah", "2"));
            items.Add(new ListItem("Kantor", "3"));

            return items;
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

        protected void imgBtnPlus_Click(object sender, ImageClickEventArgs e)
        {
            AddNewRowToTeleponGrid();
        }
        protected void gvKosTelepon_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SaveToViewState();
            Int32 idx = Convert.ToInt32(e.RowIndex);
            var datas = (List<KosTeleponData>)ViewState["CurrentTeleponList"];
            datas.RemoveAt(idx);
            ViewState["CurrentTeleponList"] = datas;
            BindTeleponGrid();
        }
        #endregion 

        #region Harga
        private void BindGridHarga()
        {
            var kosHarga = GenerateHarga();
            gvKosHarga.DataSource = kosHarga;
            gvKosHarga.DataBind();
        }
        private List<KosHargaData> GenerateHarga()
        {
            var KosHarga = new List<KosHargaData>();
            //1.
            var Data = new KosHargaData();
            Data.SatuanHargaID = 1;
            Data.isChecked = false;
            Data.perText = "per Hari";
            KosHarga.Add(Data);
            //2. 
            Data = new KosHargaData();
            Data.SatuanHargaID = 2;
            Data.isChecked = false;
            Data.perText = "per Minggu";
            KosHarga.Add(Data);
            //3.
            Data = new KosHargaData();
            Data.SatuanHargaID = 3;
            Data.isChecked = false;
            Data.perText = "per Bulan";
            KosHarga.Add(Data);
            //4.
            Data = new KosHargaData();
            Data.SatuanHargaID = 4;
            Data.isChecked = false;
            Data.perText = "per Tahun";
            KosHarga.Add(Data);

            return KosHarga;
            ////1. 
            //List<KosHargaData> DetailsHarga = new List<KosHargaData>();
            //KosHargaData DetHarga = new KosHargaData();
            //DetHarga.Harga = (txtHarian.Text != "") ? Convert.ToDecimal(txtHarian.Text) : 0;
            //DetHarga.SatuanHargaID = 1;
            //DetailsHarga.Add(DetHarga);

            ////2.
            //DetHarga = new KosHargaData();
            //DetHarga.Harga = (txtMingguan.Text != "") ? Convert.ToDecimal(txtMingguan.Text) : 0;
            //DetHarga.SatuanHargaID = 2;
            //DetailsHarga.Add(DetHarga);

            ////3.
            //DetHarga = new KosHargaData();
            //DetHarga.Harga =  (txtBulanan.Text != "") ? Convert.ToDecimal(txtBulanan.Text) : 0;
            //DetHarga.SatuanHargaID = 3;
            //DetailsHarga.Add(DetHarga);

            ////4.
            //DetHarga = new KosHargaData();
            //DetHarga.Harga =  (txtTahunan.Text != "") ? Convert.ToDecimal(txtTahunan.Text) : 0;
            //DetHarga.SatuanHargaID = 4;
            //DetailsHarga.Add(DetHarga);
            
        }
        protected void gvKosHarga_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                KosHargaData data = (KosHargaData)e.Row.DataItem;
                CheckBox chkIsChecked = (CheckBox)e.Row.Cells[0].FindControl("chkIsChecked");
                TextBox txtHarga = (TextBox)e.Row.Cells[1].FindControl("txtHarga");
                DropDownList ddlMinimumBayar = (DropDownList)e.Row.Cells[4].FindControl("ddlMinimumBayar");
                //isChecked.Enabled = tr
                LoadDropDownHarga(data.SatuanHargaID, ref ddlMinimumBayar);
                ddlMinimumBayar.SelectedValue = data.MinimumBayar.ToString();
                if (data.Harga > 0)
                {
                    chkIsChecked.Checked = data.isChecked;
                    txtHarga.Text = data.Harga.ToString("N0");
                    ddlMinimumBayar.SelectedValue = data.MinimumBayar.ToString();

                }
                if (chkIsChecked.Checked == false)
                {
                    txtHarga.Text = "";
                    txtHarga.Enabled = false;
                    ddlMinimumBayar.SelectedValue = "1";
                    ddlMinimumBayar.Enabled = false;
                    ddlMinimumBayar.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBE4");
                }

            }
        }

        private void LoadDropDownHarga(int SatuanHargaID, ref DropDownList ddlMinimumBayar)
        {
            int countItems = 0;
            switch (SatuanHargaID)
            {
                case 1:
                    {
                        countItems = 120;
                    }
                    break;
                case 2:
                    {
                        countItems = 10;
                    }
                    break;
                case 3:
                    {
                        countItems = 24;
                    }
                    break;
                case 4:
                    {
                        countItems = 10;
                    }
                    break;
                default:
                    break;
            }

            for (int i = 1; i<= countItems; i++)
            {
                ddlMinimumBayar.Items.Add(i.ToString());
            }
        }

        protected void chkIsChecked_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((Control)sender).NamingContainer;
            var txtHarga = (TextBox)row.FindControl("txtHarga");
            var ddlMinimumBayar = (DropDownList)row.FindControl("ddlMinimumBayar");
                
            var chkIsChecked = (CheckBox)row.FindControl("chkIsChecked");
            if (chkIsChecked.Checked)
            {
                txtHarga.Enabled = true;
                ddlMinimumBayar.Enabled = true;
                ddlMinimumBayar.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
            }
            else
            {
                txtHarga.Enabled = false;
                txtHarga.Text = "";
                ddlMinimumBayar.Enabled = false;
                ddlMinimumBayar.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBE4");
                ddlMinimumBayar.SelectedIndex = 0;
            }
        }

        //protected void gvKosHarga_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    gvKosHarga.EditIndex = e.NewEditIndex;
        //    BindGridHarga();
        //}
        //protected void gvKosHarga_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    gvKosHarga.EditIndex = -1;
        //    BindGridHarga();
        //}
        #endregion 

        #region Kamar
        private void SetInitialKamarRow()
        {
            //List<KosHargaData> DetailsHarga = new List<KosHargaData>();
            var kosKams = new List<KosKamarData>();
            var data = new KosKamarData();
            data.FormKosID = 0;
            data.OrderID = 1;
            data.FasilitasKamar = 2;
            //data.JmlKamar = 0;
            //data.KamarKosong = 0;
            data.Luas = "";
            kosKams.Add(data);

            ViewState["CurrentKamarList"] = kosKams;
            gvKamarKos.DataSource = kosKams;
            gvKamarKos.DataBind();
        }
        private void AddNewRowToKamarGrid()
        {
            int rowIndex = 0;
            if (ViewState["CurrentKamarList"] != null)
            {
                var kosKams = (List<KosKamarData>)ViewState["CurrentKamarList"];
                if (kosKams.Count > 0)
                {
                    foreach (var Data in kosKams)
                    {
                        TextBox txtLuas = (TextBox)gvKamarKos.Rows[rowIndex].Cells[1].FindControl("txtLuas");
                        RadioButtonList rblFasilitas = (RadioButtonList)gvKamarKos.Rows[rowIndex].Cells[2].FindControl("rblFasilitas");
                        TextBox txtJmlKamar = (TextBox)gvKamarKos.Rows[rowIndex].Cells[3].FindControl("txtJmlKamar");
                        TextBox txtKamarKosong = (TextBox)gvKamarKos.Rows[rowIndex].Cells[4].FindControl("txtKamarKosong");

                        Data.Luas = txtLuas.Text;
                        Data.FasilitasKamar = Convert.ToInt32(rblFasilitas.SelectedValue);
                        Data.JmlKamar = Convert.ToInt32(txtJmlKamar.Text == "" ? "0" : txtJmlKamar.Text);
                        Data.KamarKosong = Convert.ToInt32(txtKamarKosong.Text == "" ? "0" : txtKamarKosong.Text);
                        rowIndex++;
                    }
                }
                var countRow = kosKams.Count;
                var data = new KosKamarData();
                data.FormKosID = 0;
                data.OrderID = countRow + 1;
                data.FasilitasKamar = 2;
                data.Luas = string.Empty;
                kosKams.Add(data);

                ViewState["CurrentKamarList"] = kosKams;
                gvKamarKos.DataSource = kosKams;
                gvKamarKos.DataBind();
            }
            else
                ValidationError.Display("ViewState is null.");
        }
        private void SaveKamarToViewState()
        {
            int rowIndex = 0;
            if (ViewState["CurrentKamarList"] != null)
            {
                var kosKams = (List<KosKamarData>)ViewState["CurrentKamarList"];
                if (kosKams.Count > 0)
                {
                    foreach (var Data in kosKams)
                    {
                        TextBox txtLuas = (TextBox)gvKamarKos.Rows[rowIndex].Cells[1].FindControl("txtLuas");
                        RadioButtonList rblFasilitas = (RadioButtonList)gvKamarKos.Rows[rowIndex].Cells[2].FindControl("rblFasilitas");
                        TextBox txtJmlKamar = (TextBox)gvKamarKos.Rows[rowIndex].Cells[3].FindControl("txtJmlKamar");
                        TextBox txtKamarKosong = (TextBox)gvKamarKos.Rows[rowIndex].Cells[4].FindControl("txtKamarKosong");

                        Data.Luas = txtLuas.Text;
                        Data.FasilitasKamar = Convert.ToInt32(rblFasilitas.SelectedValue);
                        Data.JmlKamar = Convert.ToInt32(txtJmlKamar.Text == "" ? "0" : txtJmlKamar.Text);
                        Data.KamarKosong = Convert.ToInt32(txtKamarKosong.Text == "" ? "0" : txtKamarKosong.Text);
                        rowIndex++;
                    }
                }
            }

        }
        private void BindKamarGrid()
        {
            var kosKams = ViewState["CurrentKamarList"] as List<KosKamarData>;
            int rowCount = 1;
            foreach (var data in kosKams)
            {
                data.OrderID = rowCount;
                rowCount += 1;
            }
            gvKamarKos.DataSource = kosKams; //ViewState["CurrentKamarList"] as List<KosKamarData>;
            gvKamarKos.DataBind();
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

        protected void imgBtnKamarPlus_Click(object sender, ImageClickEventArgs e)
        {
            AddNewRowToKamarGrid();
        }

        protected void gvKamarKos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SaveKamarToViewState();
            Int32 idx = Convert.ToInt32(e.RowIndex);
            var datas = (List<KosKamarData>)ViewState["CurrentKamarList"];
            datas.RemoveAt(idx);
            ViewState["CurrentKamarList"] = datas;
            BindKamarGrid();
        }

        #endregion

        //protected void fuFotoDepan_UploadStart(object sender, AjaxControlToolkit.AjaxFileUploadStartEventArgs e)
        //{
        //    var now = DateTime.Now;
        //    e.ServerArguments = now.ToShortTimeString();
        //    Session["uploadTime"] = now;
            
        //}

        //protected void fuFotoDepan_UploadCompleteAll(object sender, AjaxControlToolkit.AjaxFileUploadCompleteAllEventArgs e)
        //{
        //    var startedAt = (DateTime)Session["uploadTime"];
        //    var now = DateTime.Now;
        //    e.ServerArguments = new JavaScriptSerializer()
        //        .Serialize(new
        //        {
        //            duration = (now - startedAt).Seconds,
        //            time = DateTime.Now.ToShortTimeString()
        //        });
        //}

        //protected void fuFotoDepan_UploadComplete(object sender, AjaxFileUploadEventArgs file)
        //{
        //    try
        //    {
                
        //        //Directory.CreateDirectory()
        //        // User can save file to File System, database or in session state
        //        if (file.ContentType.Contains("jpg") || file.ContentType.Contains("gif")
        //            || file.ContentType.Contains("png") || file.ContentType.Contains("jpeg"))
        //        {

        //            // Limit preview file for file equal or under 4MB only, otherwise when GetContents invoked
        //            // System.OutOfMemoryException will thrown if file is too big to be read.
        //            if (file.FileSize <= 1024 * 1024 * 4)
        //            {
        //                Session["fileContentType_" + file.FileId] = file.ContentType;
        //                Session["fileContents_" + file.FileId] = file.GetContents();

        //                // Set PostedUrl to preview the uploaded file.
        //                file.PostedUrl = string.Format("?preview=1&fileId={0}", file.FileId);
        //            }
        //            else
        //            {
        //                file.PostedUrl = "fileTooBig.gif";
        //            }

        //            // Since we never call the SaveAs method(), we need to delete the temporary fileß
        //            //file.DeleteTemporaryData();
        //        }
        //        if (Directory.Exists(MapPath("~/UploadedImage/")))
        //        {
        //            Directory.CreateDirectory(MapPath("~/UploadedImage/User-" + Session["UserID"])); // +"/Kos-1/"));
        //        }
        //        // In a real app, you would call SaveAs() to save the uploaded file somewhere
        //        fuFotoDepan.SaveAs(MapPath("~/UploadedImage/User-"+ Session["UserID"] + "/" + file.FileName));
        //    }
        //    catch (Exception ex)
        //    {
                
        //        throw ex;
        //    }
            
        //}
    }
}