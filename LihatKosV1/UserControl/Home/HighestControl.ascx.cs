using LihatKos.BusinessFacade;
using LihatKos.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.UserControl
{
    public partial class HighestControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlArea.DataSource = new AreaSystem().GetAllArea();
                ddlArea.DataTextField = "Nama";
                ddlArea.DataValueField = "ID";
                ddlArea.DataBind();
            }

            rptFormKosByArea.DataSource = new FormKosSystem().GetHighestFormKosByArea(Convert.ToInt32(ddlArea.SelectedValue));
            rptFormKosByArea.DataBind();
            //using (var webClient = new System.Net.WebClient())
            //{

            //    var data = webClient.DownloadString("https://geoip-db.com/json");
            //    JavaScriptSerializer jss = new JavaScriptSerializer();
            //    var d = jss.Deserialize<dynamic>(data);

            //    ddlArea.SelectedItem.Text = d["city"];
            //}
        }

        protected void rptFormKosByArea_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                FormKosData Data = (FormKosData)e.Item.DataItem;

                Label lblKeterangan = (Label)e.Item.FindControl("lblKeterangan");
                HyperLink hlDetailLink = (HyperLink)e.Item.FindControl("hlDetailLink");

                //lblHargaBulanan.Text = Data.Harga.ToString("N2");
                lblKeterangan.Text = Data.Keterangan;
                hlDetailLink.NavigateUrl = "../../DetailKos?id=" + Data.ID.ToString();
            }
        }
    }
}