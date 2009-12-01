<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAdvancePay.aspx.cs" Inherits="ReceptionDesk_ReceptionDesk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>会员充值</title>
    <link href="../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="linkLogout" runat="server" Font-Bold="True" OnClick="linkLogout_Click">注销登录</asp:LinkButton>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString %>" SelectCommand="SELECT * FROM Member WHERE MemberID = @MemberID OR MemberName LIKE '%' + @MemberName + '%'" CancelSelectOnNullParameter="False">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbxMemberID" Name="MemberID" PropertyName="Text" />
                <asp:ControlParameter ControlID="tbxMemberName" Name="MemberName" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    <div
            style="width: 540px; height: 274px">
            <br />
            <asp:Label ID="Label1" runat="server" Text="查找用户："></asp:Label>&nbsp;<br />
            <br />
            <table style="width: 245px; height: 83px">
                <tr>
                    <td style="width: 95px">
                        <asp:Label ID="Label2" runat="server" Text="用户ID："></asp:Label></td>
                    <td style="width: 167px">
                        <asp:TextBox ID="tbxMemberID" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 95px">
                        <asp:Label ID="Label3" runat="server" Text="用户名："></asp:Label></td>
                    <td style="width: 167px">
                        <asp:TextBox ID="tbxMemberName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 95px">
                        <asp:Button ID="btnSearchMember" runat="server" Text="搜索" Width="81px" /></td>
                    <td style="width: 167px">
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gridViewMember" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="MemberID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gridViewMember_SelectedIndexChanged">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="MemberID" HeaderText="MemberID" ReadOnly="True" SortExpression="MemberID" />
                    <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" />
                    <asp:CheckBoxField DataField="Cardstate" HeaderText="Cardstate" SortExpression="Cardstate" />
                    <asp:BoundField DataField="CardPwd" HeaderText="CardPwd" SortExpression="CardPwd" />
                    <asp:BoundField DataField="MemberAddress" HeaderText="MemberAddress" SortExpression="MemberAddress" />
                    <asp:BoundField DataField="MemberPhone" HeaderText="MemberPhone" SortExpression="MemberPhone" />
                    <asp:BoundField DataField="EnrollDate" HeaderText="EnrollDate" SortExpression="EnrollDate" />
                    <asp:BoundField DataField="AdvancePayment" HeaderText="AdvancePayment" SortExpression="AdvancePayment" />
                    <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
                    <asp:BoundField DataField="ConsumerPoints" HeaderText="ConsumerPoints" SortExpression="ConsumerPoints" />
                    <asp:BoundField DataField="MemberMoreInfo" HeaderText="MemberMoreInfo" SortExpression="MemberMoreInfo" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        <br />
        <asp:Label ID="Label4" runat="server" Text="充值数量："></asp:Label>
        <asp:TextBox ID="tbxPaymentAmount" runat="server"></asp:TextBox>
        <asp:Button ID="btnSupplement" runat="server" OnClick="btnSupplement_Click" Text="充值"
            Width="90px" /></div>
    </div>
    </form>
</body>
</html>
