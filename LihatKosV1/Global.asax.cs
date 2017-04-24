using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace LihatKosV1
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }
        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.MapPageRoute("",
            //    "Category/{action}/{categoryName}",
            //    "~/categoriespage.aspx");
            //routes.MapPageRoute("",
            //    "",
            //    "~/Default.aspx");
            routes.MapPageRoute("",
                "CariLokasi",
                "~/CariLokasi.aspx");
            routes.MapPageRoute("",
                "Register",
                "~/RegisterForm.aspx");
            routes.MapPageRoute("",
                "Login",
                "~/LoginForm.aspx");
            routes.MapPageRoute("",
                "DaftarKos",
                "~/DaftarKos.aspx");
            routes.MapPageRoute("",
                "EditKos",
                "~/DaftarKos.aspx");
            routes.MapPageRoute("",
                "DetailKos",
                "~/DetailKos.aspx");
            routes.MapPageRoute("",
                "FormApproval",
                "~/FormApproval.aspx");
            routes.MapPageRoute("",
                "FormUser",
                "~/Admin/FormUser.aspx");
            routes.MapPageRoute("",
                "FormBanner",
                "~/Admin/FormBanner.aspx");
            routes.MapPageRoute("",
                "UploadFoto",
                "~/UploadFoto.aspx");
            routes.MapPageRoute("",
                "EmailConfirmation",
                "~/EmailConfirmation.aspx");
            routes.MapPageRoute("",
                "Logout",
                "~/Logout.aspx");
        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("id-ID");
            Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture("id-ID");
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}