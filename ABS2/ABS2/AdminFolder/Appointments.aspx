<%@ Page Title="Manage Appointments" Language="C#" MasterPageFile="Admin.Master"
    AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" StylesheetTheme="Admin"
    Inherits="ABS2.AdminFolder.Appointments" Theme="Admin" %>
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
    Manage Appointments
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:TextBox ID="calTxtBox" runat="server" OnTextChanged="calTxtBox_OnTextChanged"></asp:TextBox>
        <img id="calID" src="/App_Themes/User/images/calendar_icon.gif" alt="Please select date" />
        <cc1:CalendarExtender ID="calTxtBox_CalendarExtender" runat="server" Enabled="True"
            TargetControlID="calTxtBox" PopupButtonID="calID">
        </cc1:CalendarExtender>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />

            </Triggers>
            <ContentTemplate>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    SelectMethod="GetAllAppointmentsForDate" 
                    TypeName="ABS2.BusinessObjects.Appointment">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="AppointmentDate" 
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </ContentTemplate>
            

            
       
        </asp:UpdatePanel>
    </form>
</asp:Content>
