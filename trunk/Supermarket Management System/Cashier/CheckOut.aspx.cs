using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Cashier_cashier : System.Web.UI.Page
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];

    private static DataTable goodsList;

    /// <summary>
    /// 初始化页面
    /// </summary>
    private void InitPage()
    {
        InitDealWay();
        InitSellDate();
        lblOrderStatus.Text = "";
        Session["EmployeeID"] = "630072001";
        tbxCashierID.Text = (string) Session["EmployeeID"];
        lblMemberID.Visible = false;
        tbxMemberID.Visible = false;
        lblCardPwd.Visible = false;
        tbxCardPwd.Visible = false;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitGoodsListTableSchema();
            InitPage();
        }

        SetDealwayDrDp();

        gvBuyGoods.DataSource = goodsList;
        gvBuyGoods.DataBind();
    }

    private void SetDealwayDrDp()
    {
        if (DrDpDealway.SelectedIndex == 1)
        {
            lblMemberID.Visible = true;
            tbxMemberID.Visible = true;
            lblCardPwd.Visible = true;
            tbxCardPwd.Visible = true;
        }
        else
        {
            lblMemberID.Visible = false;
            tbxMemberID.Visible = false;
            lblCardPwd.Visible = false;
            tbxCardPwd.Visible = false;
        }
    }

    /// <summary>
    /// 初始化购物单表的Schema
    /// </summary>
    private void InitGoodsListTableSchema()
    {
        // 初始化goodsListColumns的schema
        goodsList = new DataTable();
        DataColumnCollection goodsListColumns = goodsList.Columns;
        goodsListColumns.Clear();
        goodsListColumns.Add(new DataColumn("GoodsID", typeof(string)));
        goodsListColumns.Add(new DataColumn("GoodsName", typeof(string)));
        goodsListColumns.Add(new DataColumn("CashPrice", typeof(decimal)));
        goodsListColumns.Add(new DataColumn("MemberPrice", typeof(decimal)));
        goodsListColumns.Add(new DataColumn("SellNum", typeof(int)));
    }

    /// <summary>
    /// 初始化当前时间
    /// </summary>
    private void InitSellDate()
    {
        tbxSellDate.Text = DateTime.Now.ToString();
    }

    /// <summary>
    /// 初始化付款方式
    /// </summary>
    private void InitDealWay()
    {
        DrDpDealway.Items.Clear();
        DrDpDealway.Enabled = true;
        DrDpDealway.Items.Add("Cash");
        DrDpDealway.Items.Add("MemberCard");
        DrDpDealway.Items.Add("PendingOrder");
    }

    protected void btnBuy_Click(object sender, EventArgs e)
    {
        // 搜索符合条件的商品
        SqlConnection objConnection = new SqlConnection(strConnect);
        SqlCommand objCommand = new SqlCommand("", objConnection);

        objCommand.CommandText = 
            "SELECT GoodsID, GoodsName, SellingPrice AS CashPrice, MemberPrice FROM Commodity WHERE GoodsID = @GOODSID ";
        objCommand.Parameters.Add("GOODSID", SqlDbType.VarChar);
        objCommand.Parameters["GOODSID"].Value = tbxBuyGoodsID.Text.Trim();

        try
        {
            if (objConnection.State == ConnectionState.Closed)
                objConnection.Open();

            // 将搜索到的商品添加到购物单列表中
            SqlDataReader reader = objCommand.ExecuteReader();
            if (reader.Read())
            {
                DataRow newRow = goodsList.NewRow();
                newRow["GoodsID"] = reader["GoodsID"];
                newRow["GoodsName"] = reader["GoodsName"];
                newRow["CashPrice"] = reader["CashPrice"];
                newRow["MemberPrice"] = reader["MemberPrice"];
                newRow["SellNum"] = int.Parse(tbxSellNum.Text.Trim());
                goodsList.Rows.Add(newRow);
                gvBuyGoods.DataBind();
            }
        }
        catch (SqlException exp)
        {
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");
        }
        finally
        {
            //关闭数据库连接
            if (objConnection.State == ConnectionState.Open)
                objConnection.Close();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("GoodsSearch.aspx");
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        // 如果购物单中没有东西则不进行任何操作
        if (goodsList.Rows.Count == 0) return;

        SqlConnection objConnection = new SqlConnection(strConnect);
        SqlCommand objCommand = new SqlCommand("", objConnection);

        objCommand.CommandText = "INSERT INTO Sale (SellListID, GoodsID, SellNum, Dealway, EmployeeID)" +
            " VALUES (@SELLLISTID, @GOODSID, @SELLNUM, @DEALWAY, @EMPLOYEEID)";

        objCommand.Parameters.Add("SELLLISTID", SqlDbType.VarChar);
        objCommand.Parameters.Add("GOODSID", SqlDbType.VarChar);
        objCommand.Parameters.Add("SELLNUM", SqlDbType.Int);
        objCommand.Parameters.Add("DEALWAY", SqlDbType.Int);
        objCommand.Parameters.Add("EMPLOYEEID", SqlDbType.VarChar);

        objCommand.Parameters["SELLLISTID"].Value = tbxSellListId.Text.Trim();
        objCommand.Parameters["DEALWAY"].Value = DrDpDealway.SelectedIndex;
        objCommand.Parameters["EMPLOYEEID"].Value = tbxCashierID.Text.Trim();

        try
        {
            if (objConnection.State == ConnectionState.Closed)
                objConnection.Open();

            // 计算总金额
            decimal totalCost = GetTotalCost();
            decimal remainAmount = 0;

            // 会员卡付账
            if (DrDpDealway.SelectedIndex == 1)
            {
                // 确认身份信息
                SqlCommand getMemberInfoCommand =
                    new SqlCommand("SELECT * FROM Member WHERE MemberID = @MemberID", objConnection);
                getMemberInfoCommand.Parameters.Add("MemberID", SqlDbType.VarChar);
                getMemberInfoCommand.Parameters["MemberID"].Value = tbxMemberID.Text;
                SqlDataReader reader = getMemberInfoCommand.ExecuteReader();
                if (reader.Read() == false || (string)reader["CardPwd"] != tbxCardPwd.Text)
                {
                    lblOrderStatus.Text = "会员ID或密码错误！";
                    objConnection.Close();
                    return;
                }

                // 确认余额
                remainAmount = (decimal)reader["AdvancePayment"];
                if (remainAmount < totalCost)
                {
                    lblOrderStatus.Text = "会员卡余额不足！";
                    objConnection.Close();
                    return;
                }
                reader.Close();
            }

            // 用事务进行操作
            SqlTransaction transaction = objConnection.BeginTransaction();
            objCommand.Transaction = transaction;

            // 对购物单中的每个商品进行处理
            foreach (DataRow row in goodsList.Rows)
            {
                objCommand.Parameters["GOODSID"].Value = row["GoodsID"];
                objCommand.Parameters["SELLNUM"].Value = row["SellNum"];
                objCommand.ExecuteNonQuery();
            }

            // 写回余额，并增加累计消费值
            SqlCommand updateMemberInfoCommand = new SqlCommand(
                "UPDATE Member SET AdvancePayment = @RemainAmount, TotalCost = TotalCost + @Payment " +
                "WHERE MemberID = @MemberID", objConnection);
            updateMemberInfoCommand.Transaction = transaction;
            updateMemberInfoCommand.Parameters.Add("RemainAmount", SqlDbType.Decimal);
            updateMemberInfoCommand.Parameters.Add("MemberID", SqlDbType.VarChar);
            updateMemberInfoCommand.Parameters.Add("Payment", SqlDbType.Decimal);
            updateMemberInfoCommand.Parameters["RemainAmount"].Value = remainAmount - totalCost;
            updateMemberInfoCommand.Parameters["MemberID"].Value = tbxMemberID.Text;
            updateMemberInfoCommand.Parameters["Payment"].Value = totalCost;
            updateMemberInfoCommand.ExecuteNonQuery();

            transaction.Commit();

            // (TODO: mincomp)添加购买信息到Dealing表

            // 清空购买数据
            ClearAllTextBox();

            // 初始化页面
            InitPage();

            // 修改购买情况
            if (DrDpDealway.SelectedIndex != 2) lblOrderStatus.Text = "成功购买！";
            else lblOrderStatus.Text = "成功压单！";
        }
        catch (SqlException exp)
        {
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");
        }
        finally
        {
            //关闭数据库连接
            if (objConnection.State == ConnectionState.Open)
                objConnection.Close();
        }
    }

    /// <summary>
    /// 得到gvGoodsList中所有商品的总价格
    /// </summary>
    /// <returns></returns>
    private decimal GetTotalCost()
    {
        int dealway = DrDpDealway.SelectedIndex;
        decimal totalCost = 0;

        if (dealway == 1)   // 会员卡支付
        {
            foreach (DataRow row in goodsList.Rows)
            {
                totalCost += (decimal)row["MemberPrice"] * (int)row["SellNum"];
            }
        }
        else
        {
            foreach (DataRow row in goodsList.Rows)
            {
                totalCost += (decimal)row["CashPrice"] * (int)row["SellNum"];
            }
        }
        return totalCost;
    }

    /// <summary>
    /// 清空购买数据
    /// </summary>
    private void ClearAllTextBox()
    {
        tbxBuyGoodsID.Text = "";
        tbxCashierID.Text = "";
        tbxSellDate.Text = "";
        tbxSellListId.Text = "";
        tbxSellNum.Text = "";
        goodsList.Rows.Clear();
        gvBuyGoods.DataBind();
    }

    protected void linkLogout_Click(object sender, EventArgs e)
    {
        Session.Remove("EmployeeID");
        Session.Remove("SysLoginPwd");
        Session.Remove("RoleName");
        Response.Redirect("../Login.aspx");
    }

    protected void gvBuyGoods_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        goodsList.Rows.RemoveAt(e.RowIndex);
        gvBuyGoods.DataBind();
    }
}
