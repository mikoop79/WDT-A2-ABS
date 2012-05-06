<%@ Page Title="Home" Language="C#" MasterPageFile="~/ABS.Master" AutoEventWireup="true" Theme="user" CodeBehind="Home.aspx.cs" Inherits="ABS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Login</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
<p style="font-size: 24px;">&nbsp;</p>
<p style="font-size: 24px;">
    <asp:Login ID="Login1" class="form-horizontal"  runat="server">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
</p>
<p style="font-size: 24px;">
    <asp:Login ID="Login2" runat="server" onauthenticate="Login2_Authenticate">
    </asp:Login>
</p>
</form>
</asp:Content>
