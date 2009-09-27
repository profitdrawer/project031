<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StockList.aspx.cs" Inherits="Manager_StockMag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>仓库信息列表<br />
            <br />
        </strong>查询条件：仓库ID: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnSearch" runat="server" Style="z-index: 102; left: 290px; position: absolute;
            top: 47px" Text="Search" OnClick="btnSearch_Click" />      
        <br />
        <asp:GridView ID="gvStockList" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" Style="z-index: 103; left: 14px; position: absolute; top: 440px"
            Width="796px"  Height="177px" DataKeyNames="StockID" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="StockID" HeaderText="StockID" ReadOnly="True" SortExpression="StockID" />
                <asp:BoundField DataField="StockName" HeaderText="StockName" SortExpression="StockName" />
                <asp:BoundField DataField="StockAddress" HeaderText="StockAddress" SortExpression="StockAddress" />
                <asp:BoundField DataField="StockPhone" HeaderText="StockPhone" SortExpression="StockPhone" />
                <asp:BoundField DataField="StockMoreInfo" HeaderText="StockMoreInfo" SortExpression="StockMoreInfo" />
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:TextBox ID="TextBox1" runat="server" Style="left: 112px; position: relative;
            top: -19px"></asp:TextBox><br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="StockID" DataSourceID="SqlDataSource2"
            ForeColor="#333333" GridLines="None" Height="1px" Style="left: 4px; position: relative;
            top: -88px" Width="893px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="StockID" HeaderText="StockID" ReadOnly="True" SortExpression="StockID" />
                <asp:BoundField DataField="StockName" HeaderText="StockName" SortExpression="StockName" />
                <asp:BoundField DataField="StockAddress" HeaderText="StockAddress" SortExpression="StockAddress" />
                <asp:BoundField DataField="StockPhone" HeaderText="StockPhone" SortExpression="StockPhone" />
                <asp:BoundField DataField="StockMoreInfo" HeaderText="StockMoreInfo" SortExpression="StockMoreInfo" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString6 %>"
            SelectCommand="SELECT * FROM [Stock] WHERE ([StockID] = @StockID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="StockID" PropertyName="Text" Type="String" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>"
            DeleteCommand="DELETE FROM [Stock] WHERE [StockID] = @StockID" InsertCommand="INSERT INTO [Stock] ([StockID], [StockName], [StockAddress], [StockPhone], [StockMoreInfo]) VALUES (@StockID, @StockName, @StockAddress, @StockPhone, @StockMoreInfo)"
            SelectCommand="SELECT * FROM [Stock]" UpdateCommand="UPDATE [Stock] SET [StockName] = @StockName, [StockAddress] = @StockAddress, [StockPhone] = @StockPhone, [StockMoreInfo] = @StockMoreInfo WHERE [StockID] = @StockID">
            <DeleteParameters>
                <asp:Parameter Name="StockID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="StockName" Type="String" />
                <asp:Parameter Name="StockAddress" Type="String" />
                <asp:Parameter Name="StockPhone" Type="String" />
                <asp:Parameter Name="StockMoreInfo" Type="String" />
                <asp:Parameter Name="StockID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="StockID" Type="String" />
                <asp:Parameter Name="StockName" Type="String" />
                <asp:Parameter Name="StockAddress" Type="String" />
                <asp:Parameter Name="StockPhone" Type="String" />
                <asp:Parameter Name="StockMoreInfo" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;<br />
        <br />
        <strong>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        新增数据<br />
        </strong>
         <table width="414" height="217" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td style="width: 108px; height: 19px;">&nbsp;仓库编号：</td>
    <td style="height: 19px; width: 150px;">&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 21px;">&nbsp;仓库名称：</td>
    <td style="width: 150px; height: 21px;">&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 30px;">&nbsp;仓库地址：</td>
    <td style="height: 30px; width: 150px;">&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 21px;">&nbsp;所在电话：</td>
    <td style="width: 150px; height: 21px">&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 38px;">
        备注信息：</td>
    <td style="height: 38px; width: 150px;">&nbsp;<asp:TextBox ID="TextBox6" runat="server" Height="81px" TextMode="MultiLine" Width="295px"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 20px;">&nbsp;</td>
    <td style="height: 20px; width: 150px;">&nbsp;<asp:Button ID="btnInsert" runat="server" OnClick="Button1_Click" Text="添加" /></td>
  </tr>
</table>
      
    </div>
    </form>
</body>
</html>
