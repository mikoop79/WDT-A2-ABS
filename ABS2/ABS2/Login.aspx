<%@ Page Title="Login" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="ABS2.Login" Theme="User" %>

<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>
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

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="Form1" runat="server">
    <style id="Style1" type="text/css" runat="server">
                .hidden{display:none;}
                .message{display:block; color:#F00; font-size:12px; margin-bottom:5px;}
</style>
<div runat="server" ID="Message" class="hidden" ></div>

    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>

            <asp:Login ID="Login1" SkinID="User" TitleText="" runat="server" DestinationPageUrl="~/Home.aspx">           

           <%-- <LayoutTemplate>
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
            <asp:TextBox ID="UserName"  runat="server" />
            <asp:requiredfieldvalidator id="UserNameRequired" runat="server" ControlToValidate="UserName" Text="Required"></asp:requiredfieldvalidator>
                        
           <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
           <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
           <asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" ControlToValidate="Password" Text="Required"></asp:requiredfieldvalidator>
           <br />
           <asp:Button ID="Button1" runat="server" Text="Login" />
           
           </asp:Login>
           <br />
           <asp:Checkbox id="RememberMe" runat="server" Text="Remember my login"></asp:Checkbox>
           <br />
           <asp:Literal id="FailureText" runat="server"></asp:Literal>
           </LayoutTemplate>--%>
            </asp:login>
        </AnonymousTemplate>
        <LoggedInTemplate>
       
            
               <p>You are already logged in. </p>
    </asp:Login>
            </LoggedInTemplate>
    </asp:LoginView>
    </form>
    <br />
</asp:Content>
<asp:Content ID="status" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
    <b:a ID="NavControlHome" runat="server" />
</asp:Content>
