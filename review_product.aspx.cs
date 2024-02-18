using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class review_product : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["pid"] != null && Request.QueryString["pid"].ToString() != "")
            {
                bind_div_data(Request.QueryString["pid"]);
                view_image();
                review_bind();
            }
        }
    }

    private void review_bind()
    {
        SqlCommand cmd = new SqlCommand("select * from Tbl_product_review where product_id='" + Request.QueryString["pid"] + "'");
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet dp= new DataSet();
        adp.Fill(dp);

        Repeaterreview.DataSource = dp;
        Repeaterreview.DataBind();
    }

    private void view_image()
    {
        SqlCommand cmd_sel = new SqlCommand("select *,(select top(1) img_url from tbl_image where product_id=tbl_product.product_id) as pimg,(select categ_name from tbl_category where categ_id=Tbl_product.categ_id) as cname from tbl_product where categ_id='" + Request.QueryString["cid"] + "'", sconn);

        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater1.DataSource = ds;
        Repeater1.DataBind();

    }
private void bind_div_data(string p)
    {
        SqlCommand sel = new SqlCommand("select *,(select top(1) img_url from tbl_image where product_id=tbl_product.product_id) as pimg,(select categ_name from tbl_category where categ_id=Tbl_product.categ_id) as cname from tbl_product where product_id='" + p + "'", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater1.DataSource = ds;
        Repeater1.DataBind();
      //Lbldesc.Text = ds.Tables[0].Rows[0]["descripation"].ToString();

    }

protected void Button1_Click(object sender, EventArgs e)
    {
   
         string sqlQuery = "INSERT INTO Tbl_product_review Values('"+Session["Custid"]+"','"+Request.QueryString["pid"]+"','" + txtmessage.Text.Trim() + "','','" + Convert.ToDateTime(txtdate.Text.Trim()) + "','No')";
       SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);

      sconn.Open();
      sqlcmd.ExecuteNonQuery();
      sconn.Close();
 
     }
}
