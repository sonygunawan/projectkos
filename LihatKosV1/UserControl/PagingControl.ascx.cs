using LihatKos.Common.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LihatKosV1.UserControl
{
    public partial class PagingControl : System.Web.UI.UserControl
    {
        public event EventHandler Click;

        public int SumPage
        {
            get
            {
                return Convert.ToInt32(ViewState["SumPage"]);
            }
            set
            {
                ViewState["SumPage"] = value;
            }
        }

        public int CurrentPage
        {
            get
            {
                return Convert.ToInt32(ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        protected void LinkClick(object sender, EventArgs e)
        {
            this.Click(sender, e);
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            LinkClick(sender, e);
        }

        public void Clear()
        {
            placeHolderPage.Controls.Clear();
        }

        private void FillPlaceHolder()
        {
            if (CurrentPage > 1 && SumPage > 1)
            {
                LinkButton linkButtonFirst = new LinkButton();
                linkButtonFirst.Text = "&laquo;";
                linkButtonFirst.ID = Convert.ToInt32(NavigationName.First).ToString();
                linkButtonFirst.Click += new EventHandler(LinkButton_Click);

                placeHolderPage.Controls.Add(linkButtonFirst);

                LinkButton linkButtonPrev = new LinkButton();
                linkButtonPrev.Text = "&lt;";
                linkButtonPrev.ID = Convert.ToInt32(NavigationName.Prev).ToString();
                linkButtonPrev.Click += new EventHandler(LinkButton_Click);

                placeHolderPage.Controls.Add(linkButtonPrev);
            }

            if (SumPage > 11)
            {
                int startIndex = 0, endIndex = 0, diffStart = 0, diffEnd = 0;


                startIndex = CurrentPage - 5;
                if (startIndex < 1)
                {
                    diffStart = 5 - CurrentPage;
                    startIndex = 1;
                }

                endIndex = CurrentPage + 5;
                if (endIndex > SumPage)
                {
                    diffEnd = endIndex - SumPage;
                    endIndex = SumPage;
                }

                for (int i = startIndex - diffEnd; i <= endIndex + diffStart; i++)
                {
                    LinkButton linkButton = new LinkButton();
                    linkButton.Text = i.ToString();

                    if (i == CurrentPage)
                    {
                        linkButton.CssClass = "on";
                        linkButton.Enabled = false;
                    }
                    else
                    {
                        linkButton.Click += new EventHandler(LinkButton_Click);
                    }
                    linkButton.ID = i.ToString();
                    placeHolderPage.Controls.Add(linkButton);
                }
            }
            else
            {
                for (int i = 1; i <= SumPage; i++)
                {
                    LinkButton linkButton = new LinkButton();
                    linkButton.Text = i.ToString();

                    if (i == CurrentPage)
                    {
                        linkButton.CssClass = "on";
                        linkButton.Enabled = false;
                    }
                    else
                    {
                        linkButton.Click += new EventHandler(LinkButton_Click);
                    }
                    linkButton.ID = i.ToString();
                    placeHolderPage.Controls.Add(linkButton);
                }


            }

            if (SumPage > 1 && CurrentPage < SumPage)
            {
                LinkButton linkButtonNext = new LinkButton();
                linkButtonNext.Text = "&gt;";
                linkButtonNext.ID = Convert.ToInt32(NavigationName.Next).ToString();
                linkButtonNext.Click += new EventHandler(LinkButton_Click);

                placeHolderPage.Controls.Add(linkButtonNext);

                LinkButton linkButtonLast = new LinkButton();
                linkButtonLast.Text = "&raquo;";
                linkButtonLast.ID = Convert.ToInt32(NavigationName.Last).ToString();
                linkButtonLast.Click += new EventHandler(LinkButton_Click);

                placeHolderPage.Controls.Add(linkButtonLast);
            }
        }

        private void FillEvent()
        {
            if (CurrentPage > 1 && SumPage > 1)
            {
                LinkButton linkButtonFirst = placeHolderPage.FindControl(Convert.ToInt32(NavigationName.First).ToString()) as LinkButton;
                linkButtonFirst.Click += new EventHandler(LinkButton_Click);

                LinkButton linkButtonPrev = placeHolderPage.FindControl(Convert.ToInt32(NavigationName.Prev).ToString()) as LinkButton;
                linkButtonPrev.Click += new EventHandler(LinkButton_Click);

            }

            for (int i = 1; i <= SumPage; i++)
            {
                LinkButton linkButton = placeHolderPage.FindControl(i.ToString()) as LinkButton;
                linkButton.Text = i.ToString();

                if (linkButton.Enabled)
                {
                    linkButton.Click += new EventHandler(LinkButton_Click);
                }
            }

            if (SumPage > 1 && CurrentPage < SumPage)
            {
                LinkButton linkButtonLast = placeHolderPage.FindControl(Convert.ToInt32(NavigationName.Last).ToString()) as LinkButton;
                linkButtonLast.Click += new EventHandler(LinkButton_Click);

                LinkButton linkButtonNext = placeHolderPage.FindControl(Convert.ToInt32(NavigationName.Next).ToString()) as LinkButton;
                linkButtonNext.Click += new EventHandler(LinkButton_Click);
            }
        }

        public override void DataBind()
        {
            if (placeHolderPage.Controls.Count > 0)
            {
                FillEvent();
            }
            else
            {
                FillPlaceHolder();
            }
        }
    }
}