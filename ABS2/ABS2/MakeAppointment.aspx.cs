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
            if (Request.QueryString.Get("RoomID") != null)
            {
                FRoomID.SelectedIndex = Convert.ToInt32(Request.QueryString.Get("RoomID"));
                MakeAppointmentWizard.ActiveStepIndex = 1;
            }
            if (Request.QueryString.Get("StartDate") != null)
            {
                //TODO set select date
                MakeAppointmentWizard.ActiveStepIndex = 2;
            }
            if (Request.QueryString.Get("Time") != null)
            {
                //TODO set select time
                MakeAppointmentWizard.ActiveStepIndex = 3;
            }

            FRoomIDUpdate.Value = FRoomID.SelectedValue; //for Time Object source

            if (MakeAppointmentWizard.ActiveStepIndex == 3)
            {
                Feedback.Text = "";
            }
            else if (MakeAppointmentWizard.ActiveStepIndex == 4)
            {
                SummaryRoom.Text = FRoomID.SelectedItem.Text;
                SummaryDate.Text = FDate.SelectedDate.ToShortDateString();
                SummaryTime.Text = FTime.SelectedItem.Text;
                SummaryComment.Text = FComment.Text;
            }
        }

        protected void Date_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void MakeAppointmentWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
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

        protected Boolean saveAppointment()
        {
            int RoomID = Convert.ToInt32(FRoomID.Text);
            String date = FDate.SelectedDate.ToShortDateString();
            String time = FTime.SelectedItem.Text;
            String comment = FComment.Text;

            DateTime StartDate = Convert.ToDateTime(date);
            int timeInt = Convert.ToInt32(time.Substring(0, 2));
            StartDate = StartDate.AddHours(timeInt);
            DateTime EndDate = StartDate.AddHours(1);

            MembershipUser mu = Membership.GetUser();
            String email = mu.Email;
            String username = mu.UserName;

            int returnValue = new Appointment().InsertAppointment(username, email, StartDate, EndDate, comment, RoomID);
            return returnValue != 0;

        }
    }
}