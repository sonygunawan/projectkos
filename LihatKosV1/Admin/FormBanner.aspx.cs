using BusinessFacade;
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

namespace LihatKosV1.Admin
{
    public partial class FormBanner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("/Login");
            }
            LoadBanner();

            if (Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["fileId"]))
                    ScriptManager.RegisterStartupScript(UpdatePanelPopup, UpdatePanelPopup.GetType(), "", "return $('#ContentPlaceHolder1_fuFotoBanner_UploadOrCancelButton').click();", true);
                    //ClientScript.RegisterStartupScript(UpdatePanelPopup, UpdatePanelPopup.GetType(), "", "return $('#ContentPlaceHolder1_fuFotoBanner_UploadOrCancelButton').click();", true);
            }
            if (Request.QueryString["preview"] != "1" || string.IsNullOrEmpty(Request.QueryString["fileId"]))
                return;

            var fileId = Request.QueryString["fileId"];
            string fileContentType = null;
            byte[] fileContents = null;

            fileContents = (byte[])Session["fileContents_" + fileId];
            fileContentType = (string)Session["fileContentType_" + fileId];

            if (fileContents == null)
                return;

            Response.Clear();
            Response.ContentType = fileContentType;
            Response.BinaryWrite(fileContents);
            Response.End();
        }
        private void LoadBanner()
        {
            gvBanner.DataSource = new BannerSystem().GetListBanner();
            gvBanner.DataBind();
        }
        private void BindFromBankFiles(int BannerID)
        {
            if (!Directory.Exists(MapPath("~/images/photos")))
            {
                Directory.CreateDirectory(MapPath("~/images/photos"));
            }
            var data = new BannerSystem().GetBanner(BannerID);
            List<BannerData> list = new List<BannerData>();
            list.Add(data);
            gvFileList.DataSource = list;
            gvFileList.DataBind();
        }
        protected void gvBanner_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var data = (BannerData)e.Row.DataItem;
                LinkButton lbtnEdit = (LinkButton)e.Row.Cells[5].FindControl("lbtnEdit");
                LinkButton lbtnDelete = (LinkButton)e.Row.Cells[5].FindControl("lbtnDelete");
                lbtnEdit.CommandArgument = lbtnDelete.CommandArgument 
                    = data.ID.ToString() + "|" + data.Kode;

            }
        }

        protected void gvBanner_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBanner.PageIndex = e.NewPageIndex;
        }

        protected void btnAddBanner_Click(object sender, EventArgs e)
        {
            string maxBanner = new BannerSystem().GetMaxBanner();
            Session["maxBanner"] = maxBanner.Replace(';','~');
            litPopupTitle.Text = "Add Banner: " + maxBanner.Split(';')[1];
            txtNama.Text = "";
            txtUrl.Text = "";
            txtPrioritas.Text = "";
            btnTambah.Text = "Tambah";
            MPEForm.Show();
        }
        protected void lbtnEdit_Command(object sender, CommandEventArgs e)
        {
            string[] args = e.CommandArgument.ToString().Split('|');
            int BannerID = Convert.ToInt32(args[0]);
            Session["BannerID"] = BannerID;
            var data = new BannerSystem().GetBanner(BannerID);
            txtNama.Text = data.Nama;
            txtUrl.Text = data.Url;
            txtPrioritas.Text = data.Prioritas.ToString();
            BindFromBankFiles(BannerID);
            btnTambah.Text = "Save";
            MPEForm.Show();

        }

        protected void lbtnDelete_Command(object sender, CommandEventArgs e)
        {
            string[] args = e.CommandArgument.ToString().Split('|');
            int BannerID = Convert.ToInt32(args[0]);
            var data = new BannerSystem().GetBanner(BannerID);
            if (new BannerSystem().DeleteBanner(BannerID))
            {
                var filePath = (data.FilePath.Contains("~/") == true ? data.FilePath : "~/" + data.FilePath);
                if (File.Exists(MapPath(filePath)))
                {
                    File.Delete(MapPath(filePath));
                }
            }
            else
            {
                ValidationError.Display("Error Delete");
            }
            LoadBanner();
        }

        //private string UpdateFotoBanner(int BannerID)
        //{
        //    try
        //    {
        //        fuFotoBanner.SaveAs(MapPath(filePath));
        //        fuFotoBanner.up
        //        return filePath;
        //    }
        //    catch (Exception ex)
        //    {
        //        return "";
        //        throw ex;
        //    }
            
        //}
        private void InsertBanner()
        {
            var Kode = Session["maxBanner"].ToString().Split('~');
            var data = new BannerData();
            data.Kode = Kode[1];
            data.Nama = txtNama.Text;
            data.Url = txtUrl.Text;
            
            //fuFotoBanner.UploadComplete += fuFotoBanner_UploadComplete;
            data.FilePath = Session["filePath"].ToString();// UpdateFotoBanner(Convert.ToInt32(Kode[0]));
            data.Prioritas = Convert.ToInt32(txtPrioritas.Text); // Convert.ToInt32(Kode[2]);
            new BannerSystem().UpdateBanner(data);
        }
        private void EditBanner()
        {
            var BannerID = Convert.ToInt32(Session["BannerID"]);
            var dataEx = new BannerSystem().GetBanner(BannerID);
            var filePath = (dataEx.FilePath.Contains("~/") == true ? dataEx.FilePath : "~/" + dataEx.FilePath);
            if (File.Exists(MapPath(filePath)))
            {
                File.Delete(MapPath(filePath));
            }
            var data = new BannerData();
            data.ID = BannerID;
            data.Nama = txtNama.Text;
            data.FilePath = filePath; //Session["filePath"].ToString();
            data.Url = txtUrl.Text;
            data.Prioritas = Convert.ToInt32(txtPrioritas.Text);
            new BannerSystem().UpdateBanner(data);
        }
        protected void btnTambah_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(UpdatePanelPopup, UpdatePanelPopup.GetType(), "", "return $('#ContentPlaceHolder1_fuFotoBanner_UploadOrCancelButton').click();", true);
            
            if (btnTambah.Text == "Tambah")
            {
                //Insert
                InsertBanner();
            }
            else if (btnTambah.Text == "Save")
            {
                //Edit
                EditBanner();
            }
            Response.Redirect("/FormBanner");
        }

        protected void fuFotoBanner_UploadStart(object sender, AjaxControlToolkit.AjaxFileUploadStartEventArgs e)
        {
            var now = DateTime.Now;
            e.ServerArguments = now.ToShortTimeString();
            Session["uploadTime"] = now;
        }

        protected void fuFotoBanner_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs file)
        {
            System.Drawing.Image imgStr = System.Drawing.Image.FromStream(file.GetStreamContents());
            // User can save file to File System, database or in session state
            if (file.ContentType.Contains("jpg") || file.ContentType.Contains("gif")
                || file.ContentType.Contains("png") || file.ContentType.Contains("jpeg"))
            {

                // Limit preview file for file equal or under 4MB only, otherwise when GetContents invoked
                // System.OutOfMemoryException will thrown if file is too big to be read.
                if (file.FileSize <= 1024 * 1024 * 4)
                {
                    Session["fileContentType_" + file.FileId] = file.ContentType;
                    Session["fileContents_" + file.FileId] = file.GetContents();

                    // Set PostedUrl to preview the uploaded file.
                    file.PostedUrl = string.Format("?preview=1&fileId={0}", file.FileId);

                }
                else
                {
                    file.PostedUrl = "fileTooBig.gif";
                }

                // Since we never call the SaveAs method(), we need to delete the temporary fileß
                //file.DeleteTemporaryData();
            }
            if (!Directory.Exists(MapPath("~/images/photos")))
            {
                Directory.CreateDirectory(MapPath("~/images/photos"));
            }
            if (Directory.Exists(MapPath("~/images/photos")))
            {
                string maxBanner = Session["maxBanner"].ToString();
                var Kode = maxBanner.Split('~');
                var filePath = "~/images/photos/banner-" + Kode[0].ToString() + ".jpg";
                Session["filePath"] = filePath.Replace("~/","");

                imgStr.Save(MapPath(filePath));
                //file.DeleteTemporaryData();
            }
        }

        protected void fuFotoBanner_UploadCompleteAll(object sender, AjaxControlToolkit.AjaxFileUploadCompleteAllEventArgs e)
        {
            var startedAt = (DateTime)Session["uploadTime"];
            var now = DateTime.Now;
            e.ServerArguments = new JavaScriptSerializer()
                .Serialize(new
                {
                    duration = (now - startedAt).Seconds,
                    time = DateTime.Now.ToShortTimeString()
                });
        }

        protected void gvFileList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var data = (BannerData)e.Row.DataItem;
                Image imgfile = (Image)e.Row.Cells[0].FindControl("imgFile");
                imgfile.ImageUrl = (data.FilePath.Contains("~/") == true ? data.FilePath : "~/" + data.FilePath);
            }
        }


    }
}