<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Web_Project___Ivan_Jansen_van_Rensburg___31683320.Booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
        <link rel="stylesheet" type ="text/css" href="DefaultStyleSheet.css"/>
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 3%;
        }
        .auto-style4 {
            width: 211px;
        }
        .auto-style5 {
            width: 77%;
        }
        .auto-style6 {
            width: 93px;
        }
        .auto-style7 {
            width: 211px;
            height: 23px;
        }
        .auto-style8 {
            width: 77%;
            height: 23px;
        }
        .auto-style9 {
            width: 3%;
            height: 23px;
        }
    </style>
</head>
<body style="width: 1986px; height: 942px">
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblHeader" CssClass="topLabel" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">                        
                        <asp:Calendar ID="Calendar1" runat="server" Width="560px" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="328px" NextPrevFormat="FullMonth">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>    
                    </td>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">                        
                    </td>
                    <td class="auto-style8">
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td colspan="3">                        
                        <asp:Label ID="lblDelivery" CssClass="myLabels" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">                        
                        &nbsp;</td>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnOrder" CssClass="myButtons" runat="server" OnClick="btnOrder_Click" Text="Confirm order" Width="338px" />
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style6">
                        &nbsp;</td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" CssClass="myLabels" runat="server" NavigateUrl="~/Main.aspx">Cancel order</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
