<%@ Page Title="Home" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ABS2.Home" Theme="User" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Appointment Scheduling and Reservation
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p>
This application allows you to quickly book your favorite conference room. <br />
Befor you can use this application, you need to have an active account.  <br />
If you don't have an account yet, you can <a href="SignUp.aspx">create one now</a>. <br />
Otherwise, you'll be asked to login before you can make the appointment. <br />
</p>
<p>
Proceed to <a href="MakeAppointment.aspx">make an appointment</a>, or look at the <a href="CheckAvailability.aspx">Availability checker</a> to see if your favorite conferece room is available.
</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="NavControlHome" runat="server" />
</asp:Content>
