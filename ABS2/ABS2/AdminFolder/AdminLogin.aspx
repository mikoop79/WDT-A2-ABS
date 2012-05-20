<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/AdminFolder/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Theme="Admin" StylesheetTheme="Admin" Inherits="ABS2.AdminFolder.AdminLogin" %>
<%@ Register Src="~/Controls/AdminNavControl.ascx" TagName="a" TagPrefix="b" %>
<script runat="server">
    void Page_Load(object sender, EventArgs e)
    {

        String s = Request.QueryString["message"];

        if (s != null)
        {
            Message.InnerText = s;
            Message.Attributes.Add("class", "message");
        }
    }
</script>
 
           
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="NavControlHome" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<form id="Form2" runat="server">
<style id="Style1" type="text/css" runat="server">
                .hidden{display:none;}
                .message{display:block; color:#F00; font-size:12px; margin-bottom:5px;}
</style>
<div runat="server" ID="Message" class="hidden" ></div>
<asp:LoginView ID="LoginView1" runat="server" >
 
            <AnonymousTemplate>
            <h2 style="margin-left:35px;margin-bottom:20px;">Login to Admin Area</h2>
            
                 <asp:Login ID="Login1" TitleText="" runat="server" DestinationPageUrl="~/AdminFolder/AdminArea.aspx">
    </asp:Login>
    <br />
            </AnonymousTemplate>
            
            <LoggedInTemplate>
            
            <h2 style="margin-left:35px;margin-bottom:20px;">Login to Admin Area</h2>
            
                 <asp:Login ID="Login1" TitleText="" runat="server" DestinationPageUrl="~/AdminFolder/AdminArea.aspx">
    </asp:Login>
             
            
          
                
            </LoggedInTemplate>
        </asp:LoginView>
    
   
    
</form>

</asp:Content>
