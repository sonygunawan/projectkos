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
    public partial class UploadFoto : System.Web.UI.Page
    {
        private Int64 ID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    ID = Convert.ToInt64(Request.QueryString["ID"]);
                }
                FormKosData Data = new FormKosSystem().GetAllFormKos(ID)[0];
                lblNama.Text = Data.Nama;
                lblAlamat.Text = Data.Alamat;
            }
            //|| Request.QueryString["preview"] != "2"|| string.IsNullOrEmpty(Request.QueryString["fileId2"])
            if (Request.QueryString["preview"] != "1"  || string.IsNullOrEmpty(Request.QueryString["fileId"]))
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

        protected void fuFotoDepan_UploadStart(object sender, AjaxControlToolkit.AjaxFileUploadStartEventArgs e)
        {
            var now = DateTime.Now;
            e.ServerArguments = now.ToShortTimeString();
            Session["uploadTime"] = now;

        }

        protected void fuFotoDepan_UploadCompleteAll(object sender, AjaxControlToolkit.AjaxFileUploadCompleteAllEventArgs e)
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

        protected void fuFotoDepan_UploadComplete(object sender, AjaxFileUploadEventArgs file)
        {
            try
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    ID = Convert.ToInt64(Request.QueryString["ID"]);
                }
                //Directory.CreateDirectory()
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
                if (Directory.Exists(MapPath("~/UploadedImage/")))
                {
                    //Directory.CreateDirectory(MapPath("~/UploadedImage/User-" + Session["UserID"] + "/Kos-" + ID.ToString())); // +"/Kos-1/"));
                }
                // In a real app, you would call SaveAs() to save the uploaded file somewhere
                //fuFotoDepan.SaveAs(MapPath("~/UploadedImage/User-" + Session["UserID"] + "/Kos-" + ID.ToString() + "/" + file.FileName));
                fuFotoDepan.SaveAs(MapPath("~/UploadedImage/") + file.FileName);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        //Foto Dalam

        protected void fuFotoDalam_UploadStart(object sender, AjaxControlToolkit.AjaxFileUploadStartEventArgs e)
        {
            var now = DateTime.Now;
            e.ServerArguments = now.ToShortTimeString();
            Session["uploadTime"] = now;

        }

        protected void fuFotoDalam_UploadCompleteAll(object sender, AjaxControlToolkit.AjaxFileUploadCompleteAllEventArgs e)
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

        protected void fuFotoDalam_UploadComplete(object sender, AjaxFileUploadEventArgs file)
        {
            try
            {
                
                //Directory.CreateDirectory()
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
                        file.PostedUrl = string.Format("?preview=2&fileId2={0}", file.FileId);
                    }
                    else
                    {
                        file.PostedUrl = "fileTooBig.gif";
                    }

                    // Since we never call the SaveAs method(), we need to delete the temporary fileß
                    //file.DeleteTemporaryData();
                }
                if (Directory.Exists(MapPath("~/UploadedImage/")))
                {
                    Directory.CreateDirectory(MapPath("~/UploadedImage/User-" + Session["UserID"])); // +"/Kos-1/"));
                }
                // In a real app, you would call SaveAs() to save the uploaded file somewhere
                fuFotoDepan.SaveAs(MapPath("~/UploadedImage/User-" + Session["UserID"] + "/" + file.FileName));
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }
    }
}