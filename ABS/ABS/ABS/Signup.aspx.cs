using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABS
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void wizard_CreatingUser(object sender, LoginCancelEventArgs e)
        {
            //e.Cancel = ((CreateUserWizard)sender).UserName.Contains("!@#$%^&");
            e.Cancel = true;
        }


    }
}