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

        protected void AvailableBound(object sender, System.EventArgs e)
        {
            int bookingID = GetBookingID();
            if (bookingID == -1)
                return;
            HashSet<String> selectedDay = Management.GetSelectDay(bookingID);
            foreach(ListItem li in Available.Items)
            {
                if (selectedDay.Contains(li.Value))
                {
                    li.Selected = true;
                }
            }
        }

        protected void FirstBound(object sender, System.EventArgs e)
        {
            int bookingID = GetBookingID();
            if (bookingID == -1)
                return;
             foreach(GridViewRow r in GridView1.Rows)
             {
                 if (Convert.ToInt32(r.Cells[1].Text) == bookingID)
                 {
                     String time = ConvertTimeString(r.Cells[3].Text); //StartTime
                     First.ClearSelection();
                     First.Items.FindByText(time).Selected = true;
                     break;
                 }
             }
        }

        protected void LastBound(object sender, System.EventArgs e)
        {
            int bookingID = GetBookingID();
            if (bookingID == -1)
                return;
            foreach (GridViewRow r in GridView1.Rows)
            {
                if (Convert.ToInt32(r.Cells[1].Text) == bookingID)
                {
                    String time = ConvertTimeString(r.Cells[4].Text); //EndTime
                    Last.ClearSelection();
                    Last.Items.FindByText(time).Selected = true;
                    break;
                }
            }
        }

        private String ConvertTimeString(String s)
        {
            DateTime dt = Convert.ToDateTime(s);
            int hour = dt.Hour;
            int min = dt.Minute;
            return hour.ToString("00") + ":" + min.ToString("00");
        }

        private int GetBookingID()
        {
            if (RoomID.Value == "")
                return -1;
            int bookingID = Convert.ToInt32(RoomID.Value);
            return bookingID;
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
            iret = objBooking.updateBooking(GetBookingID(), Convert.ToDateTime(First.SelectedValue), Convert.ToDateTime(Last.SelectedValue), strBookingDays);
        }

        protected void OnGridViewRowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[3].Visible = false; // hide StartTime
            e.Row.Cells[4].Visible = false; // hide EndTime
        }
    }
}