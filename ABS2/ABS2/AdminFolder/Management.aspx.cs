using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
<<<<<<< HEAD
using System.Web.Security;
=======
using System.Data.SqlClient;
using System.Data;
>>>>>>> b3fda193e2b783cf538db80cb569fde9c7170d4c

namespace ABS2.AdminFolder
{
    public partial class Management : System.Web.UI.Page
    {
        private DateTime selDt;
        private List<SqlParameter> param;
        protected void Page_Load(object sender, EventArgs e)
        {
<<<<<<< HEAD
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {

                if (User.IsInRole("Admin"))
                {
                    
                    TextBox1.Text = "User is admin";
                   

                }
                else
                {
                    
                    TextBox1.Text = "User is not admin";
                }
            
            }

            else { }



            
=======
            //calDate.SelectedDate = DateTime.Now.Date;
            if (!Page.IsPostBack)
            {
                calTxtBox.Text = DateTime.Now.Date.AddDays(-2.00).ToString("yyyy-MM-dd");
                PopulateGrid();
            }
>>>>>>> b3fda193e2b783cf538db80cb569fde9c7170d4c

        }

        public void PopulateGrid()
        {
            //Booking objBooking = new Booking();
            //ObjectDataSource1.SelectMethod = "objBooking.getAvailability";
            ObjectDataSource1.DataBind();
            grdAvailability.DataBind();
            grdAvailability.Visible = true;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //PopulateGrid();
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
            //List<SqlParameter> param = new List<SqlParameter>();
            //SqlParameter selDt = new SqlParameter();
            //selDt.ParameterName = "@Dt";
            //selDt.SqlDbType = SqlDbType.DateTime;
            //selDt.Size = 20;
            //selDt.Direction = ParameterDirection.Input;
            //selDt.Value = calTxtBox.Text;
            //param.Add(selDt);
            e.InputParameters["dt"] = calTxtBox.Text;
        }

