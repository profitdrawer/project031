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

public partial class Cashier_GoodsQuery : System.Web.UI.Page
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            gvCommoditySearch.Visible = true;
    }

    //单击搜索事件
    protected void btnSearch_Click(object sender, EventArgs e)
    {
     /*  //数据库连接
        SqlConnection objConnection = new SqlConnection(strConnect);
        //数据库命令
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //设置Sql语句
        objCommand.CommandText = "SELECT GoodsID, GoodsName, SellingPrice, MemberPrice, sellstate, GoodsMoreInfo " + "FROM Commodity " + "WHERE 1=1 ";

        if(tbxCommodityName.Text != "")
        {
            objCommand.CommandText += "AND GoodsName like '@COMMODITYNAME'";
        }

        if(tbxPriceFrom.Text != "")
        {
            objCommand.CommandText += "AND SellingPrice >= @PRICEFROM";
            objCommand.Parameters.Add("PRICEFROM", SqlDbType.Decimal);
            objCommand.Parameters["PRICEFROM"].Value = tbxPriceFrom.Text.Trim();
        }
        if(tbxPriceTo.Text != "")
        {
            objCommand.CommandText += "AND SellingPrice <= @PRICETO";
            objCommand.Parameters.Add("PRICETO", SqlDbType.Decimal);
            objCommand.Parameters["PRICETO"].Value = tbxPriceTo.Text.Trim();
        }

        //设置Sql语句参数类型
        objCommand.Parameters.Add("COMMODITYNAME", SqlDbType.VarChar);
        
        

        //Sql语句参数赋值
        objCommand.Parameters["COMMODITYNAME"].Value = "%" + tbxCommodityName.Text.Trim() + "%";     

        //这里使用DataAdapter和DataSet获取数据
        DataSet objDataset = new DataSet();
        SqlDataAdapter objAdapter = new SqlDataAdapter();
        objAdapter.SelectCommand = new SqlCommand(objCommand.CommandText, objConnection);

        try
        {
            //打开数据库连接
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }
            //数据填充
            objAdapter.Fill(objDataset);
        }
        catch (SqlException exp)
        {
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");
        }
        finally
        {
            //关闭数据库连接
            if(objConnection.State == ConnectionState.Open)
            {
                objConnection.Close();
            }
        }

        //设置数据源
        //gvCommoditySearch.DataSource = objDataset.Tables["Commodity"];
        //绑定数据源
        //gvCommoditySearch.DataBind();
   */

    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        tbxCommodityName.Text = "";
        tbxPriceFrom.Text = "";
        tbxPriceTo.Text = "";
    }
    protected void gvCommoditySearch_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
