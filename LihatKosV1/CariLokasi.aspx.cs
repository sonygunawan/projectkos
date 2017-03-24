using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class CariLokasi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["latLng"]))
            {
                string[] splitLatLng = Convert.ToString(Request.QueryString["latLng"]).Split(',');
                hidLatitude.Value = splitLatLng[0];
                hidLongitude.Value = splitLatLng[1];
            }
        }
    }
}