        protected void ObjectDataSource1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void grdAvailability_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdAvailability_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Boolean b7AMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[2]);
                Boolean b8AMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[3]);
                Boolean b9AMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[4]);
                Boolean b10AMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[5]);
                Boolean b11AMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[6]);
                Boolean b12PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[7]);
                Boolean b1PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[8]);
                Boolean b2PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[9]);
                Boolean b3PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[10]);
                Boolean b4PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[11]);
                Boolean b5PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[12]);
                Boolean b6PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[13]);
                Boolean b7PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[14]);
                Boolean b8PMSlotVal = Convert.ToBoolean(grdAvailability.DataKeys[e.Row.RowIndex].Values[15]);

                LinkButton grdLnkBtn7 = e.Row.FindControl("grdLnkBtn7") as LinkButton;
                Label grdLbl7 = e.Row.FindControl("grdLbl7") as Label;
                if (b7AMSlotVal == true)
                {
                    grdLnkBtn7.Visible = false;
                    grdLbl7.Visible = true;
                }
                else
                {
                    grdLnkBtn7.Visible = true;
                    grdLbl7.Visible = false;
                }

                LinkButton grdLnkBtn8 = e.Row.FindControl("grdLnkBtn8") as LinkButton;
                Label grdLbl8 = e.Row.FindControl("grdLbl8") as Label;
                if (b8AMSlotVal == true)
                {
                    grdLnkBtn8.Visible = false;
                    grdLbl8.Visible = true;
                }
                else
                {
                    grdLnkBtn8.Visible = true;
                    grdLbl8.Visible = false;
                }


                LinkButton grdLnkBtn9 = e.Row.FindControl("grdLnkBtn9") as LinkButton;
                Label grdLbl9 = e.Row.FindControl("grdLbl9") as Label;
                if (b9AMSlotVal == true)
                {
                    grdLnkBtn9.Visible = false;
                    grdLbl9.Visible = true;
                }
                else
                {
                    grdLnkBtn9.Visible = true;
                    grdLbl9.Visible = false;
                }

                LinkButton grdLnkBtn10 = e.Row.FindControl("grdLnkBtn10") as LinkButton;
                Label grdLbl10 = e.Row.FindControl("grdLbl10") as Label;
                if (b10AMSlotVal == true)
                {
                    grdLnkBtn10.Visible = false;
                    grdLbl10.Visible = true;
                }
                else
                {
                    grdLnkBtn10.Visible = true;
                    grdLbl10.Visible = false;
                }

                LinkButton grdLnkBtn11 = e.Row.FindControl("grdLnkBtn11") as LinkButton;
                Label grdLbl11 = e.Row.FindControl("grdLbl11") as Label;
                if (b11AMSlotVal == true)
                {
                    grdLnkBtn11.Visible = false;
                    grdLbl11.Visible = true;
                }
                else
                {
                    grdLnkBtn11.Visible = true;
                    grdLbl11.Visible = false;
                }

                LinkButton grdLnkBtn12 = e.Row.FindControl("grdLnkBtn12") as LinkButton;
                Label grdLbl12 = e.Row.FindControl("grdLbl12") as Label;
                if (b12PMSlotVal == true)
                {
                    grdLnkBtn12.Visible = false;
                    grdLbl12.Visible = true;
                }
                else
                {
                    grdLnkBtn12.Visible = true;
                    grdLbl12.Visible = false;
                }

                LinkButton grdLnkBtn13 = e.Row.FindControl("grdLnkBtn13") as LinkButton;
                Label grdLbl13 = e.Row.FindControl("grdLbl13") as Label;
                if (b1PMSlotVal == true)
                {
                    grdLnkBtn13.Visible = false;
                    grdLbl13.Visible = true;
                }
                else
                {
                    grdLnkBtn13.Visible = true;
                    grdLbl13.Visible = false;
                }

                LinkButton grdLnkBtn14 = e.Row.FindControl("grdLnkBtn14") as LinkButton;
                Label grdLbl14 = e.Row.FindControl("grdLbl14") as Label;
                if (b2PMSlotVal == true)
                {
                    grdLnkBtn14.Visible = false;
                    grdLbl14.Visible = true;
                }
                else
                {
                    grdLnkBtn14.Visible = true;
                    grdLbl14.Visible = false;
                }

                LinkButton grdLnkBtn15 = e.Row.FindControl("grdLnkBtn15") as LinkButton;
                Label grdLbl15 = e.Row.FindControl("grdLbl15") as Label;
                if (b3PMSlotVal == true)
                {
                    grdLnkBtn15.Visible = false;
                    grdLbl15.Visible = true;
                }
                else
                {
                    grdLnkBtn15.Visible = true;
                    grdLbl15.Visible = false;
                }

                LinkButton grdLnkBtn16 = e.Row.FindControl("grdLnkBtn16") as LinkButton;
                Label grdLbl16 = e.Row.FindControl("grdLbl16") as Label;
                if (b4PMSlotVal == true)
                {
                    grdLnkBtn16.Visible = false;
                    grdLbl16.Visible = true;
                }
                else
                {
                    grdLnkBtn16.Visible = true;
                    grdLbl16.Visible = false;
                }

                LinkButton grdLnkBtn17 = e.Row.FindControl("grdLnkBtn17") as LinkButton;
                Label grdLbl17 = e.Row.FindControl("grdLbl17") as Label;
                if (b5PMSlotVal == true)
                {
                    grdLnkBtn17.Visible = false;
                    grdLbl17.Visible = true;
                }
                else
                {
                    grdLnkBtn17.Visible = true;
                    grdLbl17.Visible = false;
                }

                LinkButton grdLnkBtn18 = e.Row.FindControl("grdLnkBtn18") as LinkButton;
                Label grdLbl18 = e.Row.FindControl("grdLbl18") as Label;
                if (b6PMSlotVal == true)
                {
                    grdLnkBtn18.Visible = false;
                    grdLbl18.Visible = true;
                }
                else
                {
                    grdLnkBtn18.Visible = true;
                    grdLbl18.Visible = false;
                }

                LinkButton grdLnkBtn19 = e.Row.FindControl("grdLnkBtn19") as LinkButton;
                Label grdLbl19 = e.Row.FindControl("grdLbl19") as Label;
                if (b7PMSlotVal == true)
                {
                    grdLnkBtn19.Visible = false;
                    grdLbl19.Visible = true;
                }
                else
                {
                    grdLnkBtn19.Visible = true;
                    grdLbl19.Visible = false;
                }

                LinkButton grdLnkBtn20 = e.Row.FindControl("grdLnkBtn20") as LinkButton;
                Label grdLbl20 = e.Row.FindControl("grdLbl20") as Label;
                if (b8PMSlotVal == true)
                {
                    grdLnkBtn20.Visible = false;
                    grdLbl20.Visible = true;
                }
                else
                {
                    grdLnkBtn20.Visible = true;
                    grdLbl20.Visible = false;
                }

            }
        }
    }
}