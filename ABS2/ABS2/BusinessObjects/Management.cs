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
        public DataSet GetAllAvailableTime()
        {
            DataSet ds = new DataSet();
            DataTable dsT = ds.Tables.Add();
            dsT.Columns.Add("Value", typeof(string));
            dsT.Columns.Add("Text", typeof(string));
            for (int i = 0, t = 7; t <= 20; i++, t++) //from 07:00 to 20:00
            {
                String time = String.Format("2%d:00", t);
                dsT.Rows.Add(i, time, time);
            }
            return ds;
        }
    }
}