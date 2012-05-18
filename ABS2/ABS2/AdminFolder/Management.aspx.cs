using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ABS2.AdminFolder
{
    public partial class Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                //LoginStatus2.Text = "<li><a href='Logout.aspx' LogoutPageUrl='~/Logout.aspx' runat='server' >Logout</a></li>";
                //if (HttpContext.Current.User.Identity.GetType) {
                Object role = User.Identity.AuthenticationType;
                Console.Write(role.ToString());
               // }
                
            }
            else
            {
                //LoginStatus2.Text = "<li><a href='Login.aspx'>Login</a></li>";    
                Object role = User.Identity.AuthenticationType;
                Console.Write(role.ToString());
            }

        }
    }
}