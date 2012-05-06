<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="ABS.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Sign Up
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" CreatingUser="wizard_CreatingUser">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" />
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
    </form>
</asp:Content>
