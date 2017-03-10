using LihatKos.BusinessFacade;
using LihatKos.Common;
using LihatKos.Common.Enum;
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
            gvApprovalKos.DataSource= new FormKosSystem().GetAllFormKos(0);
            gvApprovalKos.DataBind();
        }

        protected void gvApprovalKos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvApprovalKos.PageIndex = e.NewPageIndex;

        }

        protected void gvApprovalKos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                FormKosData data = (FormKosData)e.Row.DataItem;
                LinkButton lbtnApprove = (LinkButton)e.Row.Cells[13].FindControl("lbtnApprove");
                LinkButton lbtnAbort = (LinkButton)e.Row.Cells[13].FindControl("lbtnAbort");
                lbtnApprove.CommandArgument = data.ID.ToString();
                lbtnAbort.CommandArgument = data.ID.ToString();
            }
        }
        protected void lbApprove_Command(object sender, CommandEventArgs e)
        {
        }
        protected void lbAbort_Command(object sender, CommandEventArgs e)
        {
        }
        //protected void rptApprovalKos_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{

        //}
        //protected void rptApprovalKos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        FormKosData Data = (FormKosData)e.Item.DataItem;

        //        Label lblID = (Label)e.Item.FindControl("lblID");
        //        Label lblNama = (Label)e.Item.FindControl("lblNama");
        //        Label lblArea = (Label)e.Item.FindControl("lblArea");
        //        HyperLink hlApprovalButton = (HyperLink)e.Item.FindControl("hlApprovalButton");

        //        lblID.Text = Data.ID.ToString();
        //        lblNama.Text = Data.Nama;
        //        lblArea.Text = Data.NamaArea;
        //        hlApprovalButton.NavigateUrl = "FormApproval?id=" + Data.ID.ToString();
        //    }
        //}

        //#region fungsi paging
        //private void FillPaging()
        //{
        //    /*int countPage = CountData;
        //    int sumPage = 1;

        //    if (countPage % SystemConfiguration.DefaultPagingSize == 0)
        //    {
        //        sumPage = countPage / SystemConfiguration.DefaultPagingSize;
        //    }
        //    else
        //    {
        //        sumPage = countPage / SystemConfiguration.DefaultPagingSize + 1;
        //    }

        //    PagingControl1.SumPage = sumPage;*/
        //    PagingControl1.SumPage = CountData;
        //    PagingControl1.Clear();
        //    PagingControl1.DataBind();
        //}

        //protected int CurrPage
        //{
        //    get
        //    {
        //        return Convert.ToInt32(ViewState["CurrPage"]);
        //    }
        //    set
        //    {
        //        ViewState["CurrPage"] = value;
        //    }
        //}

        //public void LinkPaging_Click(object sender, EventArgs e)
        //{
        //    List<FormKosData> dataSource = null;
        //    LinkButton linkButton = sender as LinkButton;

        //    if (linkButton.ID == Convert.ToInt32(NavigationName.First).ToString())
        //    {
        //        PagingControl1.CurrentPage = 1;
        //    }
        //    else if (linkButton.ID == Convert.ToInt32(NavigationName.Last).ToString())
        //    {
        //        PagingControl1.CurrentPage = PagingControl1.SumPage;
        //    }
        //    else if (linkButton.ID == Convert.ToInt32(NavigationName.Next).ToString())
        //    {
        //        PagingControl1.CurrentPage = PagingControl1.CurrentPage + 1;
        //    }
        //    else if (linkButton.ID == Convert.ToInt32(NavigationName.Prev).ToString())
        //    {
        //        PagingControl1.CurrentPage = PagingControl1.CurrentPage - 1;
        //    }
        //    else
        //    {
        //        PagingControl1.CurrentPage = Convert.ToInt32(linkButton.ID);
        //    }

        //    CurrPage = PagingControl1.CurrentPage;
        //    dataSource = new AnnouncementSystem().SearchAnnouncementBackend("", CurrPage, SystemConfiguration.DefaultPagingSize); ;

        //    if (dataSource != null)
        //    {
        //        PagingControl1.Visible = true;
        //        dataSource.RemoveAt(dataSource.Count - 1);
        //    }
        //    else
        //    {
        //        PagingControl1.Visible = false;
        //    }
        //    rptApprovalKos.DataSource = dataSource;
        //    rptApprovalKos.DataBind();
        //    FillPaging();
        //}
        //#endregion
    }
}