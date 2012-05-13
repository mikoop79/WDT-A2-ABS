<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="statusControl.ascx.cs" %>

<form id="form1" runat="server">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
        <li><asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/Logout.aspx" 
                ToolTip="Login/Logout" /></li>
        </AnonymousTemplate>
        <LoggedInTemplate>
           <li><asp:LoginStatus ID="LoggedInStatus" runat="server" LogoutAction="RedirectToLoginPage" /></li>
        </LoggedInTemplate>
        
    </asp:LoginView>

    </form>