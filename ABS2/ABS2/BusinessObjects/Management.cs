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
            for (int t = 7; t <= 20; t++) //from 07:00 to 20:00
            {
                String time = t.ToString("00")+":00";
                dsT.Rows.Add("1900-01-01 "+time+":00.000", time);
            }
            return ds;
        }
    }
}