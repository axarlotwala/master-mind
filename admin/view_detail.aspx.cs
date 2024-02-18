using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_detail : System.Web.UI.Page

{

    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        if (Session ["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString() != "")
        {
            sconn.Open();
            SqlCommand del=new SqlCommand("delete from Tbl_detail where detail_id='"+Request.QueryString["del"]+" ' ",sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_detail.aspx");
            sconn.Close();
        }
        view_detail();
    }

        protected void view_detail()
        {
            SqlConnection sconn = new SqlConnection(mystring);
            sconn.Open();

            SqlCommand cmd_sel = new SqlCommand("select * ,(select top 1 img_url From Tbl_image Where product_id = Tbl_detail.product_id) as iname,(select title From Tbl_product Where product_id = Tbl_detail.product_id) as ptitle,(select new_price From Tbl_product Where product_id = Tbl_detail.product_id) as price from Tbl_detail", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater6.DataSource = ds;
        Repeater6.DataBind();
        sconn.Close();
    }
     protected void Lbtndelete_Click(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        SqlCommand del = new SqlCommand("delete from Tbl_detail where detail_id='" + hfd_id.Value + "'", sconn);
        del.ExecuteNonQuery();
        Response.Redirect("view_detail.aspx");
        sconn.Close();
    }
}