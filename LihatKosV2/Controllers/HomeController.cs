using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;

namespace LihatKosV2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";
            var addr = GetVisitorIPAddress();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        /// <summary>
        /// method to get Client ip address
        /// </summary>
        /// <param name="GetLan"> set to true if want to get local(LAN) Connected ip address</param>
        /// <returns></returns>
        public static string GetVisitorIPAddress(bool GetLan = false)
        {
            var context = System.Web.HttpContext.Current;
            string visitorIPAddress = String.Empty;

            if (context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                visitorIPAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            else if (!String.IsNullOrWhiteSpace(context.Request.UserHostAddress))
                visitorIPAddress = context.Request.UserHostAddress;
                  
            if (string.IsNullOrEmpty(visitorIPAddress) || visitorIPAddress.Trim() == "::1")
            {
                GetLan = true;
                visitorIPAddress = string.Empty;
            }

            if (GetLan)
            {
                if (string.IsNullOrEmpty(visitorIPAddress))
                {
                    //This is for Local(LAN) Connected ID Address
                    string stringHostName = Dns.GetHostName();
                    //Get Ip Host Entry
                    IPHostEntry ipHostEntries = Dns.GetHostEntry(stringHostName);
                    //Get Ip Address From The Ip Host Entry Address List
                    IPAddress[] arrIpAddress = ipHostEntries.AddressList;

                    try
                    {
                        visitorIPAddress = arrIpAddress[arrIpAddress.Length - 2].ToString();
                    }
                    catch
                    {
                        try
                        {
                            visitorIPAddress = arrIpAddress[0].ToString();
                        }
                        catch
                        {
                            try
                            {
                                arrIpAddress = Dns.GetHostAddresses(stringHostName);
                                visitorIPAddress = arrIpAddress[0].ToString();
                            }
                            catch
                            {
                                visitorIPAddress = "127.0.0.1";
                            }
                        }
                    }
                }
            }
            return visitorIPAddress;
        }
    }
}
