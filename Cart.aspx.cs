using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

public partial class Cart : System.Web.UI.Page
 {
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            view_cart();
        }
    }

    private void view_cart()
    {
        DataTable dt = (DataTable)Session["ShoppingCart"];

        Repeater5.DataSource = dt;
        Repeater5.DataBind();

        double total = 0.0;
        if (dt.Rows.Count > 0)
        {
            for(int i=0;i<dt.Rows.Count;i++)
            {
                total += Convert.ToDouble(dt.Rows[i]["TotalPrice"].ToString());
            }
        }

        divTotal.InnerHtml = total.ToString("#0.00");

    }

    protected void Repeater5_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HtmlImage prodimg = (HtmlImage)e.Item.FindControl("prodimg");
            DataRowView dr = (DataRowView)e.Item.DataItem;
            SqlDataAdapter adpt = new SqlDataAdapter("select top 1 * from tbl_image where product_id='" + dr["ProdID"].ToString() + "'", sconn);
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                prodimg.Src = "admin/image/product/" + ds.Tables[0].Rows[0]["img_url"].ToString();
            }
        }
    }
    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        if (Session["Custid"] != null)
        {
            Response.Redirect("Checkout.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void btnUpdateCart_Click(object sender, EventArgs e)
    {

        if (Session["ShoppingCart"] != null)
        {
            DataTable dt = (DataTable)Session["ShoppingCart"];
            for (int i = 0; i < Repeater5.Items.Count; i++)
            {
                HiddenField hfProdID = (HiddenField)Repeater5.Items[i].FindControl("hfProductId");
                TextBox txtQuantity = (TextBox)Repeater5.Items[i].FindControl("txtQuantity");
                if (txtQuantity.Text.Trim() != "" && txtQuantity.Text.Trim() != "0")
                {
                    double total = 0.0;
                    int Qty = Convert.ToInt32(txtQuantity.Text);

                    if (hfProdID.Value == dt.Rows[i]["ProdID"].ToString())
                    {
                        dt.Rows[i]["Quantity"] = Qty.ToString();
                        total = Qty * Convert.ToDouble(dt.Rows[i]["UnitPrice"].ToString());
                        dt.Rows[i]["TotalPrice"] = total.ToString();
                    }
                }
            }

            Session["ShoppingCart"] = dt;
            view_cart();
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        LinkButton btnRemove = (LinkButton)sender;
        RepeaterItem ritem = (RepeaterItem)btnRemove.NamingContainer;

        HiddenField hfpid = (HiddenField)ritem.FindControl("hfProductId");

        DataTable dt = (DataTable)Session["ShoppingCart"];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["ProdID"].ToString() == hfpid.Value)
            {
                dt.Rows[i].Delete();
            }
        }

        Session["ShoppingCart"] = dt;
        view_cart();
    }
}