using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Microsoft.CSharp;

namespace ABS.BusinessObjects
{
    public class DBUtil
    {
        private static string connStr;
        private String strCnn;
        public String Name;
        private SqlConnection m_DBConnection;
        private SqlCommand m_Command;
        private SqlTransaction m_Transaction;
        private DataSet m_DataSet;
        private String m_CommandText;
        private static int m_Timeout = 6000;
        private Boolean m_bIsConnected;
        private Boolean m_bInTxn;
        SqlDataAdapter c_DataAdapter;
        DataSet dsExecSelect;
        public String ErrorMsg;
        public int ErrorNo;

       
        private String conStr()
        {
            connStr = ConfigurationManager.ConnectionStrings["appConnectionString"].ConnectionString;
            return connStr;
        }

        /******************************************************************
        ' Connect() Method
        '
        ' Purpose:  The Connect method is used to connect to the database
        ' Used in : DBUtil.vb => ExecUpdate
        '******************************************************************/
        public void Connect(Boolean Transaction_Flag, string strCnn = "")
        {
            m_DBConnection = new SqlConnection();
            strCnn = conStr();
            m_DBConnection.ConnectionString = strCnn;
            m_DBConnection.Open();
            //if (String.Compare(strCnn,String.Empty) == 0))
            //{
            //strCnn = conStr();
            //}
            //m_DBConnection.ConnectionString = strCnn;
            if (Transaction_Flag)
            {
                m_Transaction = m_DBConnection.BeginTransaction();
                m_Command = new SqlCommand("", m_DBConnection, m_Transaction);
            }
            m_bIsConnected = true;
        }


        /******************************************************************
        ' DisConnect() Method
        '
        ' Purpose:  The DisConnect method is used to DisConnect to the database
        ' Used in : DBUtil.vb => ExecUpdate, ExecSelect, GetMetaData...etc.
        '******************************************************************/
        public void DisConnect()
        {
            if (m_bIsConnected)
            {
                m_DBConnection.Close();
                m_DBConnection = null;
                m_Command = null;
                m_bIsConnected = false;
            }
        }


        /******************************************************************
        ' SetComplete() Method
        '
        ' Purpose:  The SetComplete method is used to commit the transaction.
        ' This is required when we are executing ExecUpdate(), when we need 
        ' to complete all changes done.
        '******************************************************************/
        public void SetComplete()
        {
            m_Transaction.Commit();
        }


        /******************************************************************
        ' SetComplete() Method
        '
        ' Purpose:  The SetComplete method is used to commit the transaction.
        ' This is required when we are executing ExecUpdate(), when we need 
        ' to complete all changes done.
        '******************************************************************/
        public void SetAbort()
        {
            m_Transaction.Rollback();
        }



