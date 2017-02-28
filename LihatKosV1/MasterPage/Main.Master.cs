using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.MasterPage
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                liTambahKos.Visible = false;
                liLogout.Visible = false;
            }
            else
            {
                liTambahKos.Visible = true;
                liLogout.Visible = true;
            }
        }
    }
}