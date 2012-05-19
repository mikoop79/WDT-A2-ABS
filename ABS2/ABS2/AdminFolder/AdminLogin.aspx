<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/AdminFolder/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Theme="Admin" StylesheetTheme="Admin" Inherits="ABS2.AdminFolder.AdminLogin" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="NavControlHome" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<form id="Form2" runat="server">
<asp:LoginView ID="LoginView1" runat="server" >

            <AnonymousTemplate>
            <h2 style="margin-left:35px;margin-bottom:20px;">Login to Admin Area</h2>
                 <asp:Login ID="Login1" SkinID="Admin" TitleText="" runat="server" DestinationPageUrl="~/AdminFolder/Management.aspx">
    </asp:Login>
    <br />
            </AnonymousTemplate>
            
            <%--<LoggedInTemplate>--%>
            <RoleGroups>
            <asp:RoleGroup Roles ="Staff">
                <ContentTemplate>
                
                <p>Staff</p>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Admin" >
                <ContentTemplate>
                <p>Admin</p>
                </ContentTemplate>
            
            </asp:RoleGroup>
            
            </RoleGroups> 
            
          <%--  Welcome, <asp:LoginName ID="LoginName1" runat="server" /> 
                
            </LoggedInTemplate>--%>
        </asp:LoginView>
    
   
    
</form>

</asp:Content>
