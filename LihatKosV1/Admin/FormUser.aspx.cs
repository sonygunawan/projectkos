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
    public partial class FormUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadUser();
        }

        private void LoadUser()
        {
            gvUser.DataSource = new UserSystem().GetUsers(0);
            gvUser.DataBind();
        }
        private void LoadddlTipeUser()
        {
            ddlTipeUser.DataSource = new UserSystem().GetAllTipeUser();
            ddlTipeUser.DataValueField = "ID";
            ddlTipeUser.DataTextField = "Nama";
            ddlTipeUser.DataBind();
        }
        private void EditUser()
        {
            string IDstr = Session["EditUserID"].ToString();
            var user = new UserData();
            user.ID = Convert.ToInt64(IDstr);
            user.UserName = txtUserName.Text;
            user.Email = txtEmail.Text;
            user.TipeUserID = Convert.ToInt32(ddlTipeUser.SelectedValue);
            user.LastActivityDate = DateTime.Now;
            new UserSystem().UpdateUser(user);
        }
        protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUser.PageIndex = e.NewPageIndex;
        }
        protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var data = (UserData)e.Row.DataItem;
                LinkButton lbtnEdit = (LinkButton)e.Row.Cells[5].FindControl("lbtnEdit");
                LinkButton lbtnActive = (LinkButton)e.Row.Cells[5].FindControl("lbtnActive");
                LinkButton lbtnDeactive = (LinkButton)e.Row.Cells[5].FindControl("lbtnDeactive");

                if(data.IsActive == 1)
                {
                    lbtnActive.Visible = false;
                    lbtnDeactive.Visible = true;
                }
                else
                {
                    lbtnActive.Visible = true;
                    lbtnDeactive.Visible = false;
                }

                lbtnEdit.CommandArgument = lbtnActive.CommandArgument = lbtnDeactive.CommandArgument
                    = data.ID.ToString();
            }
        }
        protected void lbtnEdit_Command(object sender, CommandEventArgs e)
        {
            LoadddlTipeUser();
            string IDstr = e.CommandArgument.ToString();
            var user = new UserSystem().GetUsers(Convert.ToInt64(IDstr))[0];
            txtUserName.Text = user.UserName;
            txtEmail.Text = user.Email;
            ddlTipeUser.SelectedValue = user.TipeUserID.ToString();
            Session["EditUserID"] = user.ID.ToString();
            btnTambah.Text = "Save";
            MPEForm.Show();

        }
        protected void lbtnActive_Command(object sender, CommandEventArgs e)
        {
            string IDstr = e.CommandArgument.ToString();
            new UserSystem().UpdateUserAktif(Convert.ToInt64(IDstr), 1);
            LoadUser();
        }
        protected void lbtnDeactive_Command(object sender, CommandEventArgs e)
        {
            string IDstr = e.CommandArgument.ToString();
            new UserSystem().UpdateUserAktif(Convert.ToInt64(IDstr), 0);
            LoadUser();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            if (btnTambah.Text == "Save")
            {
                EditUser();
            }
            LoadUser();
        }


        //protected void lbApprove_Command(object sender, CommandEventArgs e)
        //{
        //    Int64 idx = Convert.ToInt64(e.CommandArgument);
            
        //}
        //protected void lbAbort_Command(object sender, CommandEventArgs e)
        //{
        //    Int64 idx = Convert.ToInt64(e.CommandArgument);
            
        //}

    }
}