using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABS2.Controls
{
    public partial class AdminNavControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                LoginStatus2.Text = "<li><a href='../Logout.aspx' LogoutPageUrl='../Logout.aspx' runat='server' >Logout</a></li>";
            }
            else
            {
                LoginStatus2.Text = "<li><a href=\"~/AdminFolder/AdminLogin.aspx\">Login</a></li>";
            }


           
        }
    }
}