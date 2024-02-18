using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_invoice : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["OID"] != null && Request.QueryString["OID"].ToString() != "")
        {
            FillOrderData(Request.QueryString["OID"].ToString());
        }
        
    }

    private void FillOrderData(string p)
    {
        //SqlCommand cmd_sel = new SqlCommand("select  *,(select order_date  From Tbl_order where order_id=Tbl_customer.order_id) as Date ,(select status From Tbl_order where order_id=Tbl_customer.order_id) as Status,(select order_id From Tbl_order where order_id=Tbl_customer.order_id) as order_id,(select title From Tbl_product where product_id=Tbl_customer.product_id) as pname,(select descripation From Tbl_product where product_id=Tbl_customer.product_id) as Description,(select Total_Quantity From Tbl_product where product_id=Tbl_customer.product_id) as Quantity,(select new_price From Tbl_product where product_id=Tbl_customer.product_id) as nprice From Tbl_customer", sconn);        
        SqlDataAdapter adp = new SqlDataAdapter("select *,(select cust_name from tbl_customer where cust_id=tbl_order.cust_id) as cname,(select contact_no from tbl_customer where cust_id=tbl_order.cust_id) as cno from tbl_order where order_id='" + p + "'", sconn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            lblCustomerName.Text = ds.Tables[0].Rows[0]["cname"].ToString();
            lblAddress.Text = ds.Tables[0].Rows[0]["address"].ToString() + "-" + ds.Tables[0].Rows[0]["pincode"].ToString();
            lblContactNo.Text = ds.Tables[0].Rows[0]["cno"].ToString();
            lblDate.Text = ds.Tables[0].Rows[0]["order_date"].ToString();
            lblStatus.Text = ds.Tables[0].Rows[0]["status"].ToString();
            lblOrderId.Text = ds.Tables[0].Rows[0]["order_id"].ToString();
            lblTotal.Text = ds.Tables[0].Rows[0]["total_pay"].ToString();


            SqlDataAdapter adpd = new SqlDataAdapter("select *,(select title From Tbl_product where product_id=Tbl_detail.product_id) as pname,(select new_price From Tbl_product where product_id=Tbl_detail.product_id) as nprice from tbl_detail where order_id='" + p + "'", sconn);
            DataSet dsd = new DataSet();
            adpd.Fill(dsd);
            repItems.DataSource = dsd;
            repItems.DataBind();

        }
    }
    protected void repItems_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView dr = (DataRowView)e.Item.DataItem;
            Label lblTotalPrice = (Label)e.Item.FindControl("lblTotalPrice");
            lblTotalPrice.Text = (Convert.ToInt32(dr["qty"]) * Convert.ToInt32(dr["nprice"])).ToString();
            
        }
    }
}