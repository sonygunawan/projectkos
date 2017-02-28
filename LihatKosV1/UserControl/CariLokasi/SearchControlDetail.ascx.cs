using AjaxControlToolkit;
using LihatKos.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.UserControl.CariLokasi
{
    public partial class SearchControlDetail : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //ToolkitScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "testSearch",
                //    "$(function () {$(\"#slider-3\").slider({" +
                //        "range: true, min: 0, max: 500, values: [75, 300], slide: function (event, ui) { $(\"#price\").val(\"$\" + ui.values[0] + \" - $\" + ui.values[1]); } " +
                //    "}); $(\"#price\").val(\"$\" + $(\"#slider-3\").slider(\"values\", 0) + \" - $\" + $(\"#slider-3\").slider(\"values\", 1)); }); "
                //    , true);
                ddlTipeKos.DataSource = new TipeKosSystem().GetAllTipeKos();
                ddlTipeKos.DataTextField = "Nama";
                ddlTipeKos.DataValueField = "ID";
                ddlTipeKos.DataBind();
                ddlTipeKos.SelectedValue = "1";

                ddlSatuanHarga.DataSource = new SatuanHargaSystem().GetAllSatuanHarga();
                ddlSatuanHarga.DataTextField = "Nama";
                ddlSatuanHarga.DataValueField = "ID";
                ddlSatuanHarga.DataBind();
                ddlSatuanHarga.SelectedValue = "3";

                chkFasilitas.DataSource = new FasilitasSystem().GetAllFasilitas();
                chkFasilitas.DataTextField = "NamaFasilitas";
                chkFasilitas.DataValueField = "ID";
                chkFasilitas.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //Response.Redirect("/CariLokasi?latLng=" + hidLatitude.Value + "," + hidLongitude.Value);
        }
    }
}