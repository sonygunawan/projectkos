using LihatKos.BusinessFacade;
using LihatKos.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.Admin
{
    public partial class FormContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadContact();
        }
        private void LoadContact()
        {
            gvContact.DataSource = new ContentSystem().GetContactData();
            gvContact.DataBind();
        }
        private void LoadContactSearch(string search)
        {
            gvContact.DataSource = new ContentSystem().GetContactDataSmp(search);
            gvContact.DataBind();
        }

        private void LoadddlSubject()
        {
            ddlSubject.DataSource = new ContentSystem().GetAllSubjectContact();
            ddlSubject.DataValueField = "ID";
            ddlSubject.DataTextField = "Nama";
            ddlSubject.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text != "")
                LoadContactSearch(txtSearch.Text);
            else
                LoadContact();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (txtSearch.Text != "")
                LoadContactSearch(txtSearch.Text);
            else
                LoadContact();
        }
        protected void gvContact_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvContact.PageIndex = e.NewPageIndex;
        }

        protected void gvContact_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var data = (ContactData)e.Row.DataItem;
                LinkButton lbtnDetail = (LinkButton)e.Row.Cells[6].FindControl("lbtnDetail");
                LinkButton lbtnApprove = (LinkButton)e.Row.Cells[6].FindControl("lbtnApprove");
                LinkButton lbtnReject = (LinkButton)e.Row.Cells[6].FindControl("lbtnReject");
                lbtnApprove.Visible = false;
                lbtnReject.Visible = false;
                if (data.Status == 0)
                {
                    lbtnApprove.Visible = true;
                    lbtnReject.Visible = true;
                }
                else if(data.Status == 1)
                {
                    lbtnReject.Visible = true;
                }
                else if (data.Status == -1)
                {
                    lbtnApprove.Visible = true;
                }

                lbtnDetail.CommandArgument = lbtnReject.CommandArgument = lbtnApprove.CommandArgument 
                    = data.ID.ToString();
            }
        }
        protected void lbtnApprove_Command(object sender, CommandEventArgs e)
        {
            string IDstr = e.CommandArgument.ToString();
            new ContentSystem().UpdateContactAktif(Convert.ToInt64(IDstr), 1);
            LoadContact();
        }

        protected void lbtnReject_Command(object sender, CommandEventArgs e)
        {
            string IDstr = e.CommandArgument.ToString();
            new ContentSystem().UpdateContactAktif(Convert.ToInt64(IDstr), 0);
            LoadContact();
        }

        protected void lbtnDetail_Command(object sender, CommandEventArgs e)
        {
            LoadddlSubject();
            string IDstr = e.CommandArgument.ToString();
            var data = new ContentSystem().GetContactData(Convert.ToInt64(IDstr))[0];
            txtUserName.Text = data.UserName;
            ddlSubject.SelectedValue = data.SubjectID.ToString();
            txtMessage.Text = data.Message;
            btnApprove.Visible = (data.Status == 1 ? false : true);
            Session["EditContactUsID"] = data.ID.ToString();
            //btnApprove
            MPEForm.Show();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string IDstr = Session["EditContactUsID"].ToString();
            new ContentSystem().UpdateContactAktif(Convert.ToInt64(IDstr), 1);
        }
    }
}