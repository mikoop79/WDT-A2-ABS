using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ABS2.BusinessObjects;

namespace ABS2
{
    public partial class MakeAppointment : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {

                FDateBound();
                FRoomIDUpdate.Value = FRoomID.SelectedValue; //for Time Object source

                if (MakeAppointmentWizard.ActiveStepIndex == 4)
                {
                    Feedback.Text = "";
                }
                if (MakeAppointmentWizard.ActiveStepIndex == 4)
                {
                    SummaryRoom.Text = FRoomID.SelectedItem.Text;
                    SummaryDate.Text = FDate.SelectedDate.ToShortDateString();
                    SummaryTime.Text = FTime.SelectedItem.Text;
                    SummaryComment.Text = FComment.Text;
                }

            }

           

            

            else
            {

                Response.Redirect("~/Login.aspx?message=You must login to book an event.");
            }
        }

        protected void FRoomIDBound(object sender, System.EventArgs e)
        {
            if (Request.QueryString.Get("RoomID") != null)
            {
                FRoomID.ClearSelection();
                FRoomID.Items.FindByValue(Request.QueryString.Get("RoomID")).Selected = true;
                FRoomIDUpdate.Value = FRoomID.SelectedValue;
            }
        }

        protected void FDateBound()
        {
            if (Request.QueryString.Get("StartDate") != null)
            {
                try
                {
                    String[] times = Request.QueryString.Get("StartDate").Replace('-', '/').Split('/');
                    FDate.SelectedDate = Convert.ToDateTime(times[2] + "/" + times[1] + "/" + times[0]);
                }
                catch
                {

                }
            }
        }

        protected void FTimeBound(object sender, System.EventArgs e)
        {
            if (Request.QueryString.Get("Time") != null)
            {
                try
                {
                    FTime.ClearSelection();
                    String time = Convert.ToInt32(Request.QueryString.Get("Time")).ToString("00") + ":00";
                    FTime.Items.FindByValue(time).Selected = true;
                }
                catch
                {

                }
            }
        }

        protected void Date_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void MakeAppointmentWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (saveAppointment())
                {
                    MakeAppointmentWizard.DisplaySideBar = false;
                    MakeAppointmentWizard.Enabled = false;
                    Feedback.Text = "Thank you! Your appointment has been made successfully.";
                }
                else
                {
                    Feedback.Text = "Sorry, your booking is not available. Please check your date!";
                }
            }
            else
            {
                Feedback.Text = "Sorry, please login!";
            }
        }

        protected Boolean saveAppointment()
        {
            int RoomID = Convert.ToInt32(FRoomID.SelectedValue);
            String date = FDate.SelectedDate.ToShortDateString();
            String time = FTime.SelectedValue;
            String comment = FComment.Text;

            DateTime StartDate = Convert.ToDateTime(date);
            int timeInt = Convert.ToInt32(time.Substring(0, 2));
            StartDate = StartDate.AddHours(timeInt);
            DateTime EndDate = StartDate.AddHours(1);

            MembershipUser mu = Membership.GetUser();
            String email = mu.Email;
            String username = mu.UserName;

            Appointment app = new Appointment();
            if (!app.CheckForDuplicateAppointment(StartDate, EndDate, RoomID))
                return false;

            int returnValue = app.InsertAppointment(username, email, StartDate, EndDate, comment, RoomID);
            return returnValue != 0;
        }
    }
}