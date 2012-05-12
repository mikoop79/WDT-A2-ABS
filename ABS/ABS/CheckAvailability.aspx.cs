using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ABS.BusinessObjects;
using System.Data.SqlClient;
using System.Data;

namespace ABS
{
    public partial class CheckAvailability : System.Web.UI.Page
    {
        private DateTime selDt;
        private List<SqlParameter> param;
        protected void Page_Load(object sender, EventArgs e)
        {
            //calDate.SelectedDate = DateTime.Now.Date;
            if (!Page.IsPostBack)
            {
                PopulateGrid();
            }

        }

        public void PopulateGrid()
        {
            Booking objBooking = new Booking();
            ObjectDataSource1.SelectMethod = "objBooking.getAvailability";
            //Parameter p1 = new Parameter();
            //p1.Name = "dt";
            //p1.DefaultValue = "1900-01-01";
            //ObjectDataSource1.SelectParameters.Add(p1);
            ObjectDataSource1.DataBind();
            grdAvailability.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            PopulateGrid();
        }

        protected void calTxtBox_OnTextChanged(object sender, EventArgs e)
        {
            PopulateGrid();
        }

        //protected override void OnDataBinding(EventArgs e)
        //{
        //    base.OnDataBinding(e);

        //    if (ObjectDataSource1 != null)
        //    {
        //        ObjectDataSource1.DataBind(); 
        //    }
        //}

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            List<SqlParameter> param = new List<SqlParameter>();
            SqlParameter selDt = new SqlParameter();
            selDt.ParameterName = "@Dt";
            selDt.SqlDbType = SqlDbType.DateTime;
            selDt.Size = 20;
            selDt.Direction = ParameterDirection.Input;
            selDt.Value = calTxtBox.Text;
            param.Add(selDt);
            e.InputParameters["dt"] = calTxtBox.Text;
        }

        protected void ObjectDataSource1_DataBinding(object sender, EventArgs e)
        {

        }
    }
}