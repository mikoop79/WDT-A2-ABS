<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ABS2.SignUp" Theme="User" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
    ContinueDestinationPageUrl="~/Login.aspx">
    <WizardSteps>
        <asp:CreateUserWizardStep runat="server" />
        <asp:CompleteWizardStep runat="server" />
    </WizardSteps>
</asp:CreateUserWizard>
</form>
</asp:Content>
<asp:Content ID="status" ContentPlaceHolderID="LogggedInStatus" runat="server" >
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
<b:a ID="NavControlHome" runat="server" />
</asp:Content>
