using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_emp_review : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString()!="")
        {
            sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_employee_review where review_id = ' "+Request.QueryString["del"]+"'",sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_emp_review.aspx");
            sconn.Close();
        }
           view_emp_review();
    }
        protected void view_emp_review()
        {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select * ,(select cust_name from tbl_customer where cust_id=Tbl_employee_review.cust_id)as cname from Tbl_employee_review", sconn);
        SqlDataAdapter adpt = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adpt.Fill(ds);

        Repeater9.DataSource = ds;
        Repeater9.DataBind();

        sconn.Close();
    }
        protected void Lbtndelete_Click(object sender, EventArgs e)
        {
            SqlConnection sconn = new SqlConnection(mystring);
            sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_employee_review where review_id='" + hfr_id.Value + "'", sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_emp_review.aspx");
            sconn.Close();
        }
}