<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupplierMag.aspx.cs" Inherits="Manager_SupplierMag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>商品供应单<br />
        </strong>
        <br />
        显示所有：<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" Style="z-index: 102; left: 263px; position: absolute;
            top: 421px" Text="Search"  />      
        <br />
        <asp:GridView ID="gvGoodsProvidingList" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" Style="z-index: 103; left: 14px; position: absolute; top: 81px"
            Width="844px"  Height="1px" DataKeyNames="ListID" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="ListID" HeaderText="ListID" ReadOnly="True" SortExpression="ListID" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID" />
                <asp:BoundField DataField="NeedNum" HeaderText="NeedNum" SortExpression="NeedNum" />
                <asp:BoundField DataField="ListDate" HeaderText="ListDate" SortExpression="ListDate" />
                <asp:BoundField DataField="AffordMoney" HeaderText="AffordMoney" SortExpression="AffordMoney" />
                <asp:BoundField DataField="ListMoreInfo" HeaderText="ListMoreInfo" SortExpression="ListMoreInfo" />
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoodsProvidingConnectionString %>"
            DeleteCommand="DELETE FROM [GoodsProviding] WHERE [ListID] = @ListID" InsertCommand="INSERT INTO [GoodsProviding] ([ListID], [GoodsID], [SupplierID], [NeedNum], [ListDate], [AffordMoney], [ListMoreInfo]) VALUES (@ListID, @GoodsID, @SupplierID, @NeedNum, @ListDate, @AffordMoney, @ListMoreInfo)"
            SelectCommand="SELECT * FROM [GoodsProviding]" UpdateCommand="UPDATE [GoodsProviding] SET [GoodsID] = @GoodsID, [SupplierID] = @SupplierID, [NeedNum] = @NeedNum, [ListDate] = @ListDate, [AffordMoney] = @AffordMoney, [ListMoreInfo] = @ListMoreInfo WHERE [ListID] = @ListID">
            <DeleteParameters>
                <asp:Parameter Name="ListID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="GoodsID" Type="String" />
                <asp:Parameter Name="SupplierID" Type="String" />
                <asp:Parameter Name="NeedNum" Type="Int32" />
                <asp:Parameter Name="ListDate" Type="DateTime" />
                <asp:Parameter Name="AffordMoney" Type="Decimal" />
                <asp:Parameter Name="ListMoreInfo" Type="String" />
                <asp:Parameter Name="ListID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ListID" Type="String" />
                <asp:Parameter Name="GoodsID" Type="String" />
                <asp:Parameter Name="SupplierID" Type="String" />
                <asp:Parameter Name="NeedNum" Type="Int32" />
                <asp:Parameter Name="ListDate" Type="DateTime" />
                <asp:Parameter Name="AffordMoney" Type="Decimal" />
                <asp:Parameter Name="ListMoreInfo" Type="String" />
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
        供应单编号：<br />
        &nbsp;&nbsp;<br />
        <asp:TextBox ID="TextBox8" runat="server" Style="left: 81px; position: relative;
            top: -38px"></asp:TextBox>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ListID" DataSourceID="SqlDataSource2"
            ForeColor="#333333" GridLines="None" Style="position: relative">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="ListID" HeaderText="ListID" ReadOnly="True" SortExpression="ListID" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID" />
                <asp:BoundField DataField="NeedNum" HeaderText="NeedNum" SortExpression="NeedNum" />
                <asp:BoundField DataField="ListDate" HeaderText="ListDate" SortExpression="ListDate" />
                <asp:BoundField DataField="AffordMoney" HeaderText="AffordMoney" SortExpression="AffordMoney" />
                <asp:BoundField DataField="ListMoreInfo" HeaderText="ListMoreInfo" SortExpression="ListMoreInfo" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString11 %>"
            SelectCommand="SELECT * FROM [GoodsProviding] WHERE ([ListID] = @ListID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox8" Name="ListID" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        &nbsp;&nbsp;
        <br />
        <br />
        <strong>
        新增数据<br />
            <br />
            <table style="position: relative">
                <tr>
                    <td style="width: 100px">
                        供应单编号:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox1" runat="server" Style="position: relative"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    商品编号:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox2" runat="server" Style="position: relative"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        供应商编号:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox3" runat="server" Style="position: relative"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 23px;">
                        供应量:</td>
                    <td style="width: 100px; height: 23px;">
                        <asp:TextBox ID="TextBox4" runat="server" Style="position: relative"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        供应日期:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox5" runat="server" Style="position: relative"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        总计费用:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox6" runat="server" Style="position: relative"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 36px">
                        备注:</td>
                    <td style="width: 100px; height: 36px">
                        <asp:TextBox ID="TextBox7" runat="server" Height="25px" Style="position: relative"></asp:TextBox></td>
                </tr>
            </table>
            <br />
        <br />
        </strong>&nbsp;
        <asp:Button ID="btnInsert" runat="server" Style="z-index: 116; left: 95px; position: absolute;
            top: 876px" Text="添加" OnClick="btnInsert_Click" />
      
    </div>
    </form>
</body>
</html>
