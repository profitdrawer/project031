<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="Cashier_cashier" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Style="z-index: 100; left: 35px; position: absolute;
            top: 24px" Text="购物单" Height="18px" Width="41px"></asp:Label>
        &nbsp;
        <asp:Label ID="Label2" runat="server" Style="z-index: 102; left: 57px; position: absolute;
            top: 182px" Text="购物单号"></asp:Label>
        <asp:TextBox ID="tbxBuyGoodsID" runat="server" Style="z-index: 103; left: 114px;
            position: absolute; top: 55px"></asp:TextBox>
        <asp:Button ID="btnBuy" runat="server" OnClick="btnBuy_Click" Style="z-index: 104;
            left: 285px; position: absolute; top: 57px" Text="购买" />
        <asp:Label ID="Label3" runat="server" Style="z-index: 105; left: 59px; position: absolute;
            top: 56px" Text="商品ID"></asp:Label>
        <asp:TextBox ID="tbxEmployeeID" runat="server" Style="z-index: 106; left: 126px; position: absolute;
            top: 228px"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Style="z-index: 107; left: 55px; position: absolute;
            top: 233px" Text="收银员ID"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 108; left: 124px; position: absolute;
            top: 177px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Style="z-index: 109; left: 556px; position: absolute;
            top: 223px" Text="结账" OnClick="Button2_Click" />
        &nbsp; &nbsp;
        &nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Style="z-index: 114; left: 322px; position: absolute;
            top: 177px" Text="日期"></asp:Label>
        <asp:TextBox ID="tbxSellDate" runat="server" Style="z-index: 115; left: 359px; position: absolute;
            top: 173px"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Style="z-index: 116; left: 303px; position: absolute;
            top: 223px" Text="付费方式"></asp:Label>
        <asp:DropDownList ID="DrDpdealway" runat="server" Style="z-index: 117; left: 368px;
            position: absolute; top: 221px" Width="149px">
        </asp:DropDownList>
        <asp:LinkButton ID="LinkButton1" runat="server" Style="left: 780px; position: relative;
            top: 6px" OnClick="LinkButton1_Click">商品搜索</asp:LinkButton>
        <asp:Label ID="Label5" runat="server" Style="left: -75px; position: relative; top: 73px"
            Text="数量"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Style="left: -61px; position: relative;
            top: 72px"></asp:TextBox>
        <asp:GridView ID="gvBuyGoods" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="GoodsID" DataSourceID="SqlDataSource1"
            ForeColor="#333333" GridLines="None" Style="left: 5px; position: relative; top: 292px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" ReadOnly="True" SortExpression="GoodsID" />
                <asp:BoundField DataField="GoodsName" HeaderText="GoodsName" SortExpression="GoodsName" />
                <asp:BoundField DataField="SellingPrice" HeaderText="SellingPrice" SortExpression="SellingPrice" />
                <asp:BoundField DataField="MemberPrice" HeaderText="MemberPrice" SortExpression="MemberPrice" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Style="left: 612px; position: relative;
            top: -94px"></asp:TextBox>
        &nbsp; &nbsp;
        <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Style="left: -562px;
            position: relative; top: -226px" Text="添加" Width="103px" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gvBuyGoodsConnectionString %>"
            DeleteCommand="DELETE FROM [Commodity] WHERE [GoodsID] = @GoodsID" InsertCommand="INSERT INTO [Commodity] ([GoodsID], [GoodsName], [SellingPrice], [MemberPrice]) VALUES (@GoodsID, @GoodsName, @SellingPrice, @MemberPrice)"
            SelectCommand="SELECT [GoodsID], [GoodsName], [SellingPrice], [MemberPrice] FROM [Commodity] WHERE ([GoodsID] = @GoodsID)"
            UpdateCommand="UPDATE [Commodity] SET [GoodsName] = @GoodsName, [SellingPrice] = @SellingPrice, [MemberPrice] = @MemberPrice WHERE [GoodsID] = @GoodsID">
            <DeleteParameters>
                <asp:Parameter Name="GoodsID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="GoodsName" Type="String" />
                <asp:Parameter Name="SellingPrice" Type="Decimal" />
                <asp:Parameter Name="MemberPrice" Type="Decimal" />
                <asp:Parameter Name="GoodsID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="GoodsID" Type="String" />
                <asp:Parameter Name="GoodsName" Type="String" />
                <asp:Parameter Name="SellingPrice" Type="Decimal" />
                <asp:Parameter Name="MemberPrice" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="tbxBuyGoodsID" Name="GoodsID" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
