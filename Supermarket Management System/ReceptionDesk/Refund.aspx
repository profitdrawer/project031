<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Refund.aspx.cs" Inherits="ReceptionDesk_Refund" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Style="left: 47px; position: relative; top: 3px"
            Text="退货操作"></asp:Label>
        <asp:Label ID="Label2" runat="server" Style="left: 0px; position: relative; top: 53px"
            Text="请输入售货单ID"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Style="left: 26px; position: relative;
            top: 51px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="left: 63px;
            position: relative; top: 51px" Text="确定" />&nbsp;
        <asp:Label ID="Label3" runat="server" Style="left: -264px; position: relative; top: 96px"
            Text="请输入商品ID"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Style="left: -186px; position: relative;
            top: 96px"></asp:TextBox></div>
    </form>
</body>
</html>
