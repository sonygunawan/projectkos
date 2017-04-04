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
            ViewState["BannerID"] = maxBanner;
            litPopupTitle.Text = "Add Banner: " + maxBanner;
            btnTambah.Text = "Tambah";
            MPEForm.Show();
        }
        protected void lbtnEdit_Command(object sender, CommandEventArgs e)
        {
            string[] args = e.CommandArgument.ToString().Split('|');
            int BannerID = Convert.ToInt32(args[0]);
            var data = new BannerSystem().GetBanner(BannerID);
            txtNama.Text = data.Nama;
            txtUrl.Text = data.Url;
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

        protected void btnTambah_Click(object sender, EventArgs e)
        {

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
                imgStr.Save(MapPath("~/images/photos/" + file.FileName));
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