<%@ Page Title="Home" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" Theme="user" CodeBehind="Home.aspx.cs" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Login</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="form1" runat="server">
    <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Home.aspx">
    </asp:Login>
</form>
    
</asp:Content>

<asp:Content ID="status" ContentPlaceHolderID="LogggedInStatus" runat="server" >
    
</asp:Content>
