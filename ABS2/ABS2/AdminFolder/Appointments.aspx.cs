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
            if (!Page.IsPostBack)
            {
                calTxtBox.Text = DateTime.Now.Date.AddDays(-2.00).ToString("yyyy-MM-dd");
                getAppointments();
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (calTxtBox.Text != null) {

                DateTime Date = Convert.ToDateTime(calTxtBox.Text);
                getAppointments();
            }

        }

        protected void getAppointments()
        {
            ObjectDataSource1.DataBind();
            grdAppointmentDetails.DataBind();
            grdAppointmentDetails.Visible = true;

            //btnSearch.Text = ap.GetAllAppointmentsForDate(Date).ToString();
        }

        protected void calTxtBox_OnTextChanged(object sender, EventArgs e)
        {
            if (calTxtBox.Text != null)
            {

                DateTime Date = Convert.ToDateTime(calTxtBox.Text);

                getAppointments();
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (calTxtBox.Text != null)
            {

                DateTime Date = Convert.ToDateTime(calTxtBox.Text);

                getAppointments();
            }
        }

        protected void grdAppointmentDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                String AppointmentID = Convert.ToString(grdAppointmentDetails.DataKeys[e.Row.RowIndex].Values[0]);
                String Title = Convert.ToString(grdAppointmentDetails.DataKeys[e.Row.RowIndex].Values[2]);
                String UserName = Convert.ToString(grdAppointmentDetails.DataKeys[e.Row.RowIndex].Values[3]);
                String AppointmentDate = Convert.ToString(grdAppointmentDetails.DataKeys[e.Row.RowIndex].Values[4]);
                String StartTime = Convert.ToString(grdAppointmentDetails.DataKeys[e.Row.RowIndex].Values[5]);
                String EndTime = Convert.ToString(grdAppointmentDetails.DataKeys[e.Row.RowIndex].Values[6]);

                Label gridviewLbl = e.Row.FindControl("grdLbl") as Label;
                gridviewLbl.Text = "Appointment with " + Title + " for " + UserName + " from " + AppointmentDate + " " + StartTime + " to " + EndTime;

                HyperLink gridviewHyperLnk = e.Row.FindControl("grdHyperLink") as HyperLink;
                gridviewHyperLnk.NavigateUrl = "~/AdminFolder/AppointmentDetails.aspx?roomid=" + AppointmentID;
 
            }
        }

        

        
    }
}