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

    private void InitPage()
    {
        InitGoodsListTableSchema();
        InitDealWay();
        InitSellDate();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitPage();
        }
        gvBuyGoods.DataSource = goodsList;
        gvBuyGoods.DataBind();
        ifSucceedLabel.Text = "";
    }

    /// <summary>
    /// 初始化购物单表的Schema
    /// </summary>
    private void InitGoodsListTableSchema()
    {
        // 初始化goodsListColumns的schema
        goodsList = new DataTable();
        DataColumnCollection goodsListColumns = goodsList.Columns;
        goodsListColumns.Add(new DataColumn("GoodsID", typeof(string)));
        goodsListColumns.Add(new DataColumn("GoodsName", typeof(string)));
        goodsListColumns.Add(new DataColumn("Price", typeof(double)));
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
        DrDpdealway.Items.Clear();
        DrDpdealway.Enabled = true;
        DrDpdealway.Items.Add("Cash");
        DrDpdealway.Items.Add("MemberCard");
        DrDpdealway.Items.Add("PendingOrder");
    }

    protected void btnBuy_Click(object sender, EventArgs e)
    {
        // 搜索符合条件的商品
        SqlConnection objConnection = new SqlConnection(strConnect);
        SqlCommand objCommand = new SqlCommand("", objConnection);

        objCommand.CommandText = "SELECT GoodsID, GoodsName, ";

        if (DrDpdealway.Text.Trim() == "Cash")
        {
            objCommand.CommandText += "SellingPrice";
        }
        else
        {
            if (DrDpdealway.Text.Trim() == "MemberCard" || DrDpdealway.Text.Trim() == "PendingOrder")
                objCommand.CommandText += "MemberPrice";
        }

        objCommand.CommandText += " AS Price FROM Commodity " + " WHERE GoodsID = @GOODSID ";

        objCommand.Parameters.Add("GOODSID", SqlDbType.VarChar);
        objCommand.Parameters["GOODSID"].Value = tbxBuyGoodsID.Text.Trim();

        try
        {
            if (objConnection.State == ConnectionState.Closed)
                objConnection.Open();

            SqlDataReader reader = objCommand.ExecuteReader();
            if (reader.Read())
            {
                DataRow newRow = goodsList.NewRow();
                newRow["GoodsID"] = reader["GoodsID"];
                newRow["GoodsName"] = reader["GoodsName"];
                newRow["Price"] = reader["Price"];
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        /*SqlConnection objConnection = new SqlConnection(strConnect);
        SqlCommand objCommand = new SqlCommand("", objConnection);

        objCommand.CommandText = "INSERT INTO " + "()";*/



    }


    protected void btnInsert_Click(object sender, EventArgs e)
    {
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
        objCommand.Parameters["DEALWAY"].Value = DrDpdealway.SelectedIndex;
        objCommand.Parameters["EMPLOYEEID"].Value = tbxEmployeeID.Text.Trim();

        try
        {
            if (objConnection.State == ConnectionState.Closed)
                objConnection.Open();

            SqlTransaction transaction = objConnection.BeginTransaction();
            objCommand.Transaction = transaction;

            foreach (DataRow row in goodsList.Rows)
            {
                objCommand.Parameters["GOODSID"].Value = row["GoodsID"];
                objCommand.Parameters["SELLNUM"].Value = row["SellNum"];
                objCommand.ExecuteNonQuery();
            }

            transaction.Commit();
            ifSucceedLabel.Text = "成功购买！";
            ClearAllTextBox();
            InitPage();
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

    private void ClearAllTextBox()
    {
        tbxBuyGoodsID.Text = "";
        tbxEmployeeID.Text = "";
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
}
