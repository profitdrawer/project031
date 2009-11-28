<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeList.aspx.cs" Inherits="Manager_Info_EmployeeData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>员工信息管理</title>
    <link href="../../style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>&nbsp; &nbsp;&nbsp; 员工信息列表<br />
            <br />
        </strong>查询条件： &nbsp; &nbsp;员工编号：<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;员工姓名： &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;
        <asp:Button ID="btnSearch" runat="server" Style="z-index: 102; left: 320px; position: absolute;
            top: 48px" Text="Search"  />      
        <br />
        <asp:GridView ID="gvEmployeeList" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" Style="z-index: 103; left: 10px; position: absolute; top: 317px" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                <asp:BoundField DataField="SysLoginPwd" HeaderText="SysLoginPwd" SortExpression="SysLoginPwd" />
                <asp:BoundField DataField="Post" HeaderText="Post" SortExpression="Post" />
                <asp:BoundField DataField="EmployeeAddress" HeaderText="EmployeeAddress" SortExpression="EmployeeAddress" />
                <asp:BoundField DataField="EmployeePhone" HeaderText="EmployeePhone" SortExpression="EmployeePhone" />
                <asp:BoundField DataField="PopedomID" HeaderText="PopedomID" SortExpression="PopedomID" />
                <asp:BoundField DataField="EmployeeMoreInfo" HeaderText="EmployeeMoreInfo" SortExpression="EmployeeMoreInfo" />
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:TextBox ID="boxEmpId" runat="server" Style="left: 159px; position: absolute;
            top: 46px"></asp:TextBox><br />
        <asp:TextBox ID="boxEmpName" runat="server" Style="left: 159px; position: absolute;
            top: 73px"></asp:TextBox><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="EmployeeID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                <asp:BoundField DataField="SysLoginPwd" HeaderText="SysLoginPwd" SortExpression="SysLoginPwd" />
                <asp:BoundField DataField="Post" HeaderText="Post" SortExpression="Post" />
                <asp:BoundField DataField="EmployeeAddress" HeaderText="EmployeeAddress" SortExpression="EmployeeAddress" />
                <asp:BoundField DataField="EmployeePhone" HeaderText="EmployeePhone" SortExpression="EmployeePhone" />
                <asp:BoundField DataField="PopedomID" HeaderText="PopedomID" SortExpression="PopedomID" />
                <asp:BoundField DataField="EmployeeMoreInfo" HeaderText="EmployeeMoreInfo" SortExpression="EmployeeMoreInfo" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        &nbsp;<br />
        &nbsp;
        &nbsp;&nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;<br />
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
        <asp:SqlDataSource ID="SqlDataSource2" CancelSelectOnNullParameter="false" runat="server" ConnectionString="<%$ ConnectionStrings:MemberConnectionString %>"
            SelectCommand="SELECT EmployeeID, EmployeeName, SysLoginPwd, Post, EmployeeAddress, EmployeePhone, PopedomID, EmployeeMoreInfo FROM Employee WHERE (EmployeeID = @EMPLOYEEID) OR (EmployeeName LIKE '%' + @EMPLOYEENAME + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="boxEmpId" Name="EMPLOYEEID" PropertyName="Text" DefaultValue="" />
                <asp:ControlParameter ControlID="boxEmpName" Name="EMPLOYEENAME" PropertyName="Text" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" CancelSelectOnNullParameter="false" runat="server" ConnectionString="<%$ ConnectionStrings:EmpConnectionString %>"
            DeleteCommand="DELETE FROM [Employee] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employee] ([EmployeeID], [EmployeeName], [SysLoginPwd], [Post], [EmployeeAddress], [EmployeePhone], [PopedomID], [EmployeeMoreInfo]) VALUES (@EmployeeID, @EmployeeName, @SysLoginPwd, @Post, @EmployeeAddress, @EmployeePhone, @PopedomID, @EmployeeMoreInfo)"
            SelectCommand="SELECT * FROM [Employee]"
            UpdateCommand="UPDATE [Employee] SET [EmployeeName] = @EmployeeName, [SysLoginPwd] = @SysLoginPwd, [Post] = @Post, [EmployeeAddress] = @EmployeeAddress, [EmployeePhone] = @EmployeePhone, [PopedomID] = @PopedomID, [EmployeeMoreInfo] = @EmployeeMoreInfo WHERE [EmployeeID] = @EmployeeID">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="EmployeeName" Type="String" />
                <asp:Parameter Name="SysLoginPwd" Type="String" />
                <asp:Parameter Name="Post" Type="String" />
                <asp:Parameter Name="EmployeeAddress" Type="String" />
                <asp:Parameter Name="EmployeePhone" Type="String" />
                <asp:Parameter Name="PopedomID" Type="String" />
                <asp:Parameter Name="EmployeeMoreInfo" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="EmployeeID" Type="String" />
                <asp:Parameter Name="EmployeeName" Type="String" />
                <asp:Parameter Name="SysLoginPwd" Type="String" />
                <asp:Parameter Name="Post" Type="String" />
                <asp:Parameter Name="EmployeeAddress" Type="String" />
                <asp:Parameter Name="EmployeePhone" Type="String" />
                <asp:Parameter Name="PopedomID" Type="String" />
                <asp:Parameter Name="EmployeeMoreInfo" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
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
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <br />
        <strong>
        新增数据<br />
        </strong>
            <br />
            <table style="z-index: 115; left: 93px; width: 452px; position: absolute; top: 760px;
                height: 237px">
                <tr>
                    <td style="width: 119px; height: 13px">
                        员工编号:</td>
                    <td style="width: 100px; height: 13px">
                        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 100; left: 4px; position: relative;
                            top: 0px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 119px; height: 40px">
                        员工姓名:</td>
                    <td style="width: 100px; height: 40px">
                        <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 100; left: 131px; position: absolute;
                            top: 41px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 119px; height: 35px">
                        登录密码：</td>
                    <td style="width: 100px; height: 35px">
                        <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 100; left: 138px; position: absolute;
                            top: 82px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 119px; height: 34px">
                        职位：</td>
                    <td style="width: 100px; height: 34px">
                        <asp:TextBox ID="TextBox4" runat="server" Style="z-index: 100; left: 139px; position: absolute;
                            top: 116px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 119px; height: 32px">
                        员工所住地址：</td>
                    <td style="width: 100px; height: 32px">
                        <asp:TextBox ID="TextBox5" runat="server" Style="z-index: 100; left: 140px; position: absolute;
                            top: 156px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 119px; height: 6px">
                        员工联系电话：</td>
                    <td style="width: 100px; height: 6px">
                        <asp:TextBox ID="TextBox6" runat="server" Style="z-index: 100; left: 142px; position: absolute;
                            top: 186px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 119px; height: 39px">
                        访问系统权限编号：</td>
                    <td style="width: 100px; height: 39px">
                        <asp:TextBox ID="TextBox7" runat="server" Style="z-index: 100; left: 141px; position: absolute;
                            top: 219px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 119px; height: 79px">
        备注信息：</td>
                    <td style="width: 100px; height: 79px">
                        <asp:TextBox ID="TextBox8" runat="server" Height="66px" Style="z-index: 100; left: 177px;
                            position: relative; top: 280px" Width="294px"></asp:TextBox>
                        <asp:TextBox ID="TextBox9" runat="server" Height="86px" Style="position: relative;
                            top: -65px" Width="307px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 119px; height: 20px">
                    </td>
                    <td style="width: 100px; height: 20px">
                    </td>
                </tr>
            </table>
            <br />
        <br />
        &nbsp;
        <asp:Button ID="btnInsert" runat="server" Style="z-index: 114; left: 662px; position: absolute;
            top: 1118px" Text="添加" OnClick="btnInsert_Click" />
      
    </div>
    </form>
</body>
</html>
