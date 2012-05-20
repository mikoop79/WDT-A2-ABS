using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABS2.AdminFolder
{
    public partial class ConferenceRooms : System.Web.UI.Page
    {
        public Boolean IsEditing = false;

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
            Label1.Text = "TODO";
            //Request.Form["RoomTitle"]
            //Request.Form["RoomID"]
            //Request.Form["First"]
            //Request.Form["Last"]
            //Request.Form["Available"]
        }

        protected void OnGridViewRowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[3].Visible = false; // hide StartTime
            e.Row.Cells[4].Visible = false; // hide EndTime
        }
    }
}