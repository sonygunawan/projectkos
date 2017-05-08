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
    public partial class FormAboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var content = new ContentSystem().GetPageContent(4);
                txtEditor.Text = content.PageContent;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var data = new ContentData();
            data.ID = Convert.ToInt32(ddlContent.SelectedValue);
            data.PageContent = txtEditor.Text;
            new ContentSystem().UpdatePageContent(data);

            //lblContents.Text = txtEditor.Text;
        }

        protected void ddlContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            var content = new ContentSystem().GetPageContent(Convert.ToInt32(ddlContent.SelectedValue));
            txtEditor.Text = content.PageContent;
        }
    }
}