<%@ Page Title="Manage Conference Rooms" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="ConferenceRooms.aspx.cs" Inherits="ABS2.AdminFolder.ConferenceRooms" %>
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
        <p>This page allows you to manage the existing conference rooms in the appointment booking system. Click the "New Conference Room" or click "Edit" button to edit an exisiting Conference Room.</p>
        <asp:GridView ID="GridView1" CssClass="GridView" runat="server" OnRowCreated="OnGridViewRowCreated" DataSourceID="ConferenceRoomsData">
            <Columns>
                <asp:TemplateField HeaderText="Play">
                    <ItemTemplate> 
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl = '<%# "?roomid="+Eval("ID", "{0}")+"&title="+Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(Eval("Title", "{0}")))    %>' Text="Edit" >
                    </asp:HyperLink>
                </ItemTemplate> 
                </asp:TemplateField> 
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ConferenceRoomsData" runat="server" 
            SelectMethod="GetConferenceRooms" TypeName="ABS2.BusinessObjects.Booking">
        </asp:ObjectDataSource>
        <asp:HyperLink ID="HyperLink3" NavigateUrl = "?roomid=-1&title=" runat="server">New Conference Room</asp:HyperLink>
    </form>
    <% }else { %>
    <form id="form2" runat="server" class="ConferenceRoomEditor">
        <p>
            <asp:Label ID="Label1" runat="server" Text="Title: "></asp:Label>
            <asp:TextBox ID="RoomTitle" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="First appointment can start at: "></asp:Label>
            <asp:DropDownList ID="First" runat="server" 
                DataSourceID="AvailableTimeDataSource" DataTextField="Text" 
                DataValueField="Value">

            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Last appointment can start at: "></asp:Label>
            <asp:DropDownList ID="Last" runat="server" 
                DataSourceID="AvailableTimeDataSource" DataTextField="Text" 
                DataValueField="Value"></asp:DropDownList>
            <asp:ObjectDataSource ID="AvailableTimeDataSource" runat="server" 
                SelectMethod="GetAllAvailableTime" TypeName="ABS2.BusinessObjects.Management">
            </asp:ObjectDataSource>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Available on: "></asp:Label>
            <asp:CheckBoxList ID="Available" runat="server">
                <asp:ListItem Value="1">Sunday </asp:ListItem>
                <asp:ListItem Value="2">Monday</asp:ListItem>
                <asp:ListItem Value="3">Tuesday </asp:ListItem>
                <asp:ListItem Value="4">Wednesday</asp:ListItem>
                <asp:ListItem Value="5">Thursday </asp:ListItem>
                <asp:ListItem Value="6">Friday </asp:ListItem>
                <asp:ListItem Value="7">Sunday</asp:ListItem>
            </asp:CheckBoxList>
        </p>
        <p>
            <input type="submit" value="Save" name="Save" />
            <input type="submit" value="Cancel" name="Cancel" />
            <asp:HiddenField ID="RoomID" runat="server" />
        </p>
    </form>
    <% } %>
</asp:Content>