        /******************************************************************
        ' ExecUpdate() Method
        '
        ' Purpose:  The ExecUpdate method is used to execute the procs which
        '           modify the data in the database. It returns an Integer value
        '           which is either an error no or some prmary key value.
        ' Used in : It is used in almost all the pages to execute procs.
        '******************************************************************/
        public int ExecUpdate(List<SqlParameter> param)
        {
            int iRet;
            //int i;
            //SqlCommand _m_Command_Params;
            //SqlConnection m_DBConnection_Params;

            if (!m_bIsConnected)
            {
                Connect(true);
            }

            //m_DBConnection_Params = new SqlConnection();
            //m_DBConnection_Params.ConnectionString = conStr();
            //m_DBConnection_Params.Open();
            //_m_Command_Params = new SqlCommand("", m_DBConnection_Params);

            m_CommandText = Name;
            m_Command.CommandText = m_CommandText;
            //m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;

            //_m_Command_Params.CommandText = Name;
            //_m_Command_Params.CommandTimeout = m_Timeout;
            //_m_Command_Params.CommandType = CommandType.StoredProcedure;
            //SqlCommandBuilder.DeriveParameters(_m_Command_Params);
            //_m_Command_Params.UpdatedRowSource = UpdateRowSource.None;

            //m_Command.UpdatedRowSource = UpdateRowSource.None;

            //for (i=0;i<_m_Command_Params.Parameters.Count-1;i++)
            //{
            //    m_Command.Parameters.Add(new SqlParameter());
            //    m_Command.Parameters[i].ParameterName = _m_Command_Params.Parameters[i].ParameterName;
            //    m_Command.Parameters[i].SqlDbType = _m_Command_Params.Parameters[i].SqlDbType;
            //    m_Command.Parameters[i].Size = _m_Command_Params.Parameters[i].Size;
            //    m_Command.Parameters[i].Direction = _m_Command_Params.Parameters[i].Direction;
            //    m_Command.Parameters[i].Value = _m_Command_Params.Parameters[i].Value;
            //}

            foreach (SqlParameter para in param)
            {
                m_Command.Parameters.Add(para);
            }

            
        
        //' Iterate the parameter array and form the parameter list
        //For i = 1 To (UBound(param) + 1) Step 1
        //    '' Check if the parameter is numeric. This indicates
        //    '' the type of parameter
        //    If (IsNumeric(m_Command.Parameters(i).Value)) Then
        //        m_Command.Parameters(i).Value = Int(param(i - 1))
        //    ElseIf (IsDate(m_Command.Parameters(i).Value)) Then
        //        m_Command.Parameters(i).Value = XmlConvert.ToDateTime(CStr(param(i - 1)), XmlDateTimeSerializationMode.Local)
        //    Else
        //        m_Command.Parameters(i).Value = CStr(param(i - 1))
        //    End If

        //Next i
            m_Command.ExecuteNonQuery();
            iRet = 0;
            //iRet = m_Command.Parameters[0].Value;

            m_Command.Parameters.Clear();
            //_m_Command_Params.Parameters.Clear();
            //m_DBConnection_Params.Close();

            return iRet;
        //Catch MyException As SqlException
        //   ErrorMSG = MyException.Message
        //  ErrorNo = MyException.Number
        //End Try
    }

        //public static DataTable SelectStoreProcedure(string ProcName, List<SqlParameter> ParaArr)
        //{
        //    DataTable data = new DataTable();
        //    SqlConnection cn = new SqlConnection(connectionString);
        //    cn.Open();
        //    SqlCommand cmd = new SqlCommand(ProcName, cn);
        //    foreach (SqlParameter para in ParaArr)
        //    {
        //        cmd.Parameters.Add(para);
        //    }
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    SqlDataAdapter da = new SqlDataAdapter(cmd);

        //    da.Fill(data);
        //    cn.Close();
        //    return data;
        //}

        //public static DataTable SelectStoreProcedure(string ProcName)
        //{
        //    DataTable data = new DataTable();
        //    SqlConnection cn = new SqlConnection(connectionString);
        //    cn.Open();
        //    SqlCommand cmd = new SqlCommand(ProcName, cn);

        //    cmd.CommandType = CommandType.StoredProcedure;

        //    SqlDataAdapter da = new SqlDataAdapter(cmd);

        //    da.Fill(data);
        //    cn.Close();
        //    return data;
        //}
        /******************************************************************
        ' ExecSelect() Method
        '
        ' Purpose:  The ExecSelect method is used to execute the procs which
        '           retrieve the data in the database. It returns a Dataset 
        '           object containing the results of stored procedure execution.
        ' Used in : It is used in almost all the pages to execute procs.
        '******************************************************************/
        public DataSet ExecSelect()
        {
            if (!m_bIsConnected)
            {
                Connect(false);
            }

            //CityParam = new SqlParameter();
            //CityParam.ParameterName = "@CITY";
            //CityParam.SqlDbType = SqlDbType.VarChar;
            //CityParam.Size = 15;
            //CityParam.Direction = ParameterDirection.Input;
            //CityParam.Value = "Berlin";

            //ContactParam = new SqlParameter();
            //ContactParam.ParameterName = "@CONTACT";
            //ContactParam.SqlDbType = SqlDbType.VarChar;
            //ContactParam.Size = 15;
            //ContactParam.Direction = ParameterDirection.Input;
            //ContactParam.Value = "Maria Anders";

            //foreach (SqlParameter para in param)
            //{ 

            //}

            //for (int i = 0; i < param.Length - 1; i++)
            //{
            //    param[i] = new SqlParameter();
            //    param[i].ParameterName = param[i].ParameterName;
            //    param[i].SqlDbType = "";
            //    param[i].Size = 0;
            //    param[i].Direction = ParameterDirection.Input;
            //    param[i].Value = "";
            //}
            m_CommandText = Name;
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            //SqlCommandBuilder.DeriveParameters(m_Command);
            //m_Command.UpdatedRowSource = UpdateRowSource.None;
            DataSet dsExecSelect = new DataSet();

            SqlDataAdapter c_DataAdapter = new SqlDataAdapter(m_Command);
            c_DataAdapter.Fill(dsExecSelect);
            DisConnect();

            return dsExecSelect;
        }

