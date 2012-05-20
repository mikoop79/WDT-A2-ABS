using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABS2
{
    public partial class MakeAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (MakeAppointmentWizard.ActiveStepIndex == 4)
            {
                SummaryRoom.Text = RoomID.SelectedItem.Text;
                SummaryDate.Text = Date.SelectedDate.ToShortDateString(); ;
                SummaryTime.Text = Time.SelectedItem.Text;
                SummaryComment.Text = Comment.Text;
            }
        }

        protected void Date_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}