using AjaxControlToolkit;
using LihatKos.BusinessFacade;
using LihatKos.Common;
using LihatKos.Web.Controls;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public class ImageData
    {
        public string FilePath { get; set; }
        public string Status { get; set; }

    }
    public partial class UploadFoto : System.Web.UI.Page
    {
        private Int64 ID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.GetCurrent(this.Page).RegisterPostBackControl(gvFileList);
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    ID = Convert.ToInt64(Request.QueryString["ID"]);
                }
                FormKosData Data = new FormKosSystem().GetAllFormKos(ID)[0];
                lblNama.Text = Data.Nama;
                lblAlamat.Text = Data.Alamat;
                ViewState["FormKosID"] = null;
                
            }
            //BindFromBankFiles();
            if (!Page.IsPostBack && !Page.IsCallback && !fuFotoDepan.IsInFileUploadPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    ID = Convert.ToInt64(Request.QueryString["ID"]);
                    ViewState["FormKosID"] = ID;
                }
                FormKosData Data = new FormKosSystem().GetAllFormKos(ID)[0];
                lblNama.Text = Data.Nama;
                lblAlamat.Text = Data.Alamat;

                BindFromBankFiles();
            }
            
            if (Session["UserID"] == null)
            {
                Response.Redirect("/Login");
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
        private void BindFromBankFiles()
        {
            var FormKosID = Convert.ToInt64(ViewState["FormKosID"].ToString());
            string StrUserID = "User-" + Session["UserID"].ToString();
            string StrKosID = "Kos-" + FormKosID;
            if (!Directory.Exists(MapPath("~/UploadedImage/" + StrUserID)))
            {
                Directory.CreateDirectory(MapPath("~/UploadedImage/" + StrUserID)); // +"/Kos-1/"));
            }
            if (!Directory.Exists(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID)))
            {
                Directory.CreateDirectory(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID)); // +"/Kos-1/"));
            }
            string[] folderList = Directory.GetDirectories(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID));
            var imgList = new List<ImageData>();
            foreach (var folder in folderList)
            {
                var folderName = folder.Split('\\');
                string[] files = Directory.GetFiles(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID + "/" + folderName[folderName.Length -1]));
                var fileIn = files[0].Split('\\');
                ImageData imgId = new ImageData();
                imgId.FilePath = "~/UploadedImage/" + StrUserID + "/" + StrKosID + "/" + folderName[folderName.Length - 1] + "/" + fileIn[fileIn.Length-1] ;
                imgList.Add(imgId);
            }
            gvFileList.DataSource = imgList;
            gvFileList.DataBind();
            //var imgList = new List<ImageData>();
            //ImageData imgId = new ImageData();
            //imgId.FilePath = "~/UploadedImage/User-1/Kos-11/bloomingflower.jpg";
            //imgId.Status = "bloomingflower.jpg";
            //imgList.Add(imgId);
            //imgId = new ImageData();
            //imgId.FilePath = "~/UploadedImage/User-1/Kos-11/monochrome2.jpg";
            //imgId.Status = "bloomingflower.jpg";
            //imgList.Add(imgId);

            //gvFileList.DataSource = imgList;
            //gvFileList.DataBind();
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

            BindFromBankFiles();
        }

        protected void fuFotoDepan_UploadComplete(object sender, AjaxFileUploadEventArgs file)
        {
            try
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    ID = Convert.ToInt64(Request.QueryString["ID"]);
                }
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
                if (Directory.Exists(MapPath("~/UploadedImage/")))
                {
                    string StrUserID = "User-" + Session["UserID"].ToString();
                    string StrKosID = "Kos-" + ID.ToString();
                    //Directory.CreateDirectory(MapPath("~/UploadedImage/User-" + Session["UserID"] + "/Kos-" + ID.ToString())); // +"/Kos-1/"));
                    if (!Directory.Exists(MapPath("~/UploadedImage/" + StrUserID)))
                    {
                        Directory.CreateDirectory(MapPath("~/UploadedImage/" + StrUserID)); // +"/Kos-1/"));
                    }
                    if (Directory.Exists(MapPath("~/UploadedImage/" + StrUserID)))
                    {
                        if (!Directory.Exists(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID)))
                        {
                            Directory.CreateDirectory(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID)); // +"/Kos-1/"));
                        }
                        string[] FolderList = Directory.GetDirectories(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID));
                        int CountFolder = FolderList.Count();
                        if (CountFolder <= 7)
                        {
                            string newFolder = "folder-" + (CountFolder + 1).ToString();
                            if (!Directory.Exists(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID + "/" + newFolder)))
                            {
                                Directory.CreateDirectory(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID + "/" + newFolder)); // +"/Kos-1/"));
                            }
                            System.Drawing.Image imgTmp = imgStr;
                            //image width: 110px
                            imgTmp = Web.Controls.ImageResize.ScaleImage(imgTmp, 110);
                            var fileName = "new" + imgTmp.Width.ToString() + "x" + imgTmp.Height.ToString() + ".jpg";
                            //fuFotoDepan.SaveAs(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID) + "/" + file.FileName);
                            imgTmp.Save(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID + "/" + newFolder) + "/" + fileName, ImageFormat.Jpeg);
                            //image width: 849px
                            imgTmp = Web.Controls.ImageResize.ScaleImage(imgTmp, 849);
                            fileName = "new" + imgTmp.Width.ToString() + "x" + imgTmp.Height.ToString() + ".jpg";
                            imgTmp.Save(MapPath("~/UploadedImage/" + StrUserID + "/" + StrKosID + "/" + newFolder) + "/" + fileName, ImageFormat.Jpeg);
                        }
                        else
                        {
                            ValidationError.Display("Maximum file upload: 7 photos.");
                        }
                        //file.DeleteTemporaryData();
                    }
                }

                //BindFromBankFiles();
                // In a real app, you would call SaveAs() to save the uploaded file somewhere
                //fuFotoDepan.SaveAs(MapPath("~/UploadedImage/User-" + Session["UserID"] + "/Kos-" + ID.ToString() + "/" + file.FileName));
                //fuFotoDepan.SaveAs(MapPath("~/UploadedImage/") + file.FileName);
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
            Response.Redirect("/UploadFoto?ID=" + ID);
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

        protected void gvFileList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var data = (ImageData)e.Row.DataItem;
                //Literal litStatus = (Literal)e.Row.Cells[0].FindControl("litStatus");
                Image imgFile = (Image)e.Row.Cells[0].FindControl("imgFile");
                //litStatus.Text = data.Status;
                imgFile.ImageUrl = data.FilePath;
                
            }
        }

        protected void gvFileList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Default")
            {

            }
        }

        protected void UpdatePanelFoto_Load(object sender, EventArgs e)
        {
            BindFromBankFiles();
        }
    }
}