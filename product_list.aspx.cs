using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class product_list : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] == null)
        {
            Response.Redirect("homepage.aspx");
        }
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select  *,(select title from Tbl_product where product_id=tbl_detail.product_id)as pname,(select new_price from Tbl_product where product_id=tbl_detail.product_id)as price,(select categ_name from tbl_category where categ_id IN (select categ_id from Tbl_product where product_id=tbl_detail.product_id)) as cname,(select top 1 img_url from Tbl_image where product_id=tbl_detail.product_id) as img From tbl_detail where order_id='" + Request.QueryString["oid"] + "'", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        sconn.Close();

        Repeater1.DataSource = ds;
        Repeater1.DataBind();

    }
}