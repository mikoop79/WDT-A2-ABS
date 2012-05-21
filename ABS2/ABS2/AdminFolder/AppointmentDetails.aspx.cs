using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ABS2.BusinessObjects;
using System.Data.SqlClient;
using System.Data;

namespace ABS2.AdminFolder
{
    public partial class AppointmentDetails : System.Web.UI.Page
    {
        Appointment objAppointment =  new Appointment();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString.Get("roomid")) != -1)
            {
                RoomID.Value = Request.QueryString.Get("roomid");
                PopulateValues();
            }
        }

        public void PopulateValues()
        {
            DataSet ds = new DataSet();
            ds = objAppointment.GetAppointmentsDetailsOfParticularAppointment(Convert.ToInt32(RoomID.Value));
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataTable table = ds.Tables[0];
                foreach (DataRow row in table.Rows)
                {
                lblAppVenue.Text = Convert.ToString(row["Title"]);
                lblAppDate.Text = Convert.ToString(row["AppointmentDate"]); 
                lblAppStartTime.Text= Convert.ToString(row["StartTime"]);
                lblAppEndTime.Text = Convert.ToString(row["EndTime"]);
                lblAppUser.Text = Convert.ToString(row["UserName"]);
                }
                
            }
        }
    }
}