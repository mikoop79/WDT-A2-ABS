﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ABS2.Login" Theme="User" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
    <asp:Login ID="Login1" SkinID="User" runat="server" DestinationPageUrl="~/Home.aspx">
    </asp:Login>
    <br />
    
</form>
<br />
</asp:Content>

<asp:Content ID="status" ContentPlaceHolderID="LogggedInStatus" runat="server" >
   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="NavControlHome" runat="server" />
</asp:Content>