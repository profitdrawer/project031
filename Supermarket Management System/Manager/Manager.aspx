<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Manager_Manager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>����Աҳ��</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="left: 125px;
            position: absolute; top: 18px">��Ʒ��Ӧ����Ϣ����</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Style="left: 129px;
            position: absolute; top: 113px">Ա����������</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" Style="left: 128px;
            position: absolute; top: 82px">��Ʒ���Ϲ���</asp:LinkButton>
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" Style="left: 128px;
            position: absolute; top: 48px">�ֿ���Ϣ����</asp:LinkButton>
        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" Style="left: 129px;
            position: absolute; top: 145px">��Ա��������</asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click" Style="left: 128px;
            position: absolute; top: 243px">�������ݲ�ѯ</asp:LinkButton>
        <asp:Label ID="Label1" runat="server" Style="left: 17px; position: absolute; top: 82px"
            Text="������Ϣ����"></asp:Label>
        <asp:Label ID="Label2" runat="server" Style="left: 17px; position: absolute; top: 276px"
            Text="��̬��������"></asp:Label>
        <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click" Style="left: 129px;
            position: absolute; top: 275px">��Ʒ��Ӧ��</asp:LinkButton>
        <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click" Style="left: 129px;
            position: absolute; top: 306px">��Ʒ��ⵥ</asp:LinkButton>
        <asp:LinkButton ID="LinkButton9" runat="server" OnClick="LinkButton9_Click" Style="left: 129px;
            position: absolute; top: 340px">ȱ���Ǽǹ���</asp:LinkButton>
        <asp:LinkButton ID="linkLogout" runat="server" Style="left: 537px;
            position: absolute; top: 22px" Font-Bold="True" OnClick="linkLogout_Click">ע����½</asp:LinkButton>
        <asp:LinkButton ID="LinkButton10" runat="server" Style="left: 129px;
            position: absolute; top: 179px" OnClick="LinkButton10_Click">��Ա���ȼ�����</asp:LinkButton></div>
    </form>
</body>
</html>
