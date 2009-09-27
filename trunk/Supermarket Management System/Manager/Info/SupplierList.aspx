<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupplierList.aspx.cs" Inherits="Manager_Info_SupplierList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>商品供应商列表<br />
            <br />
        </strong>查询条件：<br />
        供应商ID: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnSearch" runat="server" Style="z-index: 102; left: 261px; position: absolute;
            top: 63px" Text="Search"  />      
        <br />
        <asp:GridView ID="gvSupplierList" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" Style="z-index: 103; left: 13px; position: absolute; top: 446px"
            Width="796px"  Height="177px" DataKeyNames="SupplierID" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" ReadOnly="True" SortExpression="SupplierID" />
                <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" SortExpression="SupplierName" />
                <asp:BoundField DataField="SupplierAddress" HeaderText="SupplierAddress" SortExpression="SupplierAddress" />
                <asp:BoundField DataField="SupplierPhone" HeaderText="SupplierPhone" SortExpression="SupplierPhone" />
                <asp:BoundField DataField="Linkman" HeaderText="Linkman" SortExpression="Linkman" />
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Style="left: 65px; position: relative;
            top: -40px"></asp:TextBox><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SupplierID" DataSourceID="SqlDataSource2"
            ForeColor="#333333" GridLines="None" Style="left: 2px; position: relative; top: -48px"
            Width="899px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" ReadOnly="True" SortExpression="SupplierID" />
                <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" SortExpression="SupplierName" />
                <asp:BoundField DataField="SupplierAddress" HeaderText="SupplierAddress" SortExpression="SupplierAddress" />
                <asp:BoundField DataField="SupplierPhone" HeaderText="SupplierPhone" SortExpression="SupplierPhone" />
                <asp:BoundField DataField="Linkman" HeaderText="Linkman" SortExpression="Linkman" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString7 %>"
            SelectCommand="SELECT * FROM [Supplier] WHERE ([SupplierID] = @SupplierID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="SupplierID" PropertyName="Text"
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
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuppConnectionString %>"
            DeleteCommand="DELETE FROM [Supplier] WHERE [SupplierID] = @SupplierID" InsertCommand="INSERT INTO [Supplier] ([SupplierID], [SupplierName], [SupplierAddress], [SupplierPhone], [Linkman]) VALUES (@SupplierID, @SupplierName, @SupplierAddress, @SupplierPhone, @Linkman)"
            SelectCommand="SELECT * FROM [Supplier]" UpdateCommand="UPDATE [Supplier] SET [SupplierName] = @SupplierName, [SupplierAddress] = @SupplierAddress, [SupplierPhone] = @SupplierPhone, [Linkman] = @Linkman WHERE [SupplierID] = @SupplierID">
            <DeleteParameters>
                <asp:Parameter Name="SupplierID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="SupplierName" Type="String" />
                <asp:Parameter Name="SupplierAddress" Type="String" />
                <asp:Parameter Name="SupplierPhone" Type="String" />
                <asp:Parameter Name="Linkman" Type="String" />
                <asp:Parameter Name="SupplierID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="SupplierID" Type="String" />
                <asp:Parameter Name="SupplierName" Type="String" />
                <asp:Parameter Name="SupplierAddress" Type="String" />
                <asp:Parameter Name="SupplierPhone" Type="String" />
                <asp:Parameter Name="Linkman" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;<br />
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
        <br />
        </strong>
         <table width="414" height="217" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td style="width: 108px; height: 19px;">&nbsp;供应商编号：</td>
    <td style="height: 19px; width: 133px;">&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 21px;">&nbsp;供应商名称：</td>
    <td style="width: 133px; height: 21px;">&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 30px;">&nbsp;供应商地址：</td>
    <td style="height: 30px; width: 133px;">&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 39px;">&nbsp;供应商联系电话：</td>
    <td style="width: 133px; height: 39px">&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px; height: 2px;">
        联系人：</td>
    <td style="height: 2px; width: 133px;">&nbsp;<asp:TextBox ID="TextBox6" runat="server" Height="42px" TextMode="MultiLine" Width="247px"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="width: 108px;">&nbsp;</td>
    <td style="width: 133px;">&nbsp;<asp:Button ID="btnInsert" runat="server" Text="添加" OnClick="btnInsert_Click" /></td>
  </tr>
</table>
      
    </div>
    </form>
</body>
</html>
