using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using ABS2.BusinessObjects;

namespace ABS2.BusinessObjects
{
    public class Management
    {
        public DataSet GetConferenceRooms()
        {
            DataSet roomsInfo = new Booking().GetConferenceRooms();
            DataSet rooms = new DataSet();
            DataTable roomT = new DataTable();
            DataColumn ID = new DataColumn("ID");
            DataColumn Title = new DataColumn("Description");
            DataColumn URL = new DataColumn("");
            roomT.Columns.Add(ID);
            roomT.Columns.Add(Title);
            roomT.Columns.Add(URL);
            rooms.Tables.Add(roomT);
            return rooms;
        }
    }
}