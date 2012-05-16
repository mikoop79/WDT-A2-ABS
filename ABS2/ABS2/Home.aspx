<%@ Page Title="Home" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ABS2.Home" Theme="User" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
Content
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="NavControlHome" runat="server" />
</asp:Content>