        public DataSet ExecSelect(List<SqlParameter> param)
        {
            if (!m_bIsConnected)
            {
                Connect(false);
            }

            //CityParam = new SqlParameter();
            //CityParam.ParameterName = "@CITY";
            //CityParam.SqlDbType = SqlDbType.VarChar;
            //CityParam.Size = 15;
            //CityParam.Direction = ParameterDirection.Input;
            //CityParam.Value = "Berlin";

            //ContactParam = new SqlParameter();
            //ContactParam.ParameterName = "@CONTACT";
            //ContactParam.SqlDbType = SqlDbType.VarChar;
            //ContactParam.Size = 15;
            //ContactParam.Direction = ParameterDirection.Input;
            //ContactParam.Value = "Maria Anders";
            m_CommandText = Name;
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;

            foreach (SqlParameter para in param)
            {
                m_Command.Parameters.Add(para);
            }

            //for (int i = 0; i < param.Length - 1; i++)
            //{
            //    param[i] = new SqlParameter();
            //    param[i].ParameterName = param[i].ParameterName;
            //    param[i].SqlDbType = "";
            //    param[i].Size = 0;
            //    param[i].Direction = ParameterDirection.Input;
            //    param[i].Value = "";
            //}

            
            //SqlCommandBuilder.DeriveParameters(m_Command);
            //m_Command.UpdatedRowSource = UpdateRowSource.None;
            DataSet dsExecSelect = new DataSet();

            SqlDataAdapter c_DataAdapter = new SqlDataAdapter(m_Command);

            c_DataAdapter.Fill(dsExecSelect);
            DisConnect();
            return dsExecSelect;
        }

        /******************************************************************
        ' GenerateSelectCommand() Method
        '
        ' Purpose:  The GenerateSelectCommand method accepts a String array
        '           and then using these parameters forms a command object.
        '           and returns this command object.
        ' Used in : ExecSelect.
        '******************************************************************/
        public SqlCommand GenerateSelectCommand(List<SqlParameter> param)
        {
            m_CommandText = Name;
            m_Command = new SqlCommand(m_CommandText, m_DBConnection);
            m_Command.CommandTimeout = m_Timeout;
            m_Command.CommandType = CommandType.StoredProcedure;
            SqlCommandBuilder.DeriveParameters(m_Command);
            m_Command.UpdatedRowSource = UpdateRowSource.None;

            foreach (SqlParameter para in param)
            {
                m_Command.Parameters.Add(para);
            }
            //    {
            //        m_Command.Parameters[i].Value = Conversion.Int(param[i - 1]);
            //    }
            //    else if (Information.IsDate(m_Command.Parameters[i].Value))
            //    {
            //        m_Command.Parameters[i].Value = Convert.ToDateTime(param[i - 1]);
            //    }
            //    else
            //    {
            //        m_Command.Parameters[i].Value = Convert.ToString(param[i - 1]);
            //    }

            //}
            return m_Command;
        }

        /******************************************************************
        ' GetErrorMsg() Method
        '
        ' Purpose:  The GetErrorMsg method is used to Return the 
        '           Error Message which is encountered during storedprocedure 
        '           execution.
        ' Used in : 
        '******************************************************************/
        public string GetErrorMsg()
        {
            return ErrorMsg;
        }

        /******************************************************************
        ' GetErrorNo() Method
        '
        ' Purpose:  The GetErrorNo method is used to Return the 
        '           Error No. which is encountered during storedprocedure 
        '           execution.
        ' Used in : 
        '******************************************************************/
        public int GetErrorNo()
        {
            return ErrorNo;
        }

    }
}