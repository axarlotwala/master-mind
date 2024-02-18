using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_cart : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();
            
    protected void Page_Load(object sender, EventArgs e)         
    {
        SqlConnection sconn = new SqlConnection(mystring);
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (Request.QueryString["del"]!=null && Request.QueryString["del"].ToString()!="") 
        {
            sconn.Open();
            SqlCommand del = new SqlCommand("delete  from Tbl_cart where cart_id='"+Request.QueryString["del"]+"'",sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_cart.aspx");
            sconn.Close();
        }

        view_cart();
    }

        protected void view_cart()
        {
            SqlConnection sconn = new SqlConnection(mystring);
            sconn.Open();

            SqlCommand cmd_sel = new SqlCommand("select * ,(select cust_name From tbl_customer Where cust_id=Tbl_cart.cust_id) as cname , (select title  From Tbl_product Where product_id = Tbl_cart.product_id)as ptitle From tbl_cart", sconn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            Repeater4.DataSource = ds;
            Repeater4.DataBind();

            sconn.Close();

    }
        protected void Lbtndelete_Click(object sender, EventArgs e)
        {
            SqlConnection sconn = new SqlConnection(mystring);
            sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_cart where cart_id='" + hfcrt_id.Value + "'", sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_cart.aspx");
            sconn.Close();
        }
}