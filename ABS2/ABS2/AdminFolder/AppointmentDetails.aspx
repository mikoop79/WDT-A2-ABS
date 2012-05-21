<%@ Page Title="AppointmentDetailsView" Language="C#" MasterPageFile="~/AdminFolder/Admin.Master" AutoEventWireup="true" CodeBehind="AppointmentDetails.aspx.cs" Inherits="ABS2.AdminFolder.AppointmentDetails" %>
<%@ Register Src="~/Controls/AdminNavControl.ascx" TagName="a" TagPrefix="b" %>
<%@ Register Src="~/Controls/AdminInternalNavControl.ascx" TagName="c" TagPrefix="d" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
 <b:a ID="AdminNavControlHome" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="internalNavControlPLaceHolder" runat="server">
<d:c ID="AdminInternalNavControl" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
    View Appointment Details
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>Appointment Venue : </td>
                <td><asp:Label ID="lblAppVenue" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Appointment Date : </td>
                <td><asp:Label ID="lblAppDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Appointment Start Time : </td>
                <td><asp:Label ID="lblAppStartTime" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Appointment End Time : </td>
                <td><asp:Label ID="lblAppEndTime" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Appointment Made By : </td>
                <td><asp:Label ID="lblAppUser" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HiddenField ID="RoomID" runat="server" />
                </td>
            </tr>
        </table>    
    </form>
</asp:Content>



