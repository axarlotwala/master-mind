using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_product : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        SqlConnection sconn = new SqlConnection(mystring);
        {
            if (Request.QueryString["product_id"] != null && Request.QueryString["product_id"].ToString() != "")
            {
                SqlDataAdapter adpt = new SqlDataAdapter("select * From Tbl_product where product_id='" + Request.QueryString["product_id"].ToString() + "'", sconn);
                DataSet ds = new DataSet();
                adpt.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string status = ds.Tables[0].Rows[0]["status"].ToString();
                    string sql = "";
                    if (status == "Out Of Stock")
                    {
                        sql = "update tbl_product set status='In Stock' where product_id='" + Request.QueryString["product_id"].ToString() + "'";
                    }
                    else
                    {
                        sql = "update tbl_product set status='Out Of  Stock' where product_id='" + Request.QueryString["product_id"].ToString() + "'";
                    }

                    SqlCommand cmd = new SqlCommand(sql, sconn);
                    if (sconn.State == ConnectionState.Closed)
                        sconn.Open();

                    cmd.ExecuteNonQuery();
                    sconn.Close();

                }
            }



        }

        if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString() != "")
        {
            sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_product where product_id='" + Request.QueryString["del"] + "'", sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_product.aspx");
            sconn.Close();
        }
        view_product();
    }
    protected void view_product()
    {
        SqlConnection sconn = new SqlConnection(mystring);

        SqlDataAdapter adp = new SqlDataAdapter("select *,(select categ_name from tbl_category where categ_id=Tbl_product.categ_id) as cname from Tbl_product", sconn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater2.DataSource = ds;
        Repeater2.DataBind();

    }
    protected void Lbtndelete_Click(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        SqlCommand del = new SqlCommand("delete from Tbl_product where product_id='" + hfp_id.Value + "'", sconn);
        del.ExecuteNonQuery();
        Response.Redirect("view_product.aspx");
        sconn.Close();
    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            SqlConnection sconn = new SqlConnection(mystring);
            HiddenField lbl = (HiddenField)e.Item.FindControl("HiddenField1");
            DataRowView dr = (DataRowView)e.Item.DataItem;
            Repeater repImages = (Repeater)e.Item.FindControl("repImages");
            SqlDataAdapter adp = new SqlDataAdapter("select * from tbl_image where product_id='" + int.Parse(lbl.Value) + "'", sconn);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            repImages.DataSource = ds;
            repImages.DataBind();
        }
    }
}