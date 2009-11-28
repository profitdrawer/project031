<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="Cashier_cashier" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>收银员页面</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Style="z-index: 100; left: 57px; position: absolute;
            top: 62px" Text="购物单" Height="18px" Width="41px"></asp:Label>
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Style="z-index: 102; left: 72px; position: absolute;
            top: 220px" Text="购物单号"></asp:Label>
        <asp:TextBox ID="tbxBuyGoodsID" runat="server" Style="z-index: 103; left: 136px;
            position: absolute; top: 93px"></asp:TextBox>
        <asp:Button ID="btnBuy" runat="server" OnClick="btnBuy_Click" Style="z-index: 104;
            left: 307px; position: absolute; top: 95px" Text="添加到购物单" Width = "103px" />
        <asp:Label ID="Label3" runat="server" Style="z-index: 105; left: 81px; position: absolute;
            top: 94px" Text="商品ID"></asp:Label>
        <asp:Label ID="lblOrderStatus" runat="server" Style="z-index: 105; left: 561px; position: absolute;
            top: 213px" Font-Bold="True"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="tbxCashierID" runat="server" Style="z-index: 106; left: 141px; position: absolute;
            top: 266px" Enabled="False"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Style="z-index: 107; left: 70px; position: absolute;
            top: 271px" Text="收银员ID"></asp:Label>
        <asp:TextBox ID="tbxSellListId" runat="server" Style="z-index: 108; left: 139px; position: absolute;
            top: 215px"></asp:TextBox>
        <asp:TextBox ID="tbxMemberID" runat="server" Style="z-index: 108; left: 373px; position: absolute;
            top: 315px" Visible="False"></asp:TextBox>
        &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Style="z-index: 114; left: 337px; position: absolute;
            top: 215px" Text="日期"></asp:Label>
        <asp:TextBox ID="tbxSellDate" runat="server" Style="z-index: 115; left: 374px; position: absolute;
            top: 211px" Enabled="False"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Style="z-index: 116; left: 310px; position: absolute;
            top: 265px" Text="付费方式"></asp:Label>
        <asp:Label ID="lblMemberID" runat="server" Style="z-index: 116; left: 310px; position: absolute;
            top: 316px" Text="会员卡号" Visible="False"></asp:Label>
        <asp:TextBox ID="tbxCardPwd" runat="server" Visible="False" Style="z-index: 116; left: 373px; position: absolute;
            top: 358px"></asp:TextBox><asp:Label
            ID="lblCardPwd" runat="server" Style="z-index: 116; left: 310px; position: absolute;
            top: 359px" Text="会员卡密码" Visible="False"></asp:Label>
        <asp:DropDownList ID="DrDpDealway" runat="server" Style="z-index: 117; left: 374px;
            position: absolute; top: 263px" Width="130px" AutoPostBack="True">
        </asp:DropDownList>
        <asp:LinkButton ID="linkSearchGoods" runat="server" Style="left: 622px; position: absolute;
            top: 16px" OnClick="LinkButton1_Click" Font-Bold="True">商品搜索</asp:LinkButton>
        <asp:Label ID="Label5" runat="server" Style="left: 94px; position: absolute; top: 153px"
            Text="数量"></asp:Label>
        <asp:TextBox ID="tbxSellNum" runat="server" Style="left: 138px; position: absolute;
            top: 151px"></asp:TextBox>&nbsp;
        <asp:GridView ID="gvBuyGoods" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4"
            ForeColor="#333333" GridLines="None" Style="left: 56px; position: absolute; top: 398px" OnRowDeleting="gvBuyGoods_RowDeleting">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
        <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Style="left: 558px;
            position: absolute; top: 264px" Text="购物单结账" Width="103px" />&nbsp;
        <asp:LinkButton ID="linkLogout" runat="server" Style="left: 23px; position: absolute;
            top: 18px" OnClick="linkLogout_Click" Font-Bold="True">注销登陆</asp:LinkButton>
        &nbsp;
    </div>
    </form>
</body>
</html>
