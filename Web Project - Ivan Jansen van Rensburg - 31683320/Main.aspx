<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Web_Project___Ivan_Jansen_van_Rensburg___31683320.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
        <link rel="stylesheet" type ="text/css" href="DefaultStyleSheet.css"/>
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            width: 150px;
            height: 30px;
            text-align: left;
        }
        .auto-style3 {
            width: 75%;
        }
        .auto-style7 {
            width: 150px;
        }
        .auto-style10 {
            width: 147px;
        }
        .auto-style11 {
            width: 78px;
        }
        .auto-style15 {
            height: 30px;
            text-align: left;
        }
        .auto-style16 {
            width: 75%;
            height: 30px;
            text-align: left;
        }
        .auto-style17 {
            width: 6%;
            height: 30px;
            text-align: left;
        }
        .auto-style18 {
            width: 96%;
        }
        .auto-style19 {
            width: 147px;
            height: 23px;
        }
        .auto-style20 {
            width: 78px;
            height: 23px;
        }
        .auto-style24 {
            width: 67px;
        }
        .auto-style25 {
            font-size: 13px;
            padding: 10px 8px 10px 14px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 6px;
            position: relative;
            border-radius: 50px;
            outline: none;
            width: 92px;
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body style="width: 1386px; height: 619px">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style18">
                <tr>
                    <td class="auto-style1" colspan="4">
                        <asp:Label ID="lblWelcome" runat="server" CssClass="topLabel" Text="Welcome message*"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" CssClass="myLabels" Text="Search by: "></asp:Label>
                    </td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="DropDownListSearch" runat="server" CssClass="auto-style25">
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                            <asp:ListItem>Author</asp:ListItem>
                            <asp:ListItem>Year</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtSearchKey" CssClass="textbox" runat="server" Height="16px" Width="258px"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="myRegularButtons" Text="Search" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
            </table>
        </div>
        <table style="width:100%;">
            <tr>
                <td rowspan="3">
                    <asp:Label ID="lblSqlError" runat="server" Visible="False"></asp:Label>
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label2" cssClass="myLabels" runat="server" Text="Filter by faculty:"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownListFaculty" CssClass="myDropdownlists" runat="server">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Bcom</asp:ListItem>
                        <asp:ListItem>B.Ing</asp:ListItem>
                        <asp:ListItem>BA</asp:ListItem>
                        <asp:ListItem>BPharm</asp:ListItem>
                        <asp:ListItem>B.Ed</asp:ListItem>
                        <asp:ListItem>BSc</asp:ListItem>
                        <asp:ListItem>N/A</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnFacultySort" cssClass="myRegularButtons" runat="server" OnClick="btnFacultySort_Click" Text="Sort" />
                </td>
            </tr>
            </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label3" runat="server" CssClass="myLabels" Text="Enter book ID:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtBookID" runat="server" CssClass="textbox" Width="98px" Height="16px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button1" cssClass="myRegularButtons" runat="server" OnClick="Button1_Click1" Text="Buy a book" Height="28px" Width="100px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style19">
                </td>
                <td class="auto-style20">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Button ID="btnAdd" CssClass="myRegularButtons" runat="server" OnClick="btnAdd_Click" Text="Add a book" />
                </td>
            </tr>
            <tr>
                <td class="auto-style19">
                    &nbsp;</td>
                <td class="auto-style1" colspan="2">
                    <asp:Label ID="lblerr" runat="server" CssClass="myLabels" ForeColor="Red" Text="*Please enter a book id" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
