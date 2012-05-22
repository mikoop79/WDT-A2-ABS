using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ABS2.BusinessObjects;
using System.Data.SqlClient;
using System.Data;

namespace ABS2
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
                calTxtBox.Text = DateTime.Now.Date.AddDays(-2.00).ToString("yyyy-MM-dd");
                PopulateGrid();
            }

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
            PopulateGrid();
        }

        protected void calTxtBox_OnTextChanged(object sender, EventArgs e)
        {
            //PopulateGrid();
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
                //string[] dkn = grdAvailability.DataKeys[e.Row.RowIndex].Values[];
                //for (int i = 0; i < dkn.Length - 1; i++)
                //{
                //    String dks = dkn[i];
                //}
                String BookingID = Convert.ToString(grdAvailability.DataKeys[e.Row.RowIndex].Values[0]);
                String StartDt = Convert.ToString(grdAvailability.DataKeys[e.Row.RowIndex].Values[2]);
                String EndDt = Convert.ToString(grdAvailability.DataKeys[e.Row.RowIndex].Values[3]);
                int b7AMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[4]);
                int b8AMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[5]);
                int b9AMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[6]);
                int b10AMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[7]);
                int b11AMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[8]);
                int b12PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[9]);
                int b1PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[10]);
                int b2PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[11]);
                int b3PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[12]);
                int b4PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[13]);
                int b5PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[14]);
                int b6PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[15]);
                int b7PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[16]);
                int b8PMSlotVal = Convert.ToInt32(grdAvailability.DataKeys[e.Row.RowIndex].Values[17]);

                String[] times = calTxtBox.Text.Replace('-', '/').Split('/');
                DateTime selectDate = Convert.ToDateTime(times[2] + "/" + times[1] + "/" + times[0]);
                int dayofweek = Management.GetDayOfWeek(selectDate.DayOfWeek.ToString());
                if (!Management.GetSelectDay(Convert.ToInt32(BookingID)).Contains(dayofweek.ToString()))
                    e.Row.Visible = false;

                //int len = StartDt.IndexOf(" ");
                StartDt = calTxtBox.Text.Replace('/', '-');
                LinkButton grdLnkBtn7 = e.Row.FindControl("grdLnkBtn7") as LinkButton;
                grdLnkBtn7.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=7";
                grdLnkBtn7.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=7";
                Label grdLbl7 = e.Row.FindControl("grdLbl7") as Label;
                if (b7AMSlotVal == 2)
                {
                    grdLnkBtn7.Visible = false;
                    grdLbl7.Text = "N/A";
                    grdLbl7.Visible = true;
                }
                else if (b7AMSlotVal == 1)
                {
                    grdLnkBtn7.Visible = false;
                    grdLbl7.Text = "Booked";
                    grdLbl7.Visible = true;
                }
                else if (b7AMSlotVal == 0)
                {
                    grdLnkBtn7.Visible = true;
                    grdLbl7.Visible = false;
                }

                LinkButton grdLnkBtn8 = e.Row.FindControl("grdLnkBtn8") as LinkButton;
                grdLnkBtn8.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=8";
                grdLnkBtn8.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=8";
                Label grdLbl8 = e.Row.FindControl("grdLbl8") as Label;
                if (b8AMSlotVal == 2)
                {
                    grdLnkBtn8.Visible = false;
                    grdLbl8.Text = "N/A";
                    grdLbl8.Visible = true;
                }
                else if (b8AMSlotVal == 1)
                {
                    grdLnkBtn8.Visible = false;
                    grdLbl8.Text = "Booked";
                    grdLbl8.Visible = true;
                }
                else if (b8AMSlotVal == 0)
                {
                    grdLnkBtn8.Visible = true;
                    grdLbl8.Visible = false;
                }


                LinkButton grdLnkBtn9 = e.Row.FindControl("grdLnkBtn9") as LinkButton;
                grdLnkBtn9.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=9";
                grdLnkBtn9.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=9";
                Label grdLbl9 = e.Row.FindControl("grdLbl9") as Label;
                if (b9AMSlotVal == 2)
                {
                    grdLnkBtn9.Visible = false;
                    grdLbl9.Text = "N/A";
                    grdLbl9.Visible = true;
                }
                else if (b9AMSlotVal == 1)
                {
                    grdLnkBtn9.Visible = false;
                    grdLbl9.Text = "Booked";
                    grdLbl9.Visible = true;
                }
                else if (b9AMSlotVal == 0)
                {
                    grdLnkBtn9.Visible = true;
                    grdLbl9.Visible = false;
                }

                LinkButton grdLnkBtn10 = e.Row.FindControl("grdLnkBtn10") as LinkButton;
                grdLnkBtn10.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=10";
                grdLnkBtn10.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=10";
                Label grdLbl10 = e.Row.FindControl("grdLbl10") as Label;
                if (b10AMSlotVal == 2)
                {
                    grdLnkBtn10.Visible = false;
                    grdLbl10.Text = "N/A";
                    grdLbl10.Visible = true;
                }
                else if (b10AMSlotVal == 1)
                {
                    grdLnkBtn10.Visible = false;
                    grdLbl10.Text = "Booked";
                    grdLbl10.Visible = true;
                }
                else if (b10AMSlotVal == 0)
                {
                    grdLnkBtn10.Visible = true;
                    grdLbl10.Visible = false;
                }

                LinkButton grdLnkBtn11 = e.Row.FindControl("grdLnkBtn11") as LinkButton;
                grdLnkBtn11.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=11";
                grdLnkBtn11.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=11";
                Label grdLbl11 = e.Row.FindControl("grdLbl11") as Label;
                if (b11AMSlotVal == 2)
                {
                    grdLnkBtn11.Visible = false;
                    grdLbl11.Text = "N/A";
                    grdLbl11.Visible = true;
                }
                else if (b11AMSlotVal == 1)
                {
                    grdLnkBtn11.Visible = false;
                    grdLbl11.Text = "Booked";
                    grdLbl11.Visible = true;
                }
                else if (b11AMSlotVal == 0)
                {
                    grdLnkBtn11.Visible = true;
                    grdLbl11.Visible = false;
                }

                LinkButton grdLnkBtn12 = e.Row.FindControl("grdLnkBtn12") as LinkButton;
                grdLnkBtn12.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=12";
                grdLnkBtn12.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=12";
                Label grdLbl12 = e.Row.FindControl("grdLbl12") as Label;
                if (b12PMSlotVal == 2)
                {
                    grdLnkBtn12.Visible = false;
                    grdLbl12.Text = "N/A";
                    grdLbl12.Visible = true;
                }
                else if (b12PMSlotVal == 1)
                {
                    grdLnkBtn12.Visible = false;
                    grdLbl12.Text = "Booked";
                    grdLbl12.Visible = true;
                }
                else if (b12PMSlotVal == 0)
                {
                    grdLnkBtn12.Visible = true;
                    grdLbl12.Visible = false;
                }

                LinkButton grdLnkBtn13 = e.Row.FindControl("grdLnkBtn13") as LinkButton;
                grdLnkBtn13.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=13";
                grdLnkBtn13.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=13";
                Label grdLbl13 = e.Row.FindControl("grdLbl13") as Label;
                if (b1PMSlotVal == 2)
                {
                    grdLnkBtn13.Visible = false;
                    grdLbl13.Text = "N/A";
                    grdLbl13.Visible = true;
                }
                else if (b1PMSlotVal == 1)
                {
                    grdLnkBtn13.Visible = false;
                    grdLbl13.Text = "Booked";
                    grdLbl13.Visible = true;
                }
                else if (b1PMSlotVal == 0)
                {
                    grdLnkBtn13.Visible = true;
                    grdLbl13.Visible = false;
                }

                LinkButton grdLnkBtn14 = e.Row.FindControl("grdLnkBtn14") as LinkButton;
                grdLnkBtn14.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=14";
                grdLnkBtn14.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=14";
                Label grdLbl14 = e.Row.FindControl("grdLbl14") as Label;
                if (b2PMSlotVal == 2)
                {
                    grdLnkBtn14.Visible = false;
                    grdLbl14.Text = "N/A";
                    grdLbl14.Visible = true;
                }
                else if (b2PMSlotVal == 1)
                {
                    grdLnkBtn14.Visible = false;
                    grdLbl14.Text = "Booked";
                    grdLbl14.Visible = true;
                }
                else if (b2PMSlotVal == 0)
                {
                    grdLnkBtn14.Visible = true;
                    grdLbl14.Visible = false;
                }

                LinkButton grdLnkBtn15 = e.Row.FindControl("grdLnkBtn15") as LinkButton;
                grdLnkBtn15.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=15";
                grdLnkBtn15.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=15";
                Label grdLbl15 = e.Row.FindControl("grdLbl15") as Label;
                if (b3PMSlotVal == 2)
                {
                    grdLnkBtn15.Visible = false;
                    grdLbl15.Text = "N/A";
                    grdLbl15.Visible = true;
                }
                else if (b3PMSlotVal == 1)
                {
                    grdLnkBtn15.Visible = false;
                    grdLbl15.Text = "Booked";
                    grdLbl15.Visible = true;
                }
                else if (b3PMSlotVal == 0)
                {
                    grdLnkBtn15.Visible = true;
                    grdLbl15.Visible = false;
                }

                LinkButton grdLnkBtn16 = e.Row.FindControl("grdLnkBtn16") as LinkButton;
                grdLnkBtn16.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=16";
                grdLnkBtn16.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=16";
                Label grdLbl16 = e.Row.FindControl("grdLbl16") as Label;
                if (b4PMSlotVal == 2)
                {
                    grdLnkBtn16.Visible = false;
                    grdLbl16.Text = "N/A";
                    grdLbl16.Visible = true;
                }
                else if (b4PMSlotVal == 1)
                {
                    grdLnkBtn16.Visible = false;
                    grdLbl16.Text = "Booked";
                    grdLbl16.Visible = true;
                }
                else if (b4PMSlotVal == 0)
                {
                    grdLnkBtn16.Visible = true;
                    grdLbl16.Visible = false;
                }

                LinkButton grdLnkBtn17 = e.Row.FindControl("grdLnkBtn17") as LinkButton;
                grdLnkBtn17.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=17";
                grdLnkBtn17.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=17";
                Label grdLbl17 = e.Row.FindControl("grdLbl17") as Label;
                if (b5PMSlotVal == 2)
                {
                    grdLnkBtn17.Visible = false;
                    grdLbl17.Text = "N/A";
                    grdLbl17.Visible = true;
                }
                else if (b5PMSlotVal == 1)
                {
                    grdLnkBtn17.Visible = false;
                    grdLbl17.Text = "Booked";
                    grdLbl17.Visible = true;
                }
                else if (b5PMSlotVal == 0)
                {
                    grdLnkBtn17.Visible = true;
                    grdLbl17.Visible = false;
                }

                LinkButton grdLnkBtn18 = e.Row.FindControl("grdLnkBtn18") as LinkButton;
                grdLnkBtn18.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=18";
                grdLnkBtn18.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=18";
                Label grdLbl18 = e.Row.FindControl("grdLbl18") as Label;
                if (b6PMSlotVal == 2)
                {
                    grdLnkBtn18.Visible = false;
                    grdLbl18.Text = "N/A";
                    grdLbl18.Visible = true;
                }
                else if (b6PMSlotVal == 1)
                {
                    grdLnkBtn18.Visible = false;
                    grdLbl18.Text = "Booked";
                    grdLbl18.Visible = true;
                }
                else if (b6PMSlotVal == 0)
                {
                    grdLnkBtn18.Visible = true;
                    grdLbl18.Visible = false;
                }

                LinkButton grdLnkBtn19 = e.Row.FindControl("grdLnkBtn19") as LinkButton;
                grdLnkBtn19.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=19";
                grdLnkBtn19.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=19";
                Label grdLbl19 = e.Row.FindControl("grdLbl19") as Label;
                if (b7PMSlotVal == 2)
                {
                    grdLnkBtn19.Visible = false;
                    grdLbl19.Text = "N/A";
                    grdLbl19.Visible = true;
                }
                else if (b7PMSlotVal == 1)
                {
                    grdLnkBtn19.Visible = false;
                    grdLbl19.Text = "Booked";
                    grdLbl19.Visible = true;
                }
                else if (b7PMSlotVal == 0)
                {
                    grdLnkBtn19.Visible = true;
                    grdLbl19.Visible = false;
                }

                LinkButton grdLnkBtn20 = e.Row.FindControl("grdLnkBtn20") as LinkButton;
                grdLnkBtn20.CommandArgument = "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=20";
                grdLnkBtn20.PostBackUrl = "/MakeAppointment.aspx?" + "StartDate=" + StartDt + "&RoomID=" + BookingID + "&Time=20";
                Label grdLbl20 = e.Row.FindControl("grdLbl20") as Label;
                if (b8PMSlotVal == 2)
                {
                    grdLnkBtn20.Visible = false;
                    grdLbl20.Text = "N/A";
                    grdLbl20.Visible = true;
                }
                else if (b8PMSlotVal == 1)
                {
                    grdLnkBtn20.Visible = false;
                    grdLbl20.Text = "Booked";
                    grdLbl20.Visible = true;
                }
                else if (b8PMSlotVal == 0)
                {
                    grdLnkBtn20.Visible = true;
                    grdLbl20.Visible = false;
                }

            }
        }

        //protected void grdAvailability_RowCommand(object sender, GridViewCommandEventArgs e)
        //{

        //    //if (String.Compare(e.CommandName, "redirect") == 0)
        //    //{
        //    //    Response.Write("~Management.aspx?" + e.CommandArgument);
        //    //    Response.End();
        //    //    Response.Redirect("~Management.aspx?" + e.CommandArgument);
        //    //}
        //}


    }
}