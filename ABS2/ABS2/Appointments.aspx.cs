using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace ABS2
{
    public partial class Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (User.IsInRole("Admin"))
                {
                    
                   // TextBox1.Text = "User is admin";
                   

                }
                else
                {
                    
                    //TextBox1.Text = "User is not admin";
                }
            
            }
            else { }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }

        protected void calTxtBox_OnTextChanged(object sender, EventArgs e)
        {
            
        }
    }
}