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
        <asp:LinkButton ID="linkLogout" runat="server" OnClick="linkLogout_Click" Font-Bold="True">注销登陆</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="linkSearchGoods" runat="server" OnClick="LinkButton1_Click" Font-Bold="True">商品搜索</asp:LinkButton><br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="购物单" Font-Bold="True" Font-Italic="False" Font-Size="XX-Large"></asp:Label><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp;
        <table>
            <tr>
                <td style="width: 60px">
                    <asp:Label ID="Label3" runat="server" Text="商品ID"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tbxBuyGoodsID" runat="server"></asp:TextBox></td>
                <td style="width: 3px">
                    </td>
            </tr>
            <tr>
                <td style="width: 60px">
                    <asp:Label ID="Label5" runat="server" Text="数量"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tbxSellNum" runat="server"></asp:TextBox></td>
                <td style="width: 3px">
                    <asp:Button ID="btnAddToList" runat="server" OnClick="btnAddToList_Click" Text="添加到购物单" Width = "103px" /></td>
            </tr>
        </table>
        <br />
        <br />
        
        <table>
            <tr>
                <td style="width: 60px">
                    <asp:Label ID="Label2" runat="server" Text="购物单号"></asp:Label></td>
                <td style="width: 131px">
                    <asp:TextBox ID="tbxSellListId" runat="server" ></asp:TextBox></td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="日期"></asp:Label></td>
                <td style="width: 134px">
                    <asp:TextBox ID="tbxSellDate" runat="server" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 60px">
                    <asp:Label ID="Label4" runat="server" Text="收银员ID"></asp:Label></td>
                <td style="width: 131px">
                    <asp:TextBox ID="tbxCashierID" runat="server" Enabled="False"></asp:TextBox></td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="付费方式"></asp:Label></td>
                <td style="width: 134px">
        <asp:DropDownList ID="DrDpDealway" runat="server" AutoPostBack="True">
        </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 60px">
                </td>
                <td style="width: 131px">
                </td>
                <td>
                    <asp:Label ID="lblMemberID" runat="server" Text="会员卡号" Visible="False"></asp:Label></td>
                <td style="width: 134px">
                    <asp:TextBox ID="tbxMemberID" runat="server" Visible="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 60px">
                </td>
                <td style="width: 131px">
                </td>
                <td>
                    <asp:Label ID="lblCardPwd" runat="server" Text="会员卡密码" Visible="False"></asp:Label></td>
                <td style="width: 134px">
                    <asp:TextBox ID="tbxCardPwd" runat="server" Visible="False"></asp:TextBox></td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="gvBuyGoods" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4"
            ForeColor="#333333" GridLines="None" OnRowDeleting="gvBuyGoods_RowDeleting">
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
        <br />
        <asp:Button ID="btnReviewPrice" runat="server" OnClick="btnReviewPrice_Click" Text="查看总价" Width="103px" />
        <asp:Label ID="lblReviewPriceStatus" runat="server" Font-Bold="True"></asp:Label><br />
        <br />
        <asp:GridView ID="gvGoodsPrice" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:Label ID="lblViewPrice" runat="server" Text="总价：" Visible="False"></asp:Label>
        <asp:Label ID="lblTotalPrice" runat="server" Visible="False"></asp:Label><br />
        <asp:Label ID="lblRemain" runat="server" Text="会员卡余额：" Visible="False"></asp:Label>
        <asp:Label ID="lblCardRemainAmount" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
    </div><asp:Button ID="btnBill" runat="server" OnClick="btnBuy_Click" Text="结账" Width="103px" />
        <asp:Label ID="lblOrderStatus" runat="server" Font-Bold="True"></asp:Label>
    </form>
</body>
</html>
