using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ABS.BusinessObjects
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
            //DBUtil objDBUtil = new DBUtil();
           // objDBUtil.Name = "usp_get_conference_rooms";
            //_ds = objDBUtil.ExecSelect();
            //return _ds;
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

        public DataSet GetAvailableTime(String roomID, DateTime dt)
        {
            return null;
        }

        public int InsertConferenceRoom(List<SqlParameter> param)
        {
            //DBUtil objDBUtil = new DBUtil();
            //objDBUtil.Name = "usp_ins_booking";
            //iRet = objDBUtil.ExecUpdate(param);
            return iRet;
        }

        //public DataSet getAvailability(List<SqlParameter> param)
        //{
        //    DBUtil objDBUtil = new DBUtil();
        //    objDBUtil.Name = "usp_get_booking_availability";
        //    _ds = objDBUtil.ExecSelect(param);
        //    return _ds;
        //}

        public DataSet GetAvailability(DateTime dt)
        {
         
            m_DBConnection = new SqlConnection();
            strCnn = "Data Source=Data Source=WIN-BOP3PF3J8CC\SQLEXPRESSRMIT;Initial Catalog=BookingSystemDB;Integrated Security=True;User ID=sa;Password=cp12";
            //strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
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

        public int InsertBooking(String Title,DateTime StartTime,DateTime EndTime)
        {
            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_ins_booking";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            dsExecSelect = new DataSet();
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
            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;
            m_bIsConnected = false;
            
            return iRet;
        }

        
    }
}