<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_Project___Ivan_Jansen_van_Rensburg___31683320.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
        <link rel="stylesheet" type ="text/css" href="DefaultStyleSheet.css"/>
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style7 {
            width: 286px;
            height: 53px;
        }
        .auto-style6 {
            width: 10%;
            text-align: center;
        }
        .auto-style12 {
            height: 53px;
            width: 34%;
        }
        .auto-style13 {
            width: 18%;
        }
        .auto-style14 {
            width: 18%;
            height: 53px;
        }
        .auto-style16 {
            width: 100%;
            height: 341px;
        }
        .auto-style17 {
            width: 18%;
            height: 43px;
        }
        .auto-style19 {
            height: 43px;
            width: 34%;
        }
        .auto-style21 {
            width: 18%;
            height: 122px;
        }
        .auto-style22 {
            width: 10%;
            text-align: center;
            height: 122px;
        }
        .auto-style23 {
            height: 122px;
        }
        .auto-style24 {
            height: 43px;
            width: 286px;
        }
        .auto-style25 {
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            font-size: 15px;
        }
        .auto-style26 {
            width: 10%;
            height: 43px;
        }
        .auto-style27 {
            width: 10%;
            height: 53px;
        }
        </style>
</head>
<body style="width: 1192px; height: 534px">
    <form id="form1" runat="server">
        <div>
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" CssClass="topLabel" Text="Login To Community Bookstore"></asp:Label>
        </div>
        <table class="auto-style16">
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="Label2" runat="server" cssClass="myLabels" Text="Enter Email:"></asp:Label>
                </td>
                <td class="auto-style26">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Width="220px"></asp:TextBox>
                </td>
                <td class="auto-style24">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Warning: Invalid email adress" ForeColor="#FF3300" cssClass="myLabels" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style19">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Warning: Required Field" CssClass="myLabels" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label3" runat="server" CssClass="myLabels" Text="Enter Password:"></asp:Label>
                </td>
                <td class="auto-style27">
                    <asp:TextBox ID="txtPass" runat="server" CssClass="textbox" TextMode="Password" Width="220px"></asp:TextBox>
                </td>
                <td class="auto-style7"></td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Warning: Required Field" CssClass="myLabels" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">
                    </td>
                <td class="auto-style22">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" cssClass="myButtons"/>
                </td>
                <td colspan="2" class="auto-style23">
                    <asp:Label ID="lblErr" runat="server" Visible="False" CssClass="topLabel" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label4" runat="server" cssClass="myLabels" Text="Not Registered?"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="myLabels" NavigateUrl="~/Register.aspx">Click here to register</asp:HyperLink>
                </td>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
                <audio controls autoplay="autoplay" loop="loop">
                    <source src="Background_Loop.mp3" type="audio/ogg">
                </audio>
</html>
