<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="Web_Project___Ivan_Jansen_van_Rensburg___31683320.AddBook" %>

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
            width: 264px;
        }
        .auto-style3 {
            height: 23px;
            width: 264px;
        }
        .auto-style4 {
            width: 290px;
        }
        .auto-style5 {
            height: 23px;
            width: 290px;
        }
        .auto-style6 {
            width: 264px;
            height: 25px;
        }
        .auto-style7 {
            width: 290px;
            height: 25px;
        }
        .auto-style8 {
            height: 25px;
        }
    </style>
</head>
<body style="width: 1102px; height: 629px">
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="3">
                        <asp:Label ID="Label1" runat="server" CssClass="topLabel" Text="Add your credentials to advertise your book:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label8" runat="server" CssClass="myLabels" Text="Book ID:"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtNewID" CssClass="textbox" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="myLabels" runat="server" ControlToValidate="txtNewID" ErrorMessage="*This is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" CssClass="myLabels" Text="Book name:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtName" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="myLabels" runat="server" ControlToValidate="txtName" ErrorMessage="*This is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" CssClass="myLabels" Text="Author:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAuthor" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="myLabels" runat="server" ControlToValidate="txtAuthor" ErrorMessage="*This is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" CssClass="myLabels" Text="Year released:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtYear" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="myLabels" ControlToValidate="txtYear" ErrorMessage="*This is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label5" runat="server" CssClass="myLabels" Text="Facutly of book:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                    <asp:DropDownList ID="DropDownListFaculty" CssClass="myDropdownlists" runat="server">
                        <asp:ListItem>BSc</asp:ListItem>
                        <asp:ListItem>Bcom</asp:ListItem>
                        <asp:ListItem>B.Ing</asp:ListItem>
                        <asp:ListItem>BA</asp:ListItem>
                        <asp:ListItem>BPharm</asp:ListItem>
                        <asp:ListItem>B.Ed</asp:ListItem>
                        <asp:ListItem>N/A</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label6" runat="server" CssClass="myLabels" Text="Price for the book:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="myLabels" runat="server" ControlToValidate="txtPrice" ErrorMessage="*This is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label7" runat="server" CssClass="myLabels" Text="Advertiser Email:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="myLabels" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Invalid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="btnAddBook" runat="server" CssClass="myButtons" OnClick="btnAddBook_Click" Text="Add Book" />
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblError" runat="server" CssClass="myLabels" ForeColor="#FF3300" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="myLabels" NavigateUrl="~/Main.aspx">Cancel</asp:HyperLink>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
