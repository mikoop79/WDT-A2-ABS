using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ABS2.BusinessObjects
{
    public class Booking
    {
        String strCnn;
        String Name;
        SqlConnection m_DBConnection;
        SqlCommand m_Command;
        SqlTransaction m_Transaction;
        DataSet m_DataSet;
        String m_CommandText;
        int m_Timeout = 6000;
        Boolean m_bIsConnected;
        Boolean m_bInTxn;
        SqlDataAdapter c_DataAdapter;
        DataSet dsExecSelect;
        String ErrorMsg;
        int ErrorNo;


        private DataSet _ds;
        private DataTable dt;
        private int iRet;

        public DataSet GetConferenceRooms()
        {
            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_get_conference_rooms";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            dsExecSelect = new DataSet();
            c_DataAdapter = new SqlDataAdapter(m_Command);
            c_DataAdapter.Fill(dsExecSelect);
            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;
            m_bIsConnected = false;

            return dsExecSelect;
        }

        public DataSet GetBookingDetailsForEdit(int BookingID)
        {
            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_get_booking_details_for_edit";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            dsExecSelect = new DataSet();
            SqlParameter _BookingID = new SqlParameter();
            _BookingID.ParameterName = "@ID";
            _BookingID.SqlDbType = SqlDbType.Int;
            _BookingID.Size = 10;
            _BookingID.Direction = ParameterDirection.Input;
            _BookingID.Value = BookingID;
            m_Command.Parameters.Add(_BookingID);
            c_DataAdapter = new SqlDataAdapter(m_Command);
            c_DataAdapter.Fill(dsExecSelect);
            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;
            m_bIsConnected = false;

            return dsExecSelect;
        }

        public DataSet GetAvailableTime(String BookingID)
        {
            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_get_booking_availability_time";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            dsExecSelect = new DataSet();
            SqlParameter _ID = new SqlParameter();
            _ID.ParameterName = "@ID";
            _ID.SqlDbType = SqlDbType.Int;
            _ID.Size = 10;
            _ID.Direction = ParameterDirection.Input;
            _ID.Value = BookingID;
            m_Command.Parameters.Add(_ID);
            c_DataAdapter = new SqlDataAdapter(m_Command);
            c_DataAdapter.Fill(dsExecSelect);
            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;
            m_bIsConnected = false;

            return dsExecSelect;
        }

        public DataSet GetAvailableTimeList(String BookingID)
        {
            DataSet dsTemp = GetAvailableTime(BookingID);
            int start = 7; //default from 07:00 to 20:00
            int end = 20;
            try
            {
                start = Convert.ToInt32(dsTemp.Tables[0].Rows[0]["StartTime"].ToString().Substring(0, 2));
                end = Convert.ToInt32(dsTemp.Tables[0].Rows[0]["EndTime"].ToString().Substring(0, 2));
            }
            catch
            {

            }

            DataSet ds = new DataSet();
            DataTable dsT = ds.Tables.Add();
            dsT.Columns.Add("Value", typeof(string));
            dsT.Columns.Add("Text", typeof(string));
            for (int t = start; t <= end; t++)
            {
                String time = t.ToString("00") + ":00";
                dsT.Rows.Add(time, time);
            }
            return ds;
        }

        public DataSet GetAvailability(DateTime dt)
        {

            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_get_booking_availability";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            dsExecSelect = new DataSet();
            SqlParameter selDt = new SqlParameter();
            selDt.ParameterName = "@Dt";
            selDt.SqlDbType = SqlDbType.DateTime;
            selDt.Size = 20;
            selDt.Direction = ParameterDirection.Input;
            selDt.Value = dt;
            m_Command.Parameters.Add(selDt);
            c_DataAdapter = new SqlDataAdapter(m_Command);
            c_DataAdapter.Fill(dsExecSelect);
            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;
            m_bIsConnected = false;

            return dsExecSelect;

        }

        public int InsertBooking(String Title, DateTime StartTime, DateTime EndTime, String Days)
        {
            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_ins_booking";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            //dsExecSelect = new DataSet();
            SqlParameter _title = new SqlParameter();
            _title.ParameterName = "@Title";
            _title.SqlDbType = SqlDbType.VarChar;
            _title.Size = 100;
            _title.Direction = ParameterDirection.Input;
            _title.Value = Title;
            SqlParameter _startTime = new SqlParameter();
            _startTime.ParameterName = "@StartTime";
            _startTime.SqlDbType = SqlDbType.DateTime;
            _startTime.Size = 20;
            _startTime.Direction = ParameterDirection.Input;
            _startTime.Value = StartTime;
            SqlParameter _endTime = new SqlParameter();
            _endTime.ParameterName = "@EndTime";
            _endTime.SqlDbType = SqlDbType.DateTime;
            _endTime.Size = 20;
            _endTime.Direction = ParameterDirection.Input;
            _endTime.Value = EndTime;
            m_Command.Parameters.Add(_title);
            m_Command.Parameters.Add(_startTime);
            m_Command.Parameters.Add(_endTime);
            iRet = m_Command.ExecuteNonQuery();
            int BookingID = iRet;

            m_Command = null;

            m_CommandText = "usp_ins_BookingObjectWorkingDay";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;

            int i;
            for (i = 0; i < Days.Length - 1; i++)
            {
                //dsExecSelect = new DataSet();
                SqlParameter _BookingID = new SqlParameter();
                _BookingID.ParameterName = "@BookingObjectId";
                _BookingID.SqlDbType = SqlDbType.Int;
                _BookingID.Size = 10;
                _BookingID.Direction = ParameterDirection.Input;
                _BookingID.Value = BookingID;

                SqlParameter _WorkingDayID = new SqlParameter();
                _WorkingDayID.ParameterName = "@WorkingDayId";
                _WorkingDayID.SqlDbType = SqlDbType.Int;
                _WorkingDayID.Size = 20;
                _WorkingDayID.Direction = ParameterDirection.Input;
                _WorkingDayID.Value = Days[i];

                m_Command.Parameters.Add(_BookingID);
                m_Command.Parameters.Add(_WorkingDayID);

                iRet = m_Command.ExecuteNonQuery();

            }

            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;
            m_bIsConnected = false;

            return iRet;
        }

        public int UpdateBooking(int BookingID, String Title, DateTime StartTime, DateTime EndTime, String Days)
        {
            int i;
            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_updt_booking";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;

            SqlParameter _uBookingID = new SqlParameter();
            _uBookingID.ParameterName = "@ID";
            _uBookingID.SqlDbType = SqlDbType.Int;
            _uBookingID.Size = 10;
            _uBookingID.Direction = ParameterDirection.Input;
            _uBookingID.Value = BookingID;

            SqlParameter _uTitle = new SqlParameter();
            _uTitle.ParameterName = "@Title";
            _uTitle.SqlDbType = SqlDbType.NVarChar;
            _uTitle.Size = 100;
            _uTitle.Direction = ParameterDirection.Input;
            _uTitle.Value = Title;

            SqlParameter _StartTime = new SqlParameter();
            _StartTime.ParameterName = "@StartTime";
            _StartTime.SqlDbType = SqlDbType.DateTime;
            _StartTime.Size = 20;
            _StartTime.Direction = ParameterDirection.Input;
            _StartTime.Value = StartTime;

            SqlParameter _EndTime = new SqlParameter();
            _EndTime.ParameterName = "@EndTime";
            _EndTime.SqlDbType = SqlDbType.DateTime;
            _EndTime.Size = 20;
            _EndTime.Direction = ParameterDirection.Input;
            _EndTime.Value = EndTime;

            m_Command.Parameters.Add(_uBookingID);
            m_Command.Parameters.Add(_uTitle);
            m_Command.Parameters.Add(_StartTime);
            m_Command.Parameters.Add(_EndTime);

            iRet = m_Command.ExecuteNonQuery();

            m_Command = null;

            m_CommandText = "usp_del_BookingObjectWorkingDay";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;

            SqlParameter _dBookingID = new SqlParameter();
            _dBookingID.ParameterName = "@BookingObjectId";
            _dBookingID.SqlDbType = SqlDbType.Int;
            _dBookingID.Size = 10;
            _dBookingID.Direction = ParameterDirection.Input;
            _dBookingID.Value = BookingID;

            m_Command.Parameters.Add(_dBookingID);

            iRet = m_Command.ExecuteNonQuery();

            m_Command = null;

            m_CommandText = "usp_ins_BookingObjectWorkingDay";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;


            for (i = 0; i < Days.Length - 1; i++)
            {
                //dsExecSelect = new DataSet();
                SqlParameter _BookingID = new SqlParameter();
                _BookingID.ParameterName = "@BookingObjectId";
                _BookingID.SqlDbType = SqlDbType.Int;
                _BookingID.Size = 10;
                _BookingID.Direction = ParameterDirection.Input;
                _BookingID.Value = BookingID;

                SqlParameter _WorkingDayID = new SqlParameter();
                _WorkingDayID.ParameterName = "@WorkingDayId";
                _WorkingDayID.SqlDbType = SqlDbType.Int;
                _WorkingDayID.Size = 20;
                _WorkingDayID.Direction = ParameterDirection.Input;
                _WorkingDayID.Value = Days[i];

                m_Command.Parameters.Add(_BookingID);
                m_Command.Parameters.Add(_WorkingDayID);

                iRet = m_Command.ExecuteNonQuery();

            }

            return iRet;
        }

    }
}