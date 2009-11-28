<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Refund.aspx.cs" Inherits="ReceptionDesk_Refund" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString %>"
            SelectCommand="SELECT * FROM Sale WHERE SellListID = @SellListID AND GoodsID = @GoodsID">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbxSellListID" Name="SellListID" PropertyName="Text" />
                <asp:ControlParameter ControlID="tbxGoodsID" Name="GoodsID" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="退货操作"></asp:Label>&nbsp;<br />
        &nbsp;&nbsp;<br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="请输入售货单ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbxSellListID" runat="server"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="请输入商品ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbxGoodsID" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnSearchGoods" runat="server" Text="搜索" Width="81px" />
                </td>
            </tr>
        </table>
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="SaleUniqueIdentifier" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:CommandField SelectText="退货" ShowSelectButton="True" />
                <asp:BoundField DataField="SaleUniqueIdentifier" HeaderText="SaleUniqueIdentifier"
                    InsertVisible="False" ReadOnly="True" SortExpression="SaleUniqueIdentifier" Visible="False" />
                <asp:BoundField DataField="SellListID" HeaderText="SellListID" SortExpression="SellListID" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                <asp:BoundField DataField="SellNum" HeaderText="SellNum" SortExpression="SellNum" />
                <asp:BoundField DataField="SellDateTime" HeaderText="SellDateTime" SortExpression="SellDateTime" />
                <asp:BoundField DataField="Dealway" HeaderText="Dealway" SortExpression="Dealway" />
                <asp:BoundField DataField="DealID" HeaderText="DealID" SortExpression="DealID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </form>
</body>
</html>
