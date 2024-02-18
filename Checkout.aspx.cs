using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class Checkout : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Custid"] != null)
                {
                    view_cart();
                    bind_div_data(Session["Custid"].ToString());
                }
        }

    }

    private void view_cart()
    {
        DataTable dt = (DataTable)Session["ShoppingCart"];

        Repeater5.DataSource = dt;
        Repeater5.DataBind();

        double total = 0.0;
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                total += Convert.ToDouble(dt.Rows[i]["TotalPrice"].ToString());
            }
        }

        divTotal.InnerHtml = total.ToString("#0.00");

    }

    protected void Repeater5_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HtmlImage prodimg = (HtmlImage)e.Item.FindControl("prodimg");
            DataRowView dr = (DataRowView)e.Item.DataItem;
            SqlDataAdapter adpt = new SqlDataAdapter("select top 1 * from tbl_image where product_id='" + dr["ProdID"].ToString() + "'", sconn);
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                prodimg.Src = "admin/image/product/" + ds.Tables[0].Rows[0]["img_url"].ToString();
            }
        }
    }

    private void bind_div_data(string p)
    {
        SqlCommand Sel = new SqlCommand("select * From Tbl_customer where cust_id='"+p+"'",sconn);
        sconn.Open();
        SqlDataReader dr = Sel.ExecuteReader();
        if (dr.Read())
        {
            txtcname.Text = dr["cust_name"].ToString();
            txtno.Text = dr["contact_no"].ToString();
            txtemail.Text = dr["email_id"].ToString();
            txtaddress.Text = dr["address"].ToString();
        }
        sconn.Close();
    }
    

    protected void Order_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd_sel = new SqlCommand("INSERT INTO tbl_order values('" + Session["Custid"].ToString() + "','" + txtaddress.Text.Trim() + "','" + txtPincode.Text.Trim() + "','" + Convert.ToDouble(divTotal.InnerHtml) + "','CASH','NO','Pending','" + DateTime.Now.ToString("yyyy-mm-dd") + "')", sconn);
            sconn.Open();
            int res = cmd_sel.ExecuteNonQuery();
            sconn.Close();

            string maxId = "";
            if (res == 1)
            {
                SqlCommand cmdId = new SqlCommand("SELECT max(order_id) FROM tbl_order",sconn);
                if (sconn.State == ConnectionState.Closed)
                    sconn.Open();

                maxId = cmdId.ExecuteScalar().ToString();

                for (int j = 0; j < Repeater5.Items.Count; j++)
                {
                    HiddenField hfProdID = (HiddenField)Repeater5.Items[j].FindControl("hfProductId");
                    Label txtQuantity = (Label)Repeater5.Items[j].FindControl("txtQuantity");
                    SqlCommand cmd_detail = new SqlCommand("INSERT INTO tbl_detail values('" + maxId + "','" + hfProdID.Value + "','" + Convert.ToInt32(txtQuantity.Text.Trim()) + "')", sconn);
                    if (sconn.State == ConnectionState.Closed)
                        sconn.Open();
                    int res1 = cmd_detail.ExecuteNonQuery();
                    

                }
                //Response.Redirect("Order.aspx");
                Response.Redirect("User_invoice.aspx?OID=" + maxId);
            }
            
        }
        catch (Exception ex) {
            if (sconn.State == ConnectionState.Open)
                sconn.Close();
        }
        finally {
            if (sconn.State == ConnectionState.Open)
                sconn.Close();
        }
        
    }
}