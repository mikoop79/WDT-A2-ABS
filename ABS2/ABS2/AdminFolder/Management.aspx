<%@ Page Title="Management" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" StylesheetTheme="Admin" Inherits="ABS2.AdminFolder.Management" Theme="Admin" %>
<%@ Register Src="~/Controls/AdminNavControl.ascx" TagName="a" TagPrefix="b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
    <b:a ID="AdminNavControlHome" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
    Management
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<form runat="server">
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</form>
    
    Content
</asp:Content>
