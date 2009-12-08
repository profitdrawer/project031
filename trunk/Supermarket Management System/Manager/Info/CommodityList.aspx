<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CommodityList.aspx.cs" Inherits="Manager_CommodityData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>商品信息管理</title>
    <link href="../../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>
            商品信息列表<br />
            <br />
        </strong>查询条件： &nbsp; 商品ID： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnSearch" runat="server" Style="z-index: 102; left: 313px; position: absolute;
            top: 123px" Text="Search"  />      
        <br />
        <asp:GridView ID="gvCommodityList" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" Style="z-index: 103; left: 40px; position: absolute; top: 158px"
            Width="844px"  Height="177px" DataKeyNames="GoodsID" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" ReadOnly="True" SortExpression="GoodsID" />
                <asp:BoundField DataField="GoodsName" HeaderText="GoodsName" SortExpression="GoodsName" />
                <asp:BoundField DataField="SellingPrice" HeaderText="SellingPrice" SortExpression="SellingPrice" />
                <asp:BoundField DataField="MemberPrice" HeaderText="MemberPrice" SortExpression="MemberPrice" />
                <asp:BoundField DataField="StockNum" HeaderText="StockNum" SortExpression="StockNum" />
                <asp:BoundField DataField="AlarmNum" HeaderText="AlarmNum" SortExpression="AlarmNum" />
                <asp:CheckBoxField DataField="sellstate" HeaderText="sellstate" SortExpression="sellstate" />
                <asp:BoundField DataField="GoodsMoreInfo" HeaderText="GoodsMoreInfo" SortExpression="GoodsMoreInfo" />
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        &nbsp; &nbsp;&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 商品名称：<br />
        <asp:TextBox ID="TextBox6" runat="server" Style="left: 126px; position: relative;
            top: -54px"></asp:TextBox><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 警戒数量：<asp:TextBox ID="TextBox5"
            runat="server" Style="left: 2px; position: relative; top: -38px"></asp:TextBox><br />
        <asp:TextBox ID="TextBox10" runat="server" Style="left: 128px; position: relative;
            top: -26px"></asp:TextBox><br />
        <asp:SqlDataSource CancelSelectOnNullParameter="false" ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoodsInfoConnectionString %>"
            DeleteCommand="DELETE FROM [Commodity] WHERE [GoodsID] = @GoodsID" InsertCommand="INSERT INTO [Commodity] ([GoodsID], [GoodsName], [SellingPrice], [MemberPrice], [StockNum], [AlarmNum], [sellstate], [GoodsMoreInfo]) VALUES (@GoodsID, @GoodsName, @SellingPrice, @MemberPrice, @StockNum, @AlarmNum, @sellstate, @GoodsMoreInfo)"
            SelectCommand="SELECT * FROM [Commodity] WHERE (([GoodsID] = @GoodsID) OR ([GoodsName] LIKE '%' + @GoodsName + '%') OR ([AlarmNum] = @AlarmNum))" UpdateCommand="UPDATE [Commodity] SET [GoodsName] = @GoodsName, [SellingPrice] = @SellingPrice, [MemberPrice] = @MemberPrice, [StockNum] = @StockNum, [AlarmNum] = @AlarmNum, [sellstate] = @sellstate, [GoodsMoreInfo] = @GoodsMoreInfo WHERE [GoodsID] = @GoodsID" ProviderName="System.Data.SqlClient">
            <DeleteParameters>
                <asp:Parameter Name="GoodsID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="GoodsName" Type="String" />
                <asp:Parameter Name="SellingPrice" Type="Decimal" />
                <asp:Parameter Name="MemberPrice" Type="Decimal" />
                <asp:Parameter Name="StockNum" Type="Int32" />
                <asp:Parameter Name="AlarmNum" Type="Int32" />
                <asp:Parameter Name="sellstate" Type="Boolean" />
                <asp:Parameter Name="GoodsMoreInfo" Type="String" />
                <asp:Parameter Name="GoodsID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="GoodsID" Type="String" />
                <asp:Parameter Name="GoodsName" Type="String" />
                <asp:Parameter Name="SellingPrice" Type="Decimal" />
                <asp:Parameter Name="MemberPrice" Type="Decimal" />
                <asp:Parameter Name="StockNum" Type="Int32" />
                <asp:Parameter Name="AlarmNum" Type="Int32" />
                <asp:Parameter Name="sellstate" Type="Boolean" />
                <asp:Parameter Name="GoodsMoreInfo" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox6" DefaultValue="0" Name="GoodsID" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="TextBox5" DefaultValue="0" Name="GoodsName" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="TextBox10" DefaultValue="0" Name="AlarmNum" PropertyName="Text"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
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
        &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <br />
        <strong>
        新增数据<br />
        <br />
        </strong>&nbsp;
        <table border="0" style="z-index: 115; left: 83px; position: absolute; top: 530px">
            <tr>
                <td style="width: 107px; height: 33px">
                    商品编号:</td>
                <td style="width: 218px; height: 33px">
                    <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 100; left: 113px; position: absolute;
                        top: 11px" Width="181px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 29px">
                    商品名称:</td>
                <td style="width: 218px; height: 29px">
                    <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 100; left: 116px; position: absolute;
                        top: 43px" Width="179px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 27px">
                    市场售价:</td>
                <td style="width: 218px; height: 27px">
                    <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 100; left: 117px; position: absolute;
                        top: 78px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 29px">
                    会员价格:</td>
                <td style="width: 218px; height: 29px">
                    &nbsp;<asp:TextBox ID="TextBox4" runat="server" Style="position: relative"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 107px; height: 31px">
                    </td>
                <td style="width: 218px; height: 31px">
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 28px">
                    </td>
                <td style="width: 218px; height: 28px">
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 31px">
                    库存量:</td>
                <td style="width: 218px; height: 31px">
                    <asp:TextBox ID="TextBox7" runat="server" Style="z-index: 100; left: 114px; position: absolute;
                        top: 211px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 33px">
                    库存警戒:</td>
                <td style="width: 218px; height: 33px">
                    <asp:TextBox ID="TextBox8" runat="server" Style="z-index: 100;
                        left: 115px; position: absolute; top: 246px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 58px">
                    销售状态：</td>
                <td style="width: 218px; height: 58px">
                    <asp:RadioButton ID="RadioButton1" runat="server" Style="z-index: 100; left: 123px;
                        position: absolute; top: 283px" Text="已销售" Width="157px" />
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 93px">
        备注信息：</td>
                <td style="width: 218px; height: 93px">
                    <asp:TextBox ID="TextBox9" runat="server" Height="77px" Style="z-index: 100; left: 115px;
                        position: absolute; top: 347px" Width="206px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnInsert" runat="server" Style="z-index: 116; left: 502px; position: absolute;
            top: 930px" Text="添加" OnClick="btnInsert_Click" />
      
    </div>
    </form>
</body>
</html>
