using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ABS2.BusinessObjects
{
    public class Appointment
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

        //This method is to check whether the record exists in the database or not. It needs to be called before inserting the appointment.
        //The stored procedure returns a column "Return_Value" with a value of -1(If a record already exists) OR 1(If it doesn't exists).
        //Hence if that return_value is 1 then we can proceed with executing the method InsertAppointment
        public DataSet CheckForDuplicateAppointment(String UserName, DateTime StartDate, DateTime EndDate, int BookingObjectID)
        {
            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_check_for_duplicate_Appointment";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            dsExecSelect = new DataSet();
            SqlParameter _UserName = new SqlParameter();
            _UserName.ParameterName = "@UserName";
            _UserName.SqlDbType = SqlDbType.NVarChar;
            _UserName.Size = 256;
            _UserName.Direction = ParameterDirection.Input;
            _UserName.Value = UserName;
            SqlParameter _StartDate = new SqlParameter();
            _StartDate.ParameterName = "@StartDate";
            _StartDate.SqlDbType = SqlDbType.DateTime;
            _StartDate.Size = 30;
            _StartDate.Direction = ParameterDirection.Input;
            _StartDate.Value = StartDate;
            SqlParameter _EndDate = new SqlParameter();
            _EndDate.ParameterName = "@EndDate";
            _EndDate.SqlDbType = SqlDbType.DateTime;
            _EndDate.Size = 30;
            _EndDate.Direction = ParameterDirection.Input;
            _EndDate.Value = EndDate;
            SqlParameter _BookingObjectID = new SqlParameter();
            _BookingObjectID.ParameterName = "@BookingObjectId";
            _BookingObjectID.SqlDbType = SqlDbType.Int;
            _BookingObjectID.Size = 10;
            _BookingObjectID.Direction = ParameterDirection.Input;
            _BookingObjectID.Value = BookingObjectID;
            m_Command.Parameters.Add(_UserName);
            m_Command.Parameters.Add(_StartDate);
            m_Command.Parameters.Add(_EndDate);
            m_Command.Parameters.Add(_BookingObjectID);
            c_DataAdapter = new SqlDataAdapter(m_Command);
            c_DataAdapter.Fill(dsExecSelect);
            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;
            m_bIsConnected = false;

            return dsExecSelect;
        }

        public int InsertAppointment(String UserName, String UserEmailAddress, DateTime StartDate, DateTime EndDate, String Comments, int BookingObjectID)
        {
            m_DBConnection = new SqlConnection();
            strCnn = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();

            m_CommandText = "usp_ins_Appointment";
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            //dsExecSelect = new DataSet();
            SqlParameter _UserName = new SqlParameter();
            _UserName.ParameterName = "@UserName";
            _UserName.SqlDbType = SqlDbType.NVarChar;
            _UserName.Size = 256;
            _UserName.Direction = ParameterDirection.Input;
            _UserName.Value = UserName;
            SqlParameter _UserEmailAddress = new SqlParameter();
            _UserEmailAddress.ParameterName = "@UserEmailAddress";
            _UserEmailAddress.SqlDbType = SqlDbType.NVarChar;
            _UserEmailAddress.Size = 256;
            _UserEmailAddress.Direction = ParameterDirection.Input;
            _UserEmailAddress.Value = UserEmailAddress;
            SqlParameter _StartDate = new SqlParameter();
            _StartDate.ParameterName = "@StartDate";
            _StartDate.SqlDbType = SqlDbType.DateTime;
            _StartDate.Size = 30;
            _StartDate.Direction = ParameterDirection.Input;
            _StartDate.Value = StartDate;
            SqlParameter _EndDate = new SqlParameter();
            _EndDate.ParameterName = "@EndDate";
            _EndDate.SqlDbType = SqlDbType.DateTime;
            _EndDate.Size = 30;
            _EndDate.Direction = ParameterDirection.Input;
            _EndDate.Value = EndDate;
            SqlParameter _Comments = new SqlParameter();
            _Comments.ParameterName = "@Comments";
            _Comments.SqlDbType = SqlDbType.NVarChar;
            _Comments.Size = 500;
            _Comments.Direction = ParameterDirection.Input;
            _Comments.Value = Comments;
            SqlParameter _BookingObjectID = new SqlParameter();
            _BookingObjectID.ParameterName = "@BookingObjectId";
            _BookingObjectID.SqlDbType = SqlDbType.Int;
            _BookingObjectID.Size = 10;
            _BookingObjectID.Direction = ParameterDirection.Input;
            _BookingObjectID.Value = BookingObjectID;
            m_Command.Parameters.Add(_UserName);
            m_Command.Parameters.Add(_UserEmailAddress);
            m_Command.Parameters.Add(_StartDate);
            m_Command.Parameters.Add(_EndDate);
            m_Command.Parameters.Add(_Comments);
            m_Command.Parameters.Add(_BookingObjectID);
            iRet = m_Command.ExecuteNonQuery();
            m_DBConnection.Close();
            m_DBConnection = null;
            m_Command = null;
            m_bIsConnected = false;

            return iRet;
        }
    }
}