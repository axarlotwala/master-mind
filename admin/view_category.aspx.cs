using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_category : System.Web.UI.Page
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
            SqlCommand del = new SqlCommand("delete from Tbl_category where categ_id=' " + Request.QueryString["del"] + "'", sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_category.aspx");
            sconn.Close();
        }
        ctegory_details();
    }

    protected void ctegory_details()
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select * from Tbl_category", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater1.DataSource = ds;
        Repeater1.DataBind();
        sconn.Close();
    }
    protected void Lbtndelete_Click(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        SqlCommand del = new SqlCommand("delete from Tbl_category where categ_id='" + hfcid.Value + "'", sconn);
        del.ExecuteNonQuery();
        Response.Redirect("view_category.aspx");
        sconn.Close();
    }
}