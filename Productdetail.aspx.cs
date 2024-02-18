using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Productdetail : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

   
    protected void Page_Load(object sender, EventArgs e) 
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["pid"] != null && Request.QueryString["pid"].ToString() != "")
                {
                    bind_div_data(Request.QueryString["pid"]);

                }
                View_product_Releted();
                View_product_review();
            }
      }

private void bind_div_data(string p)
{
    SqlCommand sel = new SqlCommand("select *,(select top(1) img_url from tbl_image where product_id=tbl_product.product_id) as pimg,(select categ_name from tbl_category where categ_id=Tbl_product.categ_id) as cname from tbl_product where product_id='" + p + "'", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater1.DataSource = ds;
        Repeater1.DataBind();
        Lbldesc.Text = ds.Tables[0].Rows[0]["descripation"].ToString();
}
   
  private void View_product_review()

    {
        SqlCommand cmd_sel = new SqlCommand("select *,(select cust_name from tbl_customer Where cust_id=Tbl_product_review.cust_id)as cname from tbl_product_review", sconn);

        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

      RepeaterRevirews.DataSource = ds;
      RepeaterRevirews.DataBind();

    }

  private void View_product_Releted()
  {
      SqlCommand cmd_sel = new SqlCommand("select *,(select top(1) img_url from tbl_image where product_id=tbl_product.product_id) as pimg,(select categ_name from tbl_category where categ_id=Tbl_product.categ_id) as cname from tbl_product where categ_id='" + Request.QueryString["cid"] + "'", sconn);

      SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
      DataSet ds = new DataSet();
      adp.Fill(ds);

      RepeaterRelatedProduct.DataSource = ds;
      RepeaterRelatedProduct.DataBind();

  }

  protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
  {
      if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
      {
          Repeater Repeater2 = (Repeater)(e.Item.FindControl("Repeater2"));
          DataRowView dr = (DataRowView)e.Item.DataItem;
          string id = Convert.ToString(dr["product_id"]);

          SqlCommand cmd = new SqlCommand("select * from Tbl_image where product_id='" + id + "'", sconn);
          SqlDataAdapter adp = new SqlDataAdapter(cmd);
          DataSet ds = new DataSet();
          adp.Fill(ds);
          Repeater2.DataSource = ds;
          Repeater2.DataBind();
          sconn.Close();
      }
  }
  protected void lnkAddToCart1_Click(object sender, EventArgs e)
  {

  }
  protected void lnkAddToCart_Click(object sender, EventArgs e)
  {
      LinkButton lnkAddToCart = (LinkButton)sender;
      RepeaterItem repItem = (RepeaterItem)lnkAddToCart.NamingContainer;

      TextBox txtQuantity = (TextBox)repItem.FindControl("txtQuantity");
      if (txtQuantity.Text.Trim() != "" && txtQuantity.Text.Trim() != "0")
      {
          DataTable dt = (DataTable)Session["ShoppingCart"];

          string sqlQuery = "SELECT * FROM tbl_product where product_id=" + Request.QueryString["pid"].ToString();
          SqlDataAdapter adpt = new SqlDataAdapter(sqlQuery, sconn);
          DataSet ds = new DataSet();
          adpt.Fill(ds);
          if (ds.Tables[0].Rows.Count > 0)
          {
              double total = 0.0;
              int qty = Convert.ToInt32(txtQuantity.Text.Trim()); // default add 1 as quantity
              DataRow objDR = dt.NewRow();
              objDR["ProdID"] = Request.QueryString["pid"].ToString();
              objDR["ProdName"] = ds.Tables[0].Rows[0]["title"].ToString();
              objDR["UnitPrice"] = Convert.ToDouble(ds.Tables[0].Rows[0]["new_price"].ToString());
              objDR["Quantity"] = qty.ToString();

              total = qty * Convert.ToDouble(ds.Tables[0].Rows[0]["new_price"].ToString());

              objDR["TotalPrice"] = total.ToString();

              dt.Rows.Add(objDR);
          }

          Session["ShoppingCart"] = dt;
          Response.Redirect("Cart.aspx");
      }
  }
}