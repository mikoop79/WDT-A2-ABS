using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using ABS2.BusinessObjects;

namespace ABS2.AdminFolder
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (calTxtBox.Text != null) {

                DateTime Date = Convert.ToDateTime(calTxtBox.Text);

                getAppointments(Date);
            }

        }

        protected void getAppointments(DateTime Date)
        {
            Appointment ap = new Appointment();
            ap.GetAllAppointmentsForDate(Date);

            btnSearch.Text = ap.GetAllAppointmentsForDate(Date).ToString();
        }

        protected void calTxtBox_OnTextChanged(object sender, EventArgs e)
        {
            if (calTxtBox.Text != null)
            {

                DateTime Date = Convert.ToDateTime(calTxtBox.Text);

                getAppointments(Date);
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (calTxtBox.Text != null)
            {

                DateTime Date = Convert.ToDateTime(calTxtBox.Text);

                getAppointments(Date);
            }
        }

        

        
    }
}