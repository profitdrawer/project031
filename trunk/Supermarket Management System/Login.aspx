<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>LoginModel</title>
    <link href="" rel="stylesheet" type="text/css" />
</head>
<body style="color: navy; font-family: Arial; background-color: silver; background-image: url(background.jpg);">
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="LoginLabel" runat="server" Style="z-index: 100; left: 399px; position: absolute;
            top: 169px" Text="用户登录" Font-Bold="True" Font-Names="Arial Black" Font-Size="X-Large"
            Height="38px" Width="116px"></asp:Label>
        <asp:Label ID="LabelName" runat="server" Style="z-index: 101; left: 467px; position: absolute;
            top: 262px" Text="用户名" Font-Overline="False" Font-Strikeout="False" Width="69px"></asp:Label>
        <asp:Label ID="LabelRole" runat="server" Style="z-index: 102; left: 468px; position: absolute;
            top: 308px" Text="登录身份" Width="68px"></asp:Label>
        <asp:Label ID="LabelPassword" runat="server" Style="z-index: 103; left: 472px; position: absolute;
            top: 355px" Text="密码" Width="64px"></asp:Label>
        <asp:TextBox ID="tbxPassword" runat="server" Style="z-index: 104; left: 565px; position: absolute;
            top: 351px" Height="21px" Width="167px" TextMode="Password"></asp:TextBox>
        <asp:TextBox ID="tbxName" runat="server" Style="z-index: 105; left: 565px; position: absolute;
            top: 258px" Height="21px" Width="167px"></asp:TextBox>
        <asp:DropDownList ID="LoginRole" runat="server" Style="z-index: 106; left: 565px;
            position: absolute; top: 306px" Height="21px" Width="167px">
        </asp:DropDownList>
        <asp:Button ID="LoginButton" runat="server" Style="z-index: 108; left: 471px; position: absolute;
            top: 417px" Text="确定" Width="88px" OnClick="LoginButton_Click" />
        <asp:Button ID="CancelButton" runat="server" Style="z-index: 107; left: 630px; position: absolute;
            top: 417px" Text="取消" Width="88px" OnClick="CancelButton_Click" />
        <asp:RequiredFieldValidator ID="labError" runat="server" ErrorMessage="用户名或密码错误，无法登录！"
            Style="z-index: 109; left: 567px; position: absolute; top: 217px" ControlToValidate="tbxName"
            EnableViewState="False" Visible="False"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="You must type a username!"
            Style="z-index: 110; left: 755px; position: absolute; top: 262px" ControlToValidate="tbxName"
            Width="192px">*</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="You nust specify a password!"
            Style="z-index: 111; left: 755px; position: absolute; top: 355px" ControlToValidate="tbxPassword"
            Font-Overline="False" Height="1px" Width="205px">*</asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidMessage" runat="server" ShowMessageBox="True" ShowSummary="False"
            Style="z-index: 112; left: 758px; position: absolute; top: 287px" Width="203px" />
        &nbsp;&nbsp;
        <asp:Image ID="topImage" runat="server" Height="120px" ImageAlign="Top" ImageUrl="~/top.bmp"
            Style="z-index: 114; left: 0px; position: absolute; top: 0px" Width="1264px" />
    </div>
    </form>
</body>
</html>
