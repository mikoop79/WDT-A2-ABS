<%@ Page Title="Manage Conference Rooms" Language="C#" MasterPageFile="~/AdminFolder/Admin.Master" AutoEventWireup="true" CodeBehind="ConferenceRooms.aspx.cs" Inherits="ABS2.ConferenceRooms" %>
<%@ Register Src="~/Controls/AdminNavControl.ascx" TagName="a" TagPrefix="b" %>
<%@ Register Src="~/Controls/AdminInternalNavControl.ascx" TagName="c" TagPrefix="d" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
    <b:a ID="AdminNavControlHome" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="internalNavControlPLaceHolder" runat="server">
    <d:c ID="AdminInternalNavControl" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
Manage Conference Rooms
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!this.IsEditing){ %>
    <form id="form1" runat="server">
        <p>This page allows you to manage the existing conference rooms in the appointment booking system. Click the "New Conference Room" or click "Edit" button to edit an exisiting Conference Room.<asp:GridView 
                ID="GridView1" runat="server" DataSourceID="ConferenceRoomsData">
            <Columns>
                <asp:ButtonField CommandName="Edit" Text="Edit" />
            </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ConferenceRoomsData" runat="server" 
                SelectMethod="GetConferenceRooms" TypeName="ABS.BusinessObjects.Booking">
            </asp:ObjectDataSource>
        </p>

        <input type="submit" value="New Conference Room" />
    </form>
    <% }else { %>
    <form id="form2" runat="server">
        <input type="submit" value="Save" />
        <input type="submit" value="Cancel" />
    </form>
    <% } %>
</asp:Content>
