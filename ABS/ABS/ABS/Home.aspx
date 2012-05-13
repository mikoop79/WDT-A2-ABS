<%@ Page Title="Home" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Theme="user" %>
<%@ Register Src="~/statusControl.ascx" TagName="s" TagPrefix="c" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Home</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="hero-unit">
  
  <p>Tagline</p>
  <p>
    <a class="btn btn-primary btn-large">
      Learn more
    </a>
  </p>
</div>

</asp:Content>

<asp:Content ID="status" ContentPlaceHolderID="LogggedInStatus" runat="server" >
    <c:s ID="statusControl" runat="server" />
</asp:Content>
