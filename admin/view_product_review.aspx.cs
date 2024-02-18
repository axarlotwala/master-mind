using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_product_review : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection Sconn = new SqlConnection(mystring);
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString() != "")
        {
            Sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_product_review where review_id='" + Request.QueryString["del"] + "'", Sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_product_review.aspx");
            Sconn.Close();
        }
        view_product_review();
    }
        protected void view_product_review()
        {
        SqlConnection Sconn = new SqlConnection(mystring);
        Sconn.Open();


        SqlCommand cmd_sel = new SqlCommand("select *,(select cust_name from tbl_customer Where cust_id=Tbl_product_review.cust_id)as cname,(select title from Tbl_product Where product_id=tbl_product_review.product_id)as ptitle from tbl_product_review", Sconn);

        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater7.DataSource = ds;
        Repeater7.DataBind();
        Sconn.Close();

    }
        protected void Lbtndelete_Click(object sender, EventArgs e)
        {
            SqlConnection sconn = new SqlConnection(mystring);
            sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_product_review where review_id='" + hfpreview_id.Value + "'", sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_product_review.aspx");
            sconn.Close();
        }
}