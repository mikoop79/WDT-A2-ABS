<%@ Page Title="Home" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" Theme="user" CodeBehind="Home.aspx.cs" Inherits="ABS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Login</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="form1" runat="server">
<asp:Login ID="Login1" runat="server">
</asp:Login>
<asp:LoginStatus ID="LoginStatus1" runat="server" />
</form>
    
</asp:Content>
