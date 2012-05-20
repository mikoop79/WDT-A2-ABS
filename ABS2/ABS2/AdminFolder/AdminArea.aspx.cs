using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABS2.AdminFolder
{
    public partial class AdminArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {

                if (User.IsInRole("Admin"))
                {
                    
                    //Response.Redirect("/AdminArea.aspx");



                }
                else
                {
                    Response.Redirect("~/AdminFolder/AdminLogin.aspx?message=You are not authourised for this content.");
                }

            }

            else
            {

                Response.Redirect("~/AdminFolder/AdminLogin.aspx?message=You are not authourised for this content.");
            }
        }
    }
}