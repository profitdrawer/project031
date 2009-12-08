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
    /// ��ʼ��ҳ��
    /// </summary>
    private void InitPage()
    {
        InitDealWay();
        InitSellDate();

        // ���û�Ա����������
        lblMemberID.Visible = false;
        tbxMemberID.Visible = false;
        lblCardPwd.Visible = false;
        tbxCardPwd.Visible = false;

        // ���ò鿴�ܼ۰�ť���丽��label
        lblViewPrice.Visible = false;
        lblTotalPrice.Visible = false;
        lblCardRemainAmount.Visible = false;
        lblRemain.Visible = false;
        btnReviewPrice.Text = "�鿴�ܼ�";
        reviewPriceBtnState = 0;

        // ���ý��˰�ť���丽��label

        // ��������ԱID
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
    /// ��ʼ���۸񵥱��Schema
    /// </summary>
    private void InitPriceListTableSchema()
    {
        // ��ʼ��priceListColumns��schema
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
    /// ��ʼ�����ﵥ���Schema
    /// </summary>
    private void InitGoodsListTableSchema()
    {
        // ��ʼ��goodsListColumns��schema
        goodsList = new DataTable();
        DataColumnCollection goodsListColumns = goodsList.Columns;
        goodsListColumns.Clear();
        goodsListColumns.Add(new DataColumn("GoodsID", typeof(string)));
        goodsListColumns.Add(new DataColumn("GoodsName", typeof(string)));
        goodsListColumns.Add(new DataColumn("CashPrice", typeof(decimal)));
        goodsListColumns.Add(new DataColumn("SellNum", typeof(int)));
    }

    /// <summary>
    /// ��ʼ����ǰʱ��
    /// </summary>
    private void InitSellDate()
    {
        tbxSellDate.Text = DateTime.Now.ToString();
    }

    /// <summary>
    /// ��ʼ�����ʽ
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
        // ����������������Ʒ
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

            // ������������Ʒ��ӵ����ﵥ�б���
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
            //�ر����ݿ�����
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
        // �����δ�鿴�۸��򲻽����κβ���
        if (reviewPriceBtnState == 0) return;

        // ������ﵥ��û�ж����򲻽����κβ���
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

            // ��Ա������
            if (dealWay == 1)
            {
                if (remainAmount < totalPrice)
                {
                    lblOrderStatus.Text = "��Ա�����㣡";
                    objConnection.Close();
                    return;
                }
            }

            // ��������в���
            SqlTransaction transaction = objConnection.BeginTransaction();
            objCommand.Transaction = transaction;

            // �Թ��ﵥ�е�ÿ����Ʒ���д���
            foreach (DataRow row in goodsList.Rows)
            {
                objCommand.Parameters["GOODSID"].Value = row["GoodsID"];
                objCommand.Parameters["SELLNUM"].Value = row["SellNum"];
                objCommand.ExecuteNonQuery();
            }

            if (dealWay == 1)
            {
                // д�����������ۼ�����ֵ
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

            // (TODO: mincomp)��ӹ�����Ϣ��Dealing��

            // ��չ�������
            ClearAllTextBox();

            // ��ʼ��ҳ��
            InitPage();

            // �޸Ĺ������
            if (dealWay != 2)
            {
                lblOrderStatus.Text = "�ɹ�����";
                if (dealWay == 1)
                {
                    lblOrderStatus.Text += "��Ա����" + Convert.ToString(remainAmount - totalPrice);
                }
            }
            else lblOrderStatus.Text = "�ɹ�ѹ����";

            // �޸�ҳ��ؼ�
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
            //�ر����ݿ�����
            if (objConnection.State == ConnectionState.Open)
                objConnection.Close();
        }
    }

    /// <summary>
    /// ��չ�������
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

        // ������ﵥ��û�ж����򲻽����κβ���
        if (goodsList.Rows.Count == 0) return;

        if (reviewPriceBtnState == 0)
        {
            SqlConnection conn = new SqlConnection(strConnect);
            conn.Open();

            int discountPercent = 0;
            if (DrDpDealway.SelectedIndex == 1)
            {
                // ȷ�������Ϣ
                SqlCommand getMemberInfoCommand =
                    new SqlCommand("SELECT * FROM Member WHERE MemberID = @MemberID", conn);
                getMemberInfoCommand.Parameters.Add("MemberID", SqlDbType.VarChar);
                getMemberInfoCommand.Parameters["MemberID"].Value = tbxMemberID.Text;
                SqlDataReader reader = getMemberInfoCommand.ExecuteReader();
                if (reader.Read() == false || (string)reader["CardPwd"] != tbxCardPwd.Text)
                {
                    lblReviewPriceStatus.Text = "��ԱID���������";
                    conn.Close();
                    return;
                }
                remainAmount = (decimal)reader["AdvancePayment"];
                reader.Close();

                // �����ۿ���
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

            // ���priceList�����ݣ��������ܼ�
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
            btnReviewPrice.Text = "ȡ��";

            lblViewPrice.Visible = true;
            lblTotalPrice.Visible = true;
        }
        else
        {
            SetModifiableControlEnable(true);
            priceList.Clear();
            gvGoodsPrice.DataBind();
            reviewPriceBtnState = 0;
            btnReviewPrice.Text = "�鿴�ܼ�";
            lblTotalPrice.Text = "";
            lblReviewPriceStatus.Text = "";

            lblCardRemainAmount.Visible = false;
            lblRemain.Visible = false;
            lblViewPrice.Visible = false;
            lblTotalPrice.Visible = false;
        }
    }
}
