using LihatKos.BusinessFacade;
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
            ddlArea.DataSource = new AreaSystem().GetAllArea();
            ddlArea.DataTextField = "Nama";
            ddlArea.DataValueField = "ID";
            ddlArea.DataBind();

            //using (var webClient = new System.Net.WebClient())
            //{

            //    var data = webClient.DownloadString("https://geoip-db.com/json");
            //    JavaScriptSerializer jss = new JavaScriptSerializer();
            //    var d = jss.Deserialize<dynamic>(data);

            //    ddlArea.SelectedItem.Text = d["city"];
            //}
        }
    }
}