<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoodsSearch.aspx.cs" Inherits="Cashier_GoodsQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="tbxCommodityName" runat="server" Style="z-index: 100; left: 107px; position: absolute;
            top: 173px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Style="z-index: 101; left: 79px; position: absolute;
            top: 122px" Text="��Ʒ����" Width="97px"></asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Style="z-index: 102; left: 26px; position: absolute;
            top: 178px" Text="��Ʒ��"></asp:Label>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Style="z-index: 103;
            left: 32px; position: absolute; top: 315px" Text="����" Width="85px" />
        &nbsp;
        <asp:GridView ID="gvCommoditySearch" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" Height="289px" Style="z-index: 104; left: 329px;
            position: absolute; top: 64px" Width="805px" DataKeyNames="GoodsID" DataSourceID="goods" OnSelectedIndexChanged="gvCommoditySearch_SelectedIndexChanged">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" ReadOnly="True" SortExpression="GoodsID" />
                <asp:BoundField DataField="GoodsName" HeaderText="GoodsName" SortExpression="GoodsName" />
                <asp:BoundField DataField="SellingPrice" HeaderText="SellingPrice" SortExpression="SellingPrice" />
                <asp:BoundField DataField="MemberPrice" HeaderText="MemberPrice" SortExpression="MemberPrice" />
                <asp:CheckBoxField DataField="sellstate" HeaderText="sellstate" SortExpression="sellstate" />
                <asp:BoundField DataField="GoodsMoreInfo" HeaderText="GoodsMoreInfo" SortExpression="GoodsMoreInfo" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="goods" runat="server" ConnectionString="<%$ ConnectionStrings:goodsConnectionString %>"
            SelectCommand="SELECT [GoodsID], [GoodsName], [SellingPrice], [MemberPrice], [sellstate], [GoodsMoreInfo] FROM [Commodity] WHERE (([GoodsName] LIKE '%' + @GoodsName + '%') AND ([SellingPrice] >= @SellingPrice) AND ([SellingPrice] <= @SellingPrice2)) ORDER BY [GoodsID]">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbxCommodityName" Name="GoodsName" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="tbxPriceFrom" DefaultValue="0" Name="SellingPrice"
                    PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="tbxPriceTo" DefaultValue="10000" Name="SellingPrice2"
                    PropertyName="Text" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;
        <asp:Label ID="Label2" runat="server" Style="z-index: 105; left: 42px; position: absolute;
            top: 229px" Text="�۸�"></asp:Label>
        <asp:TextBox ID="tbxPriceFrom" runat="server" Height="18px" Style="z-index: 106;
            left: 106px; position: absolute; top: 225px" Width="104px"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Style="z-index: 107; left: 238px; position: absolute;
            top: 227px" Text="Ԫ"></asp:Label>
        <asp:TextBox ID="tbxPriceTo" runat="server" Style="z-index: 108; left: 105px; position: absolute;
            top: 262px" Width="104px"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Style="z-index: 109; left: 81px; position: absolute;
            top: 264px" Text="~"></asp:Label>
        <asp:Label ID="Label6" runat="server" Style="z-index: 110; left: 238px; position: absolute;
            top: 264px" Text="Ԫ"></asp:Label>
        <asp:Button ID="btnClearSearch" runat="server" Height="24px" OnClick="btnClearSearch_Click"
            Style="z-index: 112; left: 172px; position: absolute; top: 314px" Text="ȡ��" Width="85px" />
        
    
    </div>
    </form>
</body>
</html>
