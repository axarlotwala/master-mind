﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Front_Pannel_Default : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        view_product();
        view_Allproduct();
       view_category();
    }

    private void view_Allproduct()
    {
        SqlDataAdapter adp = new SqlDataAdapter("select *,(select top 1 img_url from Tbl_image where product_id=Tbl_product.product_id) as img From Tbl_product", sconn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater3.DataSource = ds;
        Repeater3.DataBind();
    }
    protected void view_product()
    {
        SqlDataAdapter adp = new SqlDataAdapter("select top 4 *,(select top 1 img_url from Tbl_image where product_id=Tbl_product.product_id) as img,(select categ_name from tbl_category where categ_id=Tbl_product.categ_id) as cname from Tbl_product ORDER BY product_id DESC", sconn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater1.DataSource = ds;
        Repeater1.DataBind();
       
    }
    protected void view_category()
    {
        SqlDataAdapter adp2 = new SqlDataAdapter("select top 10 * from tbl_category ", sconn);
        DataSet ds2 = new DataSet();
        adp2.Fill(ds2);

        Repeater2.DataSource = ds2;
        Repeater2.DataBind();
    }
}