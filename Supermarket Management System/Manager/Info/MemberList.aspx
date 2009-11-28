<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberList.aspx.cs" Inherits="Manager_Info_MemData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>会员信息管理</title>
    <link href="../../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>会员信息列表<br />
            <br />
        </strong>查询条件： 会员编号:<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 会员姓名: &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" Style="z-index: 102; left: 324px; position: absolute;
            top: 51px" Text="Search" Width="100px"  />      
        <br />
        <asp:GridView ID="gvMemberList" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" Style="z-index: 103; left: 8px; position: absolute; top: 426px"
            Width="844px"  Height="1px" DataKeyNames="MemberID" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Style="left: 130px; position: relative;
            top: -62px"></asp:TextBox><br />
        &nbsp;<asp:TextBox ID="TextBox8" runat="server" Style="left: 126px; position: relative;
            top: -55px"></asp:TextBox>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="MemberID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
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
        <br />
        &nbsp;
        &nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MembConnectionString %>"
            DeleteCommand="DELETE FROM [Member] WHERE [MemberID] = @MemberID" InsertCommand="INSERT INTO [Member] ([MemberID], [MemberName], [Cardstate], [CardPwd], [MemberAddress], [MemberPhone], [EnrollDate], [AdvancePayment], [TotalCost], [ConsumerPoints], [MemberMoreInfo]) VALUES (@MemberID, @MemberName, @Cardstate, @CardPwd, @MemberAddress, @MemberPhone, @EnrollDate, @AdvancePayment, @TotalCost, @ConsumerPoints, @MemberMoreInfo)"
            SelectCommand="SELECT * FROM [Member]" UpdateCommand="UPDATE [Member] SET [MemberName] = @MemberName, [Cardstate] = @Cardstate, [CardPwd] = @CardPwd, [MemberAddress] = @MemberAddress, [MemberPhone] = @MemberPhone, [EnrollDate] = @EnrollDate, [AdvancePayment] = @AdvancePayment, [TotalCost] = @TotalCost, [ConsumerPoints] = @ConsumerPoints, [MemberMoreInfo] = @MemberMoreInfo WHERE [MemberID] = @MemberID">
            <DeleteParameters>
                <asp:Parameter Name="MemberID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="MemberName" Type="String" />
                <asp:Parameter Name="Cardstate" Type="Boolean" />
                <asp:Parameter Name="CardPwd" Type="String" />
                <asp:Parameter Name="MemberAddress" Type="String" />
                <asp:Parameter Name="MemberPhone" Type="String" />
                <asp:Parameter Name="EnrollDate" Type="DateTime" />
                <asp:Parameter Name="AdvancePayment" Type="Decimal" />
                <asp:Parameter Name="TotalCost" Type="Decimal" />
                <asp:Parameter Name="ConsumerPoints" Type="Int32" />
                <asp:Parameter Name="MemberMoreInfo" Type="String" />
                <asp:Parameter Name="MemberID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="MemberID" Type="String" />
                <asp:Parameter Name="MemberName" Type="String" />
                <asp:Parameter Name="Cardstate" Type="Boolean" />
                <asp:Parameter Name="CardPwd" Type="String" />
                <asp:Parameter Name="MemberAddress" Type="String" />
                <asp:Parameter Name="MemberPhone" Type="String" />
                <asp:Parameter Name="EnrollDate" Type="DateTime" />
                <asp:Parameter Name="AdvancePayment" Type="Decimal" />
                <asp:Parameter Name="TotalCost" Type="Decimal" />
                <asp:Parameter Name="ConsumerPoints" Type="Int32" />
                <asp:Parameter Name="MemberMoreInfo" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:Supermarket Management SystemConnectionString5 %>"
            DeleteCommand="DELETE FROM [Member] WHERE [MemberID] = @MemberID" InsertCommand="INSERT INTO [Member] ([MemberID], [MemberName], [Cardstate], [CardPwd], [MemberAddress], [MemberPhone], [EnrollDate], [AdvancePayment], [TotalCost], [ConsumerPoints], [MemberMoreInfo]) VALUES (@MemberID, @MemberName, @Cardstate, @CardPwd, @MemberAddress, @MemberPhone, @EnrollDate, @AdvancePayment, @TotalCost, @ConsumerPoints, @MemberMoreInfo)"
            SelectCommand="SELECT * FROM [Member] WHERE (([MemberID] = @MemberID) OR ([MemberName] LIKE '%' + @MemberName + '%'))"
            UpdateCommand="UPDATE [Member] SET [MemberName] = @MemberName, [Cardstate] = @Cardstate, [CardPwd] = @CardPwd, [MemberAddress] = @MemberAddress, [MemberPhone] = @MemberPhone, [EnrollDate] = @EnrollDate, [AdvancePayment] = @AdvancePayment, [TotalCost] = @TotalCost, [ConsumerPoints] = @ConsumerPoints, [MemberMoreInfo] = @MemberMoreInfo WHERE [MemberID] = @MemberID">
            <DeleteParameters>
                <asp:Parameter Name="MemberID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="MemberName" Type="String" />
                <asp:Parameter Name="Cardstate" Type="Boolean" />
                <asp:Parameter Name="CardPwd" Type="String" />
                <asp:Parameter Name="MemberAddress" Type="String" />
                <asp:Parameter Name="MemberPhone" Type="String" />
                <asp:Parameter Name="EnrollDate" Type="DateTime" />
                <asp:Parameter Name="AdvancePayment" Type="Decimal" />
                <asp:Parameter Name="TotalCost" Type="Decimal" />
                <asp:Parameter Name="ConsumerPoints" Type="Int32" />
                <asp:Parameter Name="MemberMoreInfo" Type="String" />
                <asp:Parameter Name="MemberID" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox3" Name="MemberID" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox8" Name="MemberName" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="MemberID" Type="String" />
                <asp:Parameter Name="MemberName" Type="String" />
                <asp:Parameter Name="Cardstate" Type="Boolean" />
                <asp:Parameter Name="CardPwd" Type="String" />
                <asp:Parameter Name="MemberAddress" Type="String" />
                <asp:Parameter Name="MemberPhone" Type="String" />
                <asp:Parameter Name="EnrollDate" Type="DateTime" />
                <asp:Parameter Name="AdvancePayment" Type="Decimal" />
                <asp:Parameter Name="TotalCost" Type="Decimal" />
                <asp:Parameter Name="ConsumerPoints" Type="Int32" />
                <asp:Parameter Name="MemberMoreInfo" Type="String" />
            </InsertParameters>
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
        &nbsp;&nbsp;<br />
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
        <strong>
        新增数据<br />
            <br />
            <table style="width: 458px; border-right: #000000 thin solid; border-top: #000000 thin solid; border-left: #000000 thin solid; border-bottom: #000000 thin solid;">
                <tr>
                    <td style="width: 101px; height: 35px">
                        会员编号:</td>
                    <td style="width: 3px; height: 35px">
                        <asp:TextBox ID="tbxMemberID" runat="server" Style="z-index: 100; left: 0px; position: relative;
                            top: 0px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 30px">
                        会员姓名:</td>
                    <td style="width: 3px; height: 30px">
                        <asp:TextBox ID="tbxMemberName" runat="server" Style="z-index: 100; left: 0px; position: relative;
                            top: 0px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 25px">
                        会员卡状态:</td>
                    <td style="width: 3px; height: 25px">
                        <asp:RadioButton ID="radCardStatus" runat="server" Style="position: relative" Text="使用中"
                            Width="160px" /></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 25px">
                        会员卡密码:</td>
                    <td style="width: 3px; height: 25px">
                        <asp:TextBox ID="tbxCardPwd" runat="server" Style="z-index: 100; left: 0px; position: relative;
                            top: 0px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 24px">
                        会员联系地址:</td>
                    <td style="width: 3px; height: 24px">
                        <asp:TextBox ID="tbxMemberAddress" runat="server" Style="z-index: 100; left: 0px; position: relative;
                            top: 0px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 24px">
                        会员联系电话:</td>
                    <td style="width: 3px; height: 24px">
                        <asp:TextBox ID="tbxMemberPhone" runat="server" Style="z-index: 100; left: 0px; position: relative;
                            top: 3px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 25px">
                        注册日期:</td>
                    <td style="width: 3px; height: 25px">
                        <asp:TextBox ID="tbxEnrollDate" runat="server" Style="z-index: 100; left: 0px; position: relative;
                            top: 0px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 25px">
                        充值金额:</td>
                    <td style="width: 3px; height: 25px">
                        &nbsp;<asp:TextBox ID="tbxAdvancePayment" runat="server" Style="z-index: 102; left: 0px; position: relative;
                            top: -7px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 25px">
                        消费累计:</td>
                    <td style="width: 3px; height: 25px">
                        <asp:TextBox ID="tbxTotalCost" runat="server" Style="z-index: 100; left: 0px; position: relative;
                            top: 0px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 25px">
                        消费积分:</td>
                    <td style="width: 3px; height: 25px">
                        <asp:TextBox ID="tbxConsumerPoints" runat="server" Style="z-index: 100; left: 0px; position: relative;
                            top: 0px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 101px; height: 92px">
                        备注信息:</td>
                    <td style="width: 3px; height: 92px">
                        <asp:TextBox ID="tbxMemberMoreInfo" runat="server" Height="86px" Style="position: static"
                            Width="149px"></asp:TextBox></td>
                </tr>
            </table>
            <br />
        <br />
        </strong>&nbsp;
        <asp:Button ID="btnInsert" runat="server" Style="z-index: 114; left: 478px; position: absolute;
            top: 1245px" Text="添加" OnClick="btnInsert_Click" Width="130px" />
      
    </div>
    </form>
</body>
</html>
