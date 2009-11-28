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
    /// ��ʼ��ҳ��
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
        goodsListColumns.Add(new DataColumn("MemberPrice", typeof(decimal)));
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

    protected void btnBuy_Click(object sender, EventArgs e)
    {
        // ����������������Ʒ
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

            // ������������Ʒ��ӵ����ﵥ�б���
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
            //�ر����ݿ�����
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

        try
        {
            if (objConnection.State == ConnectionState.Closed)
                objConnection.Open();

            // �����ܽ��
            decimal totalCost = GetTotalCost();
            decimal remainAmount = 0;

            // ��Ա������
            if (DrDpDealway.SelectedIndex == 1)
            {
                // ȷ�������Ϣ
                SqlCommand getMemberInfoCommand =
                    new SqlCommand("SELECT * FROM Member WHERE MemberID = @MemberID", objConnection);
                getMemberInfoCommand.Parameters.Add("MemberID", SqlDbType.VarChar);
                getMemberInfoCommand.Parameters["MemberID"].Value = tbxMemberID.Text;
                SqlDataReader reader = getMemberInfoCommand.ExecuteReader();
                if (reader.Read() == false || (string)reader["CardPwd"] != tbxCardPwd.Text)
                {
                    lblOrderStatus.Text = "��ԱID���������";
                    objConnection.Close();
                    return;
                }

                // ȷ�����
                remainAmount = (decimal)reader["AdvancePayment"];
                if (remainAmount < totalCost)
                {
                    lblOrderStatus.Text = "��Ա�����㣡";
                    objConnection.Close();
                    return;
                }
                reader.Close();
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

            // д�����������ۼ�����ֵ
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

            // (TODO: mincomp)��ӹ�����Ϣ��Dealing��

            // ��չ�������
            ClearAllTextBox();

            // ��ʼ��ҳ��
            InitPage();

            // �޸Ĺ������
            if (DrDpDealway.SelectedIndex != 2) lblOrderStatus.Text = "�ɹ�����";
            else lblOrderStatus.Text = "�ɹ�ѹ����";
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
    /// �õ�gvGoodsList��������Ʒ���ܼ۸�
    /// </summary>
    /// <returns></returns>
    private decimal GetTotalCost()
    {
        int dealway = DrDpDealway.SelectedIndex;
        decimal totalCost = 0;

        if (dealway == 1)   // ��Ա��֧��
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
}
