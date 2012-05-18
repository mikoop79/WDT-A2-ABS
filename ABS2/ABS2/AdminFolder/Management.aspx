<%@ Page Title="Management" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" StylesheetTheme="Admin" Inherits="ABS2.AdminFolder.Management" Theme="Admin" %>
<%@ Register Src="~/Controls/AdminNavControl.ascx" TagName="a" TagPrefix="b" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
    <b:a ID="AdminNavControlHome" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
    Management
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        
    </asp:ScriptManager>
    <asp:TextBox ID="calTxtBox" runat="server" OnTextChanged="calTxtBox_OnTextChanged"></asp:TextBox>
            <img id="calID" src="/App_Themes/User/images/calendar_icon.gif" alt="Please select date" />
            <cc1:calendarextender id="calTxtBox_CalendarExtender" runat="server" 
        enabled="True" TargetControlID="calTxtBox" PopupButtonID="calID" >
            </cc1:calendarextender>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="grdAvailability" runat="server" 
            DataSourceID="ObjectDataSource1" DataKeyNames="BookingID, Title,_7AMSlot,_8AMSlot,_9AMSlot,_10AMSlot,_11AMSlot,_12PMSlot,_1PMSlot,
            _2PMSlot,_3PMSlot,_4PMSlot,_5PMSlot,_6PMSlot,_7PMSlot,_8PMSlot" AutoGenerateColumns="False" 
                AllowPaging="True" AllowSorting="True" 
                onselectedindexchanged="grdAvailability_SelectedIndexChanged" 
                onrowdatabound="grdAvailability_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="_7AMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="7">
                        <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn7" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl7" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_8AMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="8">
                        <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn8" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl8" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_9AMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="9">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn9" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl9" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_10AMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="10">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn10" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl10" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_11AMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="11">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn11" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl11" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_12PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="12">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn12" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl12" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_1PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="13">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn13" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl13" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_2PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="14">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn14" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl14" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_3PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="15">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn15" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl15" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_4PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="16">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn16" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl16" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_5PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="17">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn17" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl17" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_6PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="18">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn18" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl18" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_7PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="19">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn19" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl19" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="_8PMSlot" HeaderText="ID" Visible="False" />
                    <asp:TemplateField HeaderText="20">
                            <ItemTemplate>
                            <asp:LinkButton ClientIDMode="Static" ID="grdLnkBtn20" Text="Book" runat="server" PostBackUrl="~/MakeAppointment.aspx"></asp:LinkButton>
                            <asp:Label ClientIDMode="Static" ID="grdLbl20" Text="Booked" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
</form>
</asp:Content>
