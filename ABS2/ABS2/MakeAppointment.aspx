<%@ Page Title="Make Appointment" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MakeAppointment.aspx.cs" Inherits="ABS2.MakeAppointment" Theme="User" %>
<%@ Register Src="~/Controls/NavControl.ascx" TagName="a" TagPrefix="b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navControlPLaceHolder" runat="server">
    <b:a ID="NavControlHome" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LogggedInStatus" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
    Make an Appointment
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <asp:Wizard ID="MakeAppointmentWizard" runat="server" ActiveStepIndex="1" 
            onfinishbuttonclick="MakeAppointmentWizard_FinishButtonClick">
            <WizardSteps>
                <asp:WizardStep runat="server" title="Introduction">
                    <h2>Conference Room Selection</h2>
                    <p>Welcome to the Conference Room Selection Wizard. This wizard will guide you through the process of making an appointment. Click Next to continue</p>
                </asp:WizardStep>
                <asp:WizardStep runat="server" title="Select a Conference Room">
                    <h2>Select a Conference Room</h2>
                    <asp:DropDownList ID="RoomID" runat="server" 
                            DataSourceID="Rooms" DataTextField="Title" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="Rooms" runat="server" 
                            SelectMethod="GetConferenceRooms" 
                            TypeName="ABS2.BusinessObjects.Booking"></asp:ObjectDataSource>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Select Date">
                    <h2>Select Date</h2>
                    <asp:Calendar ID="Date" runat="server" BackColor="White" 
                        BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" 
                        ForeColor="Black" Height="180px" Width="200px" CellPadding="4" 
                        DayNameFormat="Shortest">
                        <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC" />
                        <NextPrevStyle 
                            VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="Gray" />
                        <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" 
                            Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Select Time">
                    <h2>Select Time</h2>
                    <asp:ListBox ID="Time" runat="server" DataSourceID="AvaibleTime" 
                        DataTextField="Text" DataValueField="Value">
                    </asp:ListBox>
                    <asp:ObjectDataSource ID="AvaibleTime" runat="server" 
                        SelectMethod="GetAllAvailableTime" 
                        TypeName="ABS2.BusinessObjects.Management">
                    </asp:ObjectDataSource>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Comments">
                    <h2>Comments</h2>
                    <asp:TextBox ID="Comment" runat="server" TextMode="MultiLine"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Review  Your Request" StepType="Finish">
                    <h2>Review  Your Request</h2>
                    <p><label for="">Room: </label><asp:Label ID="SummaryRoom" runat="server" Text="Room"></asp:Label></p>
                    <p><label for="">Date: </label><asp:Label ID="SummaryDate" runat="server" Text="Date"></asp:Label></p>
                    <p><label for="">Time: </label><asp:Label ID="SummaryTime" runat="server" Text="Time"></asp:Label></p>
                    <p><label for="">Comment: </label><asp:Label ID="SummaryComment" runat="server" Text="Comment"></asp:Label></p>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
    </form>
</asp:Content>
