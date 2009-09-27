<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StockMag.aspx.cs" Inherits="Manager_StockMag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>商品库存情况<br />
            <br />
        </strong>显示所有： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" Style="z-index: 102; left: 262px; position: absolute;
            top: 417px" Text="Search"  />      
        <br />
        <asp:GridView ID="gvGoodsStockingList" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" Style="z-index: 103; left: 45px; position: absolute; top: 80px"
            Width="844px" Height="177px" DataKeyNames="StockListID" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="StockListID" HeaderText="StockListID" ReadOnly="True"
                    SortExpression="StockListID" />
                <asp:BoundField DataField="StockID" HeaderText="StockID" SortExpression="StockID" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                <asp:BoundField DataField="StockDate" HeaderText="StockDate" SortExpression="StockDate" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="ProduceDate" HeaderText="ProduceDate" SortExpression="ProduceDate" />
                <asp:BoundField DataField="shelflife" HeaderText="shelflife" SortExpression="shelflife" />
                <asp:BoundField DataField="PurchasePrice" HeaderText="PurchasePrice" SortExpression="PurchasePrice" />
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoodsStockingConnectionString %>"
            DeleteCommand="DELETE FROM [GoodsStocking] WHERE [StockListID] = @StockListID"
            InsertCommand="INSERT INTO [GoodsStocking] ([StockListID], [StockID], [GoodsID], [StockDate], [Amount], [ProduceDate], [shelflife], [PurchasePrice]) VALUES (@StockListID, @StockID, @GoodsID, @StockDate, @Amount, @ProduceDate, @shelflife, @PurchasePrice)"
            SelectCommand="SELECT * FROM [GoodsStocking]" UpdateCommand="UPDATE [GoodsStocking] SET [StockID] = @StockID, [GoodsID] = @GoodsID, [StockDate] = @StockDate, [Amount] = @Amount, [ProduceDate] = @ProduceDate, [shelflife] = @shelflife, [PurchasePrice] = @PurchasePrice WHERE [StockListID] = @StockListID">
            <DeleteParameters>
                <asp:Parameter Name="StockListID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="StockID" Type="String" />
                <asp:Parameter Name="GoodsID" Type="String" />
                <asp:Parameter Name="StockDate" Type="DateTime" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="ProduceDate" Type="DateTime" />
                <asp:Parameter Name="shelflife" Type="String" />
                <asp:Parameter Name="PurchasePrice" Type="Decimal" />
                <asp:Parameter Name="StockListID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="StockListID" Type="String" />
                <asp:Parameter Name="StockID" Type="String" />
                <asp:Parameter Name="GoodsID" Type="String" />
                <asp:Parameter Name="StockDate" Type="DateTime" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="ProduceDate" Type="DateTime" />
                <asp:Parameter Name="shelflife" Type="String" />
                <asp:Parameter Name="PurchasePrice" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;入库单编号：<br />
        <strong>
            <br />
            <asp:TextBox ID="TextBox9" runat="server" Style="left: 85px; position: relative;
                top: -40px"></asp:TextBox><br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="StockListID" DataSourceID="SqlDataSource2" ForeColor="#333333"
                GridLines="None" Style="position: relative">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="StockListID" HeaderText="StockListID" ReadOnly="True"
                        SortExpression="StockListID" />
                    <asp:BoundField DataField="StockID" HeaderText="StockID" SortExpression="StockID" />
                    <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                    <asp:BoundField DataField="StockDate" HeaderText="StockDate" SortExpression="StockDate" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="ProduceDate" HeaderText="ProduceDate" SortExpression="ProduceDate" />
                    <asp:BoundField DataField="shelflife" HeaderText="shelflife" SortExpression="shelflife" />
                    <asp:BoundField DataField="PurchasePrice" HeaderText="PurchasePrice" SortExpression="PurchasePrice" />
                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <EditRowStyle BackColor="#2461BF" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString12 %>"
                SelectCommand="SELECT * FROM [GoodsStocking] WHERE ([StockListID] = @StockListID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox9" Name="StockListID" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        新增数据<br />
        <br />
        </strong>&nbsp;
        <table style="z-index: 115; left: 2px; position: relative; top: -24px">
            <tr>
                <td style="width: 100px">
                    入库单编号:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 100; left: 0px; position: relative;
                        top: 0px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    仓库编号:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox2" runat="server" Style="position: relative"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    商品编号:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox3" runat="server" Style="position: relative"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    入库日期:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox4" runat="server" Style="position: relative"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    入库量:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox5" runat="server" Style="position: relative"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    生产日期:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox6" runat="server" Style="position: relative"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    货架寿命:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox7" runat="server" Style="position: relative"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    商品进价:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox8" runat="server" Style="position: relative"></asp:TextBox></td>
            </tr>
        </table>
        <asp:Button ID="btnInsert" runat="server" Style="z-index: 114; left: 87px; position: absolute;
            top: 803px" Text="添加" OnClick="btnInsert_Click" />
      
    </div>
    </form>
</body>
</html>
