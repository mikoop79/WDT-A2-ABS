<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ABS2.SignUp" Theme="User" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>

<script runat="server">

    void Ontext_changed(Object sender, EventArgs E)
    {
        if (UserName.Text == null || UserName.Text == "")
        {
            UserAvailability.InnerText = "Username required.";
            UserAvailability.Attributes.Add("class", "btn btn-danger alertAjax");
        }
        
        else if (Membership.GetUser(UserName.Text) != null)
        {
            UserAvailability.InnerText = "Username taken, sorry.";
            UserAvailability.Attributes.Add("class", "btn btn-danger alertAjax");
        }
        else
        {
            UserAvailability.InnerText = "Available!";
            UserAvailability.Attributes.Add("class", "btn btn-success alertAjax");
            
        }
       
    }

</script>




<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Sign Up for a new Account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
    ContinueDestinationPageUrl="~/Login.aspx" >
    <WizardSteps>
        <asp:CreateUserWizardStep runat="server" >
            <ContentTemplate>
            <style type="text/css">
.passWordStrength{ width:150px; padding:0 5px; text-align:left; margin: 0px 5px;}                


#UserAvailability {
  margin-left: 5px; width:50px; float: right; display:inline;
  
}

.alertAjax{margin:0 0 0 15px !important;}
.taken {
  background:#F30; margin:0px 3px;  margin-left: 5px; width:150px; float: right; display:inline;
}
 
.available {
  background:#0C0;  margin:0px 3px;  margin-left: 5px; width:150px; float: right; display:inline;
}
</style>
            <table border="0" style="font-size: 100%; font-family: Verdana">
           
            <tr>
                <td align="right">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">
                        User Name:</asp:Label></td>
                <td>
                    <asp:UpdatePanel ID="up1" runat="server" RenderMode="Inline">
                    <ContentTemplate>
                        <asp:TextBox ID="UserName" AutoPostBack="true" OnTextChanged="Ontext_changed" Display="Dynamic"  runat="server" />
                        
                                 <div runat="server" id="UserAvailability"></div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                  
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">
                        Password:</asp:Label></td>
                <td>
                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:PasswordStrength ID="Password_PasswordStrength" runat="server"
                        TargetControlID="Password" PreferredPasswordLength="8" 
                        RequiresUpperAndLowerCaseCharacters="True" TextStrengthDescriptions="Very Poor;Weak;Average;Strong;Excellent"  TextCssClass="passWordStrength" TextStrengthDescriptionStyles="btn btn-danger;btn btn-warning;btn btn-warning;btn btn-primary;btn btn-success" >
                    </asp:PasswordStrength>
                    
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">
                        Confirm Password:</asp:Label></td>
                <td>
                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                        ErrorMessage="Confirm Password is required." CssClass="btn btn-danger alertAjax" ToolTip="Confirm Password is required."
                        ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">
                        E-mail:</asp:Label></td>
                <td>
                    
                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                        ErrorMessage="Must be a valid email address"  CssClass="btn btn-danger alertAjax" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">
                        Security Question:</asp:Label></td>
                <td>
                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" Display="Dynamic"
                        ErrorMessage="Security question is required." ToolTip="Security question is required."  CssClass="btn btn-danger alertAjax"
                        ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">
                        Security Answer:</asp:Label></td>
                <td>
                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" Display="Dynamic"
                        ErrorMessage="Security answer is required." ToolTip="Security answer is required."  CssClass="btn btn-danger alertAjax"
                        ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."  CssClass="btn btn-danger alertAjax"
                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="color: red">
                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                </td>
            </tr>
        </table>
        
                
            </ContentTemplate>        
        </asp:CreateUserWizardStep>
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
