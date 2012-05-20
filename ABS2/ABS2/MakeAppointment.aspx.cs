using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ABS2
{
    public partial class MakeAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

                
            }
        }

        protected void Date_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void MakeAppointmentWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {

            
            MembershipUser mu = Membership.GetUser();
            string email = mu.Email;
            string username = mu.UserName;



        }
    }
}