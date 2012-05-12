<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeBehind="CheckAvailability.aspx.cs" Theme="user" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <script type="text/javascript">
        function showalert() {
            alert("inside alert of show alert");
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        
    </asp:ScriptManager>
    <table cellpadding="0" cellspacing="0" border="1">
        <tr>
            <td colspan="2">
                <asp:TextBox ID="calTxtBox" runat="server" OnTextChanged="calTxtBox_OnTextChanged"></asp:TextBox>
                        <img id="calID" src="/images/calendar_icon.gif" alt="Please select date" />
                        <cc1:CalendarExtender id="calTxtBox_CalendarExtender" runat="server" enabled="True" TargetControlID="calTxtBox" PopupButtonID="calID" >
                        </cc1:CalendarExtender>
                        
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdAvailability" runat="server" 
                        DataSourceID="ObjectDataSource1" AutoGenerateColumns="False">
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getAvailability" 
                        TypeName="ABS.BusinessObjects.Booking" 
                            ondatabinding="ObjectDataSource1_DataBinding">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="calTxtBox" DefaultValue="1900-01-01" Name="dt" 
                                    PropertyName="Text" Type="DateTime" />
                            </SelectParameters>
                        </asp:ObjectDataSource>        
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="calTxtBox" />
                    </Triggers>
                </asp:UpdatePanel>
                
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
