<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MakeAppointment.aspx.cs" Theme="user" %>
<%@ Register Src="~/statusControl.ascx" TagName="s" TagPrefix="c" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Make an Appointment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
Content goes here
</asp:Content>
<asp:Content ID="status" ContentPlaceHolderID="LogggedInStatus" runat="server" >
    <c:s ID="statusControl" runat="server" />
</asp:Content>
