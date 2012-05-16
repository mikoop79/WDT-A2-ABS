<%@ Page Title="Logout" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="ABS2.Logout" Theme="User" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>
<%@ Import Namespace="System.Web.Security" %>


<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="NavControlHome" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    </form>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
You have success fully logged out.
</asp:Content>
