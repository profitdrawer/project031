<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReceptionDesk.aspx.cs" Inherits="ReceptionDesk_ReceptionDesk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>��Ա��̨</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="left: 101px;
            position: relative; top: 124px">��Ա��ֵ </asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Style="left: 49px;
            position: relative; top: 176px">�˻�����</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" Style="left: -4px;
            position: relative; top: 69px">��Աע��</asp:LinkButton>
        <asp:LinkButton ID="linkLogout" runat="server" Style="left: 438px;
            position: absolute; top: 52px" Font-Bold="True" OnClick="linkLogout_Click">ע����¼</asp:LinkButton></div>
    </form>
</body>
</html>
