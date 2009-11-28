<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SellMag.aspx.cs" Inherits="Manager_SellMag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>销售信息列表</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>销售信息列表<br />
            <br />
        </strong>查询条件： &nbsp;显示所有： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnSearch" runat="server" Style="z-index: 102; left: 13px; position: absolute;
            top: 487px" Text="Search" OnClick="btnSearch_Click" Width="130px" />      
        <br />
        <asp:GridView ID="gvSellList" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" Style="z-index: 103; left: 14px; position: absolute; top: 79px"
            Width="844px" Height="177px" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="SellListID" HeaderText="SellListID" SortExpression="SellListID" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                <asp:BoundField DataField="SellNum" HeaderText="SellNum" SortExpression="SellNum" />
                <asp:BoundField DataField="SellDateTime" HeaderText="SellDateTime" SortExpression="SellDateTime" />
                <asp:BoundField DataField="Dealway" HeaderText="Dealway" SortExpression="Dealway" />
                <asp:BoundField DataField="DealID" HeaderText="DealID" SortExpression="DealID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        &nbsp; &nbsp;&nbsp;&nbsp;<br />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoodsSellingConnectionString %>" InsertCommand="INSERT INTO [Sale] ([SellListID], [GoodsID], [SellNum], [SellDateTime], [Dealway], [DealID], [EmployeeID]) VALUES (@SellListID, @GoodsID, @SellNum, @SellDateTime, @Dealway, @DealID, @EmployeeID)"
            SelectCommand="SELECT * FROM [Sale]">
            <InsertParameters>
                <asp:Parameter Name="SellListID" Type="String" />
                <asp:Parameter Name="GoodsID" Type="String" />
                <asp:Parameter Name="SellNum" Type="Int32" />
                <asp:Parameter Name="SellDateTime" Type="Object" />
                <asp:Parameter Name="Dealway" Type="Int32" />
                <asp:Parameter Name="DealID" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <strong>销售时间：从 &nbsp; &nbsp; &nbsp; &nbsp; </strong>
        <asp:TextBox ID="TextBox1" runat="server" Style="left: -23px; position: relative;
            top: 1px"></asp:TextBox>
        ~<asp:TextBox ID="TextBox2" runat="server" Style="left: 20px; position: relative;
            top: 2px"></asp:TextBox>
        &nbsp; &nbsp; &nbsp;<br />
        &nbsp;
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString8 %>"
            SelectCommand="SELECT * FROM [Sale] WHERE (([SellDateTime] >= @SellDateTime) AND ([SellDateTime] <= @SellDateTime2))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="2000-1-1" Name="SellDateTime"
                    PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextBox2" DefaultValue="2010-12-31" Name="SellDateTime2"
                    PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None"
            Style="left: -1px; position: relative; top: -49px" Width="890px" AutoGenerateColumns="False">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SellListID" HeaderText="SellListID" SortExpression="SellListID" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                <asp:BoundField DataField="SellNum" HeaderText="SellNum" SortExpression="SellNum" />
                <asp:BoundField DataField="SellDateTime" HeaderText="SellDateTime" SortExpression="SellDateTime" />
                <asp:BoundField DataField="Dealway" HeaderText="Dealway" SortExpression="Dealway" />
                <asp:BoundField DataField="DealID" HeaderText="DealID" SortExpression="DealID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
            </Columns>
        </asp:GridView>
        &nbsp;GoodsID: &nbsp; &nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
        <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None"
            Style="left: 6px; position: relative; top: -7px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SellListID" HeaderText="SellListID" SortExpression="SellListID" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                <asp:BoundField DataField="SellNum" HeaderText="SellNum" SortExpression="SellNum" />
                <asp:BoundField DataField="SellDateTime" HeaderText="SellDateTime" SortExpression="SellDateTime" />
                <asp:BoundField DataField="Dealway" HeaderText="Dealway" SortExpression="Dealway" />
                <asp:BoundField DataField="DealID" HeaderText="DealID" SortExpression="DealID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString10 %>"
            SelectCommand="SELECT * FROM [Sale] WHERE ([GoodsID] = @GoodsID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox4" Name="GoodsID" PropertyName="Text" Type="String" />
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
        EmployeeID:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4"
            ForeColor="#333333" GridLines="None" Style="left: 5px; position: relative; top: 13px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SellListID" HeaderText="SellListID" SortExpression="SellListID" />
                <asp:BoundField DataField="GoodsID" HeaderText="GoodsID" SortExpression="GoodsID" />
                <asp:BoundField DataField="SellNum" HeaderText="SellNum" SortExpression="SellNum" />
                <asp:BoundField DataField="SellDateTime" HeaderText="SellDateTime" SortExpression="SellDateTime" />
                <asp:BoundField DataField="Dealway" HeaderText="Dealway" SortExpression="Dealway" />
                <asp:BoundField DataField="DealID" HeaderText="DealID" SortExpression="DealID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString9 %>"
            SelectCommand="SELECT * FROM [Sale] WHERE ([EmployeeID] = @EmployeeID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox3" Name="EmployeeID" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;<br />
        <strong>&nbsp; &nbsp; &nbsp;&nbsp;<br />
        </strong>&nbsp;
        </div>
    </form>
</body>
</html>
