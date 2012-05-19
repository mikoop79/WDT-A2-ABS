<%@ Page Title="" Language="C#" MasterPageFile="~/AdminFolder/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Theme="Admin" StylesheetTheme="Admin" Inherits="ABS2.AdminFolder.AdminLogin" %>
<%@ Register Src="~/Controls/AdminNavControl.ascx" TagName="a" TagPrefix="b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="AdminNavControlHome" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
<form id="Form1" runat="server">
    <asp:Login ID="Login1" SkinID="User" runat="server" DestinationPageUrl="~/Home.aspx">
    </asp:Login>
    <br />
    
</form>
<br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
