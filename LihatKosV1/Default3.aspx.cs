using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class Default3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                chkRemember.Checked = true; 

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
            LoadPage();
        }

        private void LoadPage()
        {
            if (Session["UserID"] == null)
            {
                liTambahKos.Visible = false;
                pWelcome.Visible = false;
                liAdmin.Visible = false;

                MPELogin.Show();
            }
            else
            {
                liTambahKos.Visible = true;
                pWelcome.Visible = true;
                var user = new UserSystem().GetUsers(Convert.ToInt64(Session["UserID"]))[0];
                if (user.TipeUserID == 1 || user.TipeUserID == 2)
                    liAdmin.Visible = true;
                else
                    liAdmin.Visible = false;

                litUsername.Text = user.UserName;

                MPELogin.Hide();
            }
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
        protected void ddlPropinsi_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlKabupaten.DataSource = new WilayahSystem().GetAllKabupaten(Convert.ToInt32(ddlPropinsi.SelectedValue));
            ddlKabupaten.DataTextField = "Nama";
            ddlKabupaten.DataValueField = "IDKabupaten";
            ddlKabupaten.DataBind();
            ddlKabupaten.Items.Insert(0, new ListItem("- Semua - ", "0"));

            LoadPriceRange();
        }

        protected void ddlKabupaten_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlKecamatan.DataSource = new WilayahSystem().GetAllKecamatan(Convert.ToInt32(ddlKabupaten.SelectedValue));
            ddlKecamatan.DataTextField = "Nama";
            ddlKecamatan.DataValueField = "IDKecamatan";
            ddlKecamatan.DataBind();
            ddlKecamatan.Items.Insert(0, new ListItem("- Semua - ", "0"));
            
            LoadPriceRange();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var provinsi = ddlPropinsi.SelectedValue;
            var kabupaten = ddlKabupaten.SelectedValue; 
            var kecamatan = ddlKecamatan.SelectedValue; 

            Response.Redirect("/CariLokasi?tipeKos=&lokasi=&latLng=" +
                "&propinsi=" + provinsi + "&kabupaten=" + kabupaten + "&kecamatan=" + kecamatan + "&minimum=" + multiHandle2_1_BoundControl.Text + "&maximum=" + multiHandle2_2_BoundControl.Text);
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

        }

        protected void btnLoginShort_Click(object sender, EventArgs e)
        {
            var retVal = new UserSystem().DoSignIn(txtEmail.Text.Trim(), txtPassword.Text.Trim());
            if (retVal.ID != 0)
            {
                if (retVal.IsActive != 0)
                {
                    Session["UserID"] = retVal.ID;
                    if (chkRemember.Checked == true)
                    {
                        Response.Cookies["email"].Value = txtEmail.Text;
                        Response.Cookies["passwrd"].Value = txtPassword.Text;
                    }
                    LoadPage();
                    MPELogin.Hide();
                    CheckIPAddressClientIsAllow();
                }
                else
                    lblLoginErrorMsg.Text = "Email belum terverifikasi.";
               

            }
            else
            {
                lblLoginErrorMsg.Text = "Wrong Username or Password!!";
               
            }
        }

        private Boolean CheckIPAddressClientIsAllow()
        {
            String[] FormatIPAddressAllowLogin = "192.168.x.x;127.0.0.1".Split(';');
            String[] SplitIP = null;
            String DetectedIPClient = Request.UserHostAddress.ToString();
            String[] SplitIpDetected = DetectedIPClient.Split('.');
            Boolean Allow = false;
            for (int n = 0; n < FormatIPAddressAllowLogin.Length; n++)
            {
                Allow = false;
                SplitIP = FormatIPAddressAllowLogin[n].Split('.');

                if ((SplitIP[0] == SplitIpDetected[0] || SplitIP[0] == "x") && (SplitIP[1] == SplitIpDetected[1] || SplitIP[1] == "x") && (SplitIP[2] == SplitIpDetected[2] || SplitIP[2] == "x"))
                {
                    Allow = true;
                    break;
                }
            }
            return Allow;
        }
    }
}