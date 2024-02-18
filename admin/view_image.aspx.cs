using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_image : System.Web.UI.Page
{

    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString() != "")
        {
            sconn.Open();
            SqlCommand del = new SqlCommand("delete From Tbl_view_image where Img_id=' "+Request.QueryString["del"]+"'",sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_image.aspx");
            sconn.Close();
        }
        view_image();
    }
        protected void view_image()
        {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select *,(select title from tbl_product where product_id=tbl_image.product_id)as ptitle from tbl_image", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater8.DataSource = ds;
        Repeater8.DataBind();

        sconn.Close();
        }
        protected void Lbtndelete_Click(object sender, EventArgs e)
        {
            SqlConnection sconn = new SqlConnection(mystring);
            sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_image where img_id='" + hfi_id.Value + "'", sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_image.aspx");
            sconn.Close();
        }
}