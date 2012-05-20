using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ABS2.BusinessObjects;
using ABS2.BusinessObjects;
using System.Data.SqlClient;
using System.Data;

namespace ABS2
{
    public partial class MakeAppointment : System.Web.UI.Page
    {

        String Email;
        String Username;
        DateTime StartDate;
        DateTime EndDate;
        String Comments;
        int BookingObjectID;



        protected void Page_Load(object sender, EventArgs e)

        {

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (Request.QueryString.Get("roomid") != null)
                {
                    RoomID.SelectedIndex = Convert.ToInt32(Request.QueryString.Get("roomid"));
                    MakeAppointmentWizard.ActiveStepIndex = 1;
                }
                if (Request.QueryString.Get("date") != null)
                {
                    //TODO set select date
                    MakeAppointmentWizard.ActiveStepIndex = 2;
                }
                if (Request.QueryString.Get("time") != null)
                {
                    //TODO set select time
                    MakeAppointmentWizard.ActiveStepIndex = 3;
                }

                if (MakeAppointmentWizard.ActiveStepIndex == 4)
                {
                    SummaryRoom.Text = RoomID.SelectedItem.Text;
                    SummaryDate.Text = Date.SelectedDate.ToShortDateString();
                    SummaryTime.Text = Time.SelectedItem.Text;
                    SummaryComment.Text = Comment.Text;
                    
                    DateTime StartTime = Convert.ToDateTime(Time.SelectedItem.Text);
                    DateTime EndTime = Convert.ToDateTime(Date.SelectedDate.ToShortDateString());
                    String Comments = Comment.Text;
                    int BookingObjectID  = Convert.ToInt32(Request.QueryString.Get("roomid"));

                }
            }
            else
            {
                Response.Redirect("~/Login.aspx?message=You need to be logged in to make a booking.");
            }
        }

        protected void Date_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void MakeAppointmentWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            MakeAppointmentWizard.DisplaySideBar = false;
            MakeAppointmentWizard.Enabled = false;
            Saved.Text = "Thank you! Your appointment has been made successfully.";
            saveAppointment();
        }

        protected void saveAppointment()
        {
            Saved.Text = Request.Form["RoomID"];
            Saved.Text = Request.Form["Date"];
            Saved.Text = Request.Form["Time"];
            Saved.Text = Request.Form["Comment"];

            /*
            MembershipUser mu = Membership.GetUser();
<<<<<<< HEAD
            string email = mu.Email;
            string username = mu.UserName;
             */
=======
            Email = mu.Email;
            Username = mu.UserName;
            Appointment ap = new Appointment();
           
            ap.InsertAppointment(Username, Email, StartDate, EndDate, Comments, BookingObjectID);


>>>>>>> Appointment booking attempt

        }
    }
}