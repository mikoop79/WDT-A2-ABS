using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ABS2.BusinessObjects;

namespace ABS2.AdminFolder
{
    public partial class ConferenceRooms : System.Web.UI.Page
    {
        public Boolean IsEditing = false;
        Booking objBooking = new Booking();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["Cancel"] != null)
            {
                Response.Redirect(Request.Path);
            } 
            else if ( Request.Form["Save"]!=null )
            {
                saveRoom();
            }
            if (Request.QueryString.Get("roomid") != null)
            {
                this.IsEditing = true;
                if ( Convert.ToInt32(Request.QueryString.Get("roomid")) != -1)
                {
                    RoomTitle.Text = System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(Request.QueryString.Get("title")));
                    RoomID.Value = Request.QueryString.Get("roomid");
                }
            }
        }

        protected void saveRoom()
        {
            int iret = 0;
            string strBookingDays = String.Empty;
            int i = 0;
            for (i=0;i < Available.Items.Count -1;i++)
            {
                if (Available.Items[i].Selected  == true)
                {
                strBookingDays += Available.Items[i].Value + ",";
                }
            }
            iret = objBooking.updateBooking(Convert.ToInt32(RoomID.Value),Convert.ToDateTime(First.SelectedItem.Value), Convert.ToDateTime(Last.SelectedItem.Value), strBookingDays);
        }

        protected void OnGridViewRowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[3].Visible = false; // hide StartTime
            e.Row.Cells[4].Visible = false; // hide EndTime
        }
    }
}