<<<<<<< HEAD
﻿<%@ Page Title="Check Availability" MasterPageFile="~/User.Master" Language="C#" AutoEventWireup="true" CodeBehind="CheckAvailability.aspx.cs" %>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="CheckAvailability.aspx.cs" Inherits="ABS.CheckAvailability" Theme="admin"%>
>>>>>>> 626f8f817fff6b4a0928cf49bfc17c06b60abe05
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<body>
    <form id="form1" runat="server">
    
    <script type="text/javascript">
        function showalert() 
        {
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
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdAvailability" runat="server" 
                        DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" 
                            AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                <asp:BoundField DataField="Title" HeaderText="Title" />
                                <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                                <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                            SelectMethod="getAvailability" TypeName="ABS.BusinessObjects.Booking">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="calTxtBox" Name="dt" PropertyName="Text" 
                                    Type="DateTime" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <br />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                
            </td>
        </tr>
    </table>
    </form>
    </body>
</asp:Content>
