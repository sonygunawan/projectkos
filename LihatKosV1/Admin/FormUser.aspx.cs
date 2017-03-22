using LihatKos.BusinessFacade;
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

        protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUser.PageIndex = e.NewPageIndex;
        }
        protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void lbApprove_Command(object sender, CommandEventArgs e)
        {
            Int64 idx = Convert.ToInt64(e.CommandArgument);
            
        }
        protected void lbAbort_Command(object sender, CommandEventArgs e)
        {
            Int64 idx = Convert.ToInt64(e.CommandArgument);
            
        }
    }
}