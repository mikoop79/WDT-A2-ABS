<%@ Page Title="Check Availability" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CheckAvailability.aspx.cs" Inherits="ABS2.CheckAvailability" Theme="User" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="NavControlHome" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
Check Availability
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
Main Content
</asp:Content>
