<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Manager_Manager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="left: 125px;
            position: relative; top: 18px">��Ʒ��Ӧ����Ϣ����</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Style="left: 14px;
            position: relative; top: 102px">Ա����������</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" Style="left: -62px;
            position: relative; top: 72px">��Ʒ���Ϲ���</asp:LinkButton>
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" Style="left: -139px;
            position: relative; top: 45px">�ֿ���Ϣ����</asp:LinkButton>
        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" Style="left: -213px;
            position: relative; top: 131px">��Ա��������</asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click" Style="left: -283px;
            position: relative; top: 253px">�������ݲ�ѯ</asp:LinkButton>
        <asp:Label ID="Label1" runat="server" Style="left: -469px; position: relative; top: 8px"
            Text="������Ϣ����"></asp:Label>
        <asp:Label ID="Label2" runat="server" Style="left: -542px; position: relative; top: 175px"
            Text="��̬��������"></asp:Label>
        <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click" Style="left: -509px;
            position: relative; top: 192px">��Ʒ��Ӧ��</asp:LinkButton>
        <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click" Style="left: -573px;
            position: relative; top: 224px">��Ʒ��ⵥ</asp:LinkButton></div>
    </form>
</body>
</html>
