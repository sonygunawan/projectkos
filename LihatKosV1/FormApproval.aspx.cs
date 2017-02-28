using LihatKos.BusinessFacade;
using LihatKos.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1
{
    public partial class FormApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rptApprovalKos.DataSource= new FormKosSystem().GetAllFormKos(0);
            rptApprovalKos.DataBind();
        }

        protected void rptApprovalKos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                FormKosData Data = (FormKosData)e.Item.DataItem;

                Label lblID = (Label)e.Item.FindControl("lblID");
                Label lblNama = (Label)e.Item.FindControl("lblNama");
                Label lblArea = (Label)e.Item.FindControl("lblArea");
                HyperLink hlApprovalButton = (HyperLink)e.Item.FindControl("hlApprovalButton");

                lblID.Text = Data.ID.ToString();
                lblNama.Text = Data.Nama;
                lblArea.Text = Data.NamaArea;
                hlApprovalButton.NavigateUrl = "FormApproval?id=" + Data.ID.ToString();
            }
        }

        protected void rptApprovalKos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}