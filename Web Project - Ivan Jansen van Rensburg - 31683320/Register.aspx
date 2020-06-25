<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Web_Project___Ivan_Jansen_van_Rensburg___31683320.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
        <link rel="stylesheet" type ="text/css" href="DefaultStyleSheet.css"/>

<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style12 {
            width: 16%;
        }
        .auto-style14 {
            height: 23px;
            width: 16%;
        }
        .auto-style15 {
            height: 23px;
            width: 66%;
        }
        .auto-style1 {
            height: 23px;
        }
        .auto-style11 {
            width: 281px;
        }
        .auto-style16 {
            width: 69%;
        }
        .auto-style17 {
            height: 23px;
            width: 281px;
        }
        .auto-style10 {
            height: 131px;
            width: 66%;
            text-align: center;
        }
        .auto-style18 {
            width: 100%;
            height: 397px;
        }
        .auto-style19 {
            height: 131px;
            width: 16%;
        }
        .auto-style20 {
            height: 131px;
        }
        .auto-style22 {
            width: 66%;
        }
        .auto-style23 {
            text-align: center;
            width: 906px;
        }
        </style>
</head>
<body style="width: 996px; height: 605px">
    <form id="form1" runat="server">
        <div>
        </div>
        <div class="auto-style23">
            <asp:Label ID="Label1" cssClass="topLabel" runat="server" Font-Bold="True" Text="Register"></asp:Label>
        </div>
        <table class="auto-style18">
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="Label2" runat="server" cssClass="myLabels" Text="First name:"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" cssClass="myLabels" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Warning: Required Field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label3" cssClass="myLabels" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style1" colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" cssClass="myLabels" runat="server" ControlToValidate="txtLastName" ErrorMessage="Warning: Required Field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="Label4" runat="server" cssClass="myLabels" Text="Email:"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" ></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" cssClass="myLabels" runat="server" ControlToValidate="txtEmail" ErrorMessage="Warning: Required Field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style16">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" cssClass="myLabels" runat="server" ControlToValidate="txtEmail" ErrorMessage="Warning: Invalid email adress" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label5" runat="server" cssClass="myLabels" Text="Enter Password:"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="textbox" ></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" cssClass="myLabels" runat="server" ControlToValidate="txtPass" ErrorMessage="Warning: Required Field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" cssClass="myLabels" ControlToCompare="txtPass" ControlToValidate="txtRePass" ErrorMessage="Warning: Passwords do not match" ForeColor="#FF3300"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label6" runat="server" cssClass="myLabels" Text="Re-enter Password:"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtRePass" runat="server" TextMode="Password" CssClass="textbox" ></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" cssClass="myLabels" runat="server" ControlToValidate="txtRePass" ErrorMessage="Warning: Required Field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lblPassError" runat="server" ForeColor="#FF3300" cssClass="myLabels" Text="Warning: Password too short" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style19">
                    <asp:HyperLink ID="HyperLink1" runat="server" cssClass="myLabels" NavigateUrl="~/Default.aspx">Back</asp:HyperLink>
                </td>
                <td class="auto-style10">
                    <asp:Button ID="btnRegister" runat="server"  OnClick="btnRegister_Click" Text="Register" cssClass="myButtons" Height="77px"/>
                </td>
                <td class="auto-style20" colspan="2"></td>
            </tr>
        </table>
    </form>
</body>
</html>
