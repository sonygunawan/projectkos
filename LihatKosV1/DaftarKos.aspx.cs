using AjaxControlToolkit;
using LihatKos.BusinessFacade;
using LihatKos.Common;
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
                //using (var webClient = new System.Net.WebClient())
                //{

                //    var data = webClient.DownloadString("https://geoip-db.com/json");
                //    JavaScriptSerializer jss = new JavaScriptSerializer();
                //    var d = jss.Deserialize<dynamic>(data);

                //    ddlArea.SelectedItem.Text = d["city"];
                //}

            }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            FormKosData Data = new FormKosData();
            Data.Kode = new FormKosSystem().GetMaxFormKos();
            Data.Nama = txtNama.Text;
            Data.Deskripsi = txtDeskripsi.Text;
            Data.AreaID = Convert.ToInt32(ddlArea.SelectedValue);
            Data.Alamat = txtLokasi.Text;
            Data.Latitude = Convert.ToDecimal(Convert.ToDecimal(hidLatitude.Value.Replace('.',',')).ToString("N6"));
            Data.Longitude = Convert.ToDecimal(Convert.ToDecimal(hidLongitude.Value.Replace('.', ',')).ToString("N6"));
            Data.NamaPemilik = txtPemilik.Text;
            Data.KontakPemilik = txtTlpPemilik.Text;
            Data.NamaPengelola = txtNamaPengelola.Text;
            Data.KontakPengelola = txtTlpPengelola.Text;
            Data.MinimumBayarMonth = Convert.ToInt32(ddlMinimumBayarMonth.SelectedValue);
            Data.MinimumBayarDesc = txtMinimumBayarDesc.Text;
            Data.JmlKamar = Convert.ToInt32(txtJmlKamar.Text);
            Data.LuasKamar = Convert.ToSingle(txtLuasKamar.Text.Replace(',','.'));
            Data.TipeKosID = Convert.ToInt32(rdlTipeKos.SelectedValue);
            Data.JmlKamarKosong = Convert.ToInt32(txtJmlKamarKosong.Text);
            Data.PetID = (rdlPet.SelectedValue == "1") ? true : false;
            Data.Keterangan = txtKeteranganLain.Text;

            Int64 UserID = Convert.ToInt64(Session["UserID"]);
            Data.UserID = UserID;

            //1. 
            List<KosHargaData> DetailsHarga = new List<KosHargaData>();
            KosHargaData DetHarga = new KosHargaData();
            DetHarga.Harga = (txtHarian.Text != "") ? Convert.ToDecimal(txtHarian.Text) : 0;
            DetHarga.SatuanHargaID = 1;
            DetailsHarga.Add(DetHarga);

            //2.
            DetHarga = new KosHargaData();
            DetHarga.Harga = (txtMingguan.Text != "") ? Convert.ToDecimal(txtMingguan.Text) : 0;
            DetHarga.SatuanHargaID = 2;
            DetailsHarga.Add(DetHarga);

            //3.
            DetHarga = new KosHargaData();
            DetHarga.Harga =  (txtBulanan.Text != "") ? Convert.ToDecimal(txtBulanan.Text) : 0;
            DetHarga.SatuanHargaID = 3;
            DetailsHarga.Add(DetHarga);

            //4.
            DetHarga = new KosHargaData();
            DetHarga.Harga =  (txtTahunan.Text != "") ? Convert.ToDecimal(txtTahunan.Text) : 0;
            DetHarga.SatuanHargaID = 4;
            DetailsHarga.Add(DetHarga);

            List<KosFasilitasData> DetailsFasi = new List<KosFasilitasData>();
            foreach(ListItem item in chkFasilitas.Items)
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
            Data.KosHarga = DetailsHarga;
            Data.KosFasilitas = DetailsFasi;
            Data.KosLingkungan = DetailsLink;

            var retFormID = new FormKosSystem().InsertFormKosLengkap(Data);
            Response.Redirect("/UploadFoto?ID=" + retFormID.ToString());
        }

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