using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using ABS2.BusinessObjects;
using System.Data.SqlClient;
using System.Configuration;

namespace ABS2.BusinessObjects
{
    public class Management
    {
        public static DataSet GetAllAvailableTime()
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

        public static HashSet<String> GetSelectDay(int bookingID)
        {
            SqlConnection m_DBConnection = new SqlConnection();
            String strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            String m_CommandText = "usp_get_booking_working_day";
            SqlCommand m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            int m_Timeout = 6000;
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            DataSet dsExecSelect = new DataSet();
            SqlParameter selDt = new SqlParameter();
            selDt.ParameterName = "@ID";
            selDt.SqlDbType = SqlDbType.Int;
            selDt.Size = 20;
            selDt.Direction = ParameterDirection.Input;
            selDt.Value = bookingID;
            m_Command.Parameters.Add(selDt);
            SqlDataAdapter c_DataAdapter = new SqlDataAdapter(m_Command);
            c_DataAdapter.Fill(dsExecSelect);
            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;

            

            HashSet<String> selectedDay = new HashSet<String>();
            foreach (DataRow r in dsExecSelect.Tables[0].Rows)
            {
                selectedDay.Add(r["WorkingDayId"].ToString());
            }
            return selectedDay;
        }
    }
}