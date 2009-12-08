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
    private static DataTable priceList;
    private static decimal totalPrice;
    private static int reviewPriceBtnState = 0;
    private static decimal remainAmount;

    /// <summary>
    /// 初始化页面
    /// </summary>
    private void InitPage()
    {
        InitDealWay();
        InitSellDate();

        // 设置会员卡输入隐藏
        lblMemberID.Visible = false;
        tbxMemberID.Visible = false;
        lblCardPwd.Visible = false;
        tbxCardPwd.Visible = false;

        // 设置查看总价按钮及其附属label
        lblViewPrice.Visible = false;
        lblTotalPrice.Visible = false;
        lblCardRemainAmount.Visible = false;
        lblRemain.Visible = false;
        btnReviewPrice.Text = "查看总价";
        reviewPriceBtnState = 0;

        // 设置结账按钮及其附属label

        // 设置收银员ID
        tbxCashierID.Text = (string) Session["EmployeeID"];
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitGoodsListTableSchema();
            InitPriceListTableSchema();
            InitPage();
        }

        SetDealwayDrDp();

        lblOrderStatus.Text = "";

        gvBuyGoods.DataSource = goodsList;
        gvBuyGoods.DataBind();
        gvGoodsPrice.DataSource = priceList;
        gvGoodsPrice.DataBind();
    }

    /// <summary>
    /// 初始化价格单表的Schema
    /// </summary>
    private void InitPriceListTableSchema()
    {
        // 初始化priceListColumns的schema
        priceList = new DataTable();
        DataColumnCollection priceListColumns = priceList.Columns;
        priceListColumns.Clear();
        priceListColumns.Add(new DataColumn("GoodsID", typeof(string)));
        priceListColumns.Add(new DataColumn("GoodsName", typeof(string)));
        priceListColumns.Add(new DataColumn("SellNum", typeof(int)));
        priceListColumns.Add(new DataColumn("PerPrice", typeof(decimal)));
        priceListColumns.Add(new DataColumn("TotalPrice", typeof(decimal)));
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

    protected void btnAddToList_Click(object sender, EventArgs e)
    {
        // 搜索符合条件的商品
        SqlConnection objConnection = new SqlConnection(strConnect);
        SqlCommand objCommand = new SqlCommand("", objConnection);

        objCommand.CommandText = 
            "SELECT GoodsID, GoodsName, SellingPrice AS CashPrice FROM Commodity WHERE GoodsID = @GOODSID ";
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

    protected void btnBuy_Click(object sender, EventArgs e)
    {
        // 如果尚未查看价格则不进行任何操作
        if (reviewPriceBtnState == 0) return;

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

        int dealWay = DrDpDealway.SelectedIndex;
        try
        {
            if (objConnection.State == ConnectionState.Closed)
                objConnection.Open();

            // 会员卡付账
            if (dealWay == 1)
            {
                if (remainAmount < totalPrice)
                {
                    lblOrderStatus.Text = "会员卡余额不足！";
                    objConnection.Close();
                    return;
                }
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

            if (dealWay == 1)
            {
                // 写回余额，并增加累计消费值
                SqlCommand updateMemberInfoCommand = new SqlCommand(
                    "UPDATE Member SET AdvancePayment = @RemainAmount, TotalCost = TotalCost + @Payment " +
                    "WHERE MemberID = @MemberID", objConnection);
                updateMemberInfoCommand.Transaction = transaction;
                updateMemberInfoCommand.Parameters.Add("RemainAmount", SqlDbType.Decimal);
                updateMemberInfoCommand.Parameters.Add("MemberID", SqlDbType.VarChar);
                updateMemberInfoCommand.Parameters.Add("Payment", SqlDbType.Decimal);
                updateMemberInfoCommand.Parameters["RemainAmount"].Value = remainAmount - totalPrice;
                updateMemberInfoCommand.Parameters["MemberID"].Value = tbxMemberID.Text;
                updateMemberInfoCommand.Parameters["Payment"].Value = totalPrice;
                updateMemberInfoCommand.ExecuteNonQuery();
            }

            transaction.Commit();

            // (TODO: mincomp)添加购买信息到Dealing表

            // 清空购买数据
            ClearAllTextBox();

            // 初始化页面
            InitPage();

            // 修改购买情况
            if (dealWay != 2)
            {
                lblOrderStatus.Text = "成功购买！";
                if (dealWay == 1)
                {
                    lblOrderStatus.Text += "会员卡余额：" + Convert.ToString(remainAmount - totalPrice);
                }
            }
            else lblOrderStatus.Text = "成功压单！";

            // 修改页面控件
            SetModifiableControlEnable(true);
            priceList.Clear();
            gvGoodsPrice.DataBind();
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

    private void SetModifiableControlEnable(bool state)
    {
        DrDpDealway.Enabled = state;
        tbxSellNum.Enabled = state;
        tbxCardPwd.Enabled = state;
        tbxMemberID.Enabled = state;
        tbxBuyGoodsID.Enabled = state;
        tbxSellListId.Enabled = state;
        btnAddToList.Enabled = state;
        gvBuyGoods.Enabled = state;
    }

    protected void btnReviewPrice_Click(object sender, EventArgs e)
    {
        lblReviewPriceStatus.Text = "";

        // 如果购物单中没有东西则不进行任何操作
        if (goodsList.Rows.Count == 0) return;

        if (reviewPriceBtnState == 0)
        {
            SqlConnection conn = new SqlConnection(strConnect);
            conn.Open();

            int discountPercent = 0;
            if (DrDpDealway.SelectedIndex == 1)
            {
                // 确认身份信息
                SqlCommand getMemberInfoCommand =
                    new SqlCommand("SELECT * FROM Member WHERE MemberID = @MemberID", conn);
                getMemberInfoCommand.Parameters.Add("MemberID", SqlDbType.VarChar);
                getMemberInfoCommand.Parameters["MemberID"].Value = tbxMemberID.Text;
                SqlDataReader reader = getMemberInfoCommand.ExecuteReader();
                if (reader.Read() == false || (string)reader["CardPwd"] != tbxCardPwd.Text)
                {
                    lblReviewPriceStatus.Text = "会员ID或密码错误！";
                    conn.Close();
                    return;
                }
                remainAmount = (decimal)reader["AdvancePayment"];
                reader.Close();

                // 计算折扣率
                SqlCommand cmd = new SqlCommand(
                    "SELECT DiscountByPercent FROM Member, MemberLevel " +
                    "WHERE Member.TotalCost >= MemberLevel.PaymentRequirement " +
                      "AND Member.MemberID = @MemberId " +
                    "ORDER BY MemberLevel DESC", conn);
                cmd.Parameters.Add("MemberId", SqlDbType.VarChar);
                cmd.Parameters["MemberId"].Value = tbxMemberID.Text.Trim();
                Object result = cmd.ExecuteScalar();
                if (result == null) discountPercent = 0;
                else discountPercent = (int)result;
                conn.Close();

                lblCardRemainAmount.Text = Convert.ToString(remainAmount);
                lblCardRemainAmount.Visible = true;
                lblRemain.Visible = true;
            }

            // 填充priceList表内容，并计算总价
            totalPrice = 0;
            priceList.Clear();
            foreach (DataRow row in goodsList.Rows)
            {
                DataRow newRow = priceList.NewRow();
                newRow["GoodsID"] = row["GoodsID"];
                newRow["GoodsName"] = row["GoodsName"];
                newRow["SellNum"] = row["SellNum"];
                decimal price = ((decimal)row["CashPrice"]) / 100 * (100 - discountPercent);
                decimal grossPrice = price * (int)row["SellNum"];
                totalPrice += grossPrice;
                newRow["PerPrice"] = price;
                newRow["TotalPrice"] = grossPrice;
                priceList.Rows.Add(newRow);
                gvGoodsPrice.DataBind();
            }

            lblTotalPrice.Text = Convert.ToString(totalPrice);

            SetModifiableControlEnable(false);
            reviewPriceBtnState = 1;
            btnReviewPrice.Text = "取消";

            lblViewPrice.Visible = true;
            lblTotalPrice.Visible = true;
        }
        else
        {
            SetModifiableControlEnable(true);
            priceList.Clear();
            gvGoodsPrice.DataBind();
            reviewPriceBtnState = 0;
            btnReviewPrice.Text = "查看总价";
            lblTotalPrice.Text = "";
            lblReviewPriceStatus.Text = "";

            lblCardRemainAmount.Visible = false;
            lblRemain.Visible = false;
            lblViewPrice.Visible = false;
            lblTotalPrice.Visible = false;
        }
    }
}
