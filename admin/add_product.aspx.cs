using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class admin_add_category : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCategory();
        }

        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }


        if (!IsPostBack)
        {
            if (Request.QueryString["upd"] != null && Request.QueryString["upd"].ToString() != "")
            {
                if (ViewState["pid"] == null)
                {
                    bind_div_data(Request.QueryString["upd"]);
                }
            }

        }
    }


    private void bind_div_data(string p)
    {
        SqlCommand sel = new SqlCommand("select * from Tbl_product where product_id = '" + p + "'", sconn);
        sconn.Open();
        SqlDataAdapter adpt = new SqlDataAdapter(sel);
        DataSet ds = new DataSet();
        adpt.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ViewState["pid"] = ds.Tables[0].Rows[0]["Product_id"];
            txtproductcode.Text = ds.Tables[0].Rows[0]["product_code"].ToString();
            txttitle.Text = ds.Tables[0].Rows[0]["title"].ToString();
            txtdescp.Text = ds.Tables[0].Rows[0]["descripation"].ToString();
            txtoldprice.Text = ds.Tables[0].Rows[0]["old_price"].ToString();
            txtnewprice.Text = ds.Tables[0].Rows[0]["new_price"].ToString();
            txtvideo.Text = ds.Tables[0].Rows[0]["video"].ToString();
            txtqty.Text = ds.Tables[0].Rows[0]["Total_Quantity"].ToString();
            txtinstallcharge.Text = ds.Tables[0].Rows[0]["install_charge"].ToString();
            drpstatus.SelectedValue = ds.Tables[0].Rows[0]["status"].ToString();




            FillCategory();
            if (Drpcategory.Items.FindByValue(ds.Tables[0].Rows[0]["categ_id"].ToString()) != null)
            {
                Drpcategory.Items.FindByValue(ds.Tables[0].Rows[0]["categ_id"].ToString()).Selected = true;
            }

            if (drpstatus.Items.FindByValue(ds.Tables[0].Rows[0]["product_id"].ToString()) != null)
            {
                drpstatus.Items.FindByValue(ds.Tables[0].Rows[0]["product_id"].ToString()).Selected = true;
            }



            lblhead.InnerText = "update product";

            btnsubmit.Text = "update";
            btnreset.Text = "cancel";


        }
        sconn.Close();

    }

    private void FillCategory()
    {

        SqlDataAdapter adpt = new SqlDataAdapter("select * from tbl_category", sconn);
        DataSet ds = new DataSet();
        adpt.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Drpcategory.DataSource = ds.Tables[0];
            Drpcategory.DataTextField = "categ_name";
            Drpcategory.DataValueField = "categ_id";
            Drpcategory.DataBind();
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (ViewState["pid"] == null || ViewState["pid"].ToString() == "")
        {

            try
            {
                int res = 0;
                sconn.Open();
                SqlCommand sel = new SqlCommand("select * from Tbl_product Where title='" + txttitle.Text.Trim() + "'", sconn);
                SqlDataAdapter adpt = new SqlDataAdapter(sel);
                DataSet ds = new DataSet();
                adpt.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    divError.Visible = true;

                }
                else
                {

                    string sqlQuery = "INSERT INTO tbl_product values('" + txtproductcode.Text.Trim() + "','" + txttitle.Text.Trim() + "','" + txtdescp.Text.Trim() + "','" + txtoldprice.Text.Trim() + "','" + txtnewprice.Text.Trim() + "','" + txtvideo.Text + "' ,'" + Drpcategory.SelectedValue + "','" + txtqty.Text.Trim() + "','" + txtinstallcharge.Text.Trim() + "','" + drpstatus.SelectedValue + "')";
                    SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);
                    res = sqlcmd.ExecuteNonQuery();

                    SqlCommand sel_pid = new SqlCommand("select MAX(product_id) from Tbl_product", sconn);
                    string pid = sel_pid.ExecuteScalar().ToString();

                    if (fileuploadimages.HasFile)
                    {
                        foreach (HttpPostedFile uploadedFile in fileuploadimages.PostedFiles)
                        {
                            string filename = Path.GetFileName(uploadedFile.FileName);

                            SqlCommand ins_img = new SqlCommand("insert into Tbl_image (product_id,img_url) values ('" + pid + "','" + filename + "')", sconn);
                            int res1 = ins_img.ExecuteNonQuery();
                            if (res1 == 1)
                            {
                                uploadedFile.SaveAs(Server.MapPath("image/product/") + filename);
                            }
                        }
                    }

                }
                if (res != -1)
                {
                    divSuccess.Visible = true;
                    divError.Visible = false;
                    clearValues();
                    Response.Redirect("view_product.aspx");
                }
                else
                {
                    divSuccess.Visible = false;
                    divError.Visible = true;
                }
            }
            catch (Exception ex)
            {
                divSuccess.Visible = false;
                divError.Visible = true;
                sconn.Close();
            }

        }

        else
        {
            if (Drpcategory.SelectedValue != "")
            {
                string sqlQuery = "Update Tbl_product set product_code='" + txtproductcode.Text.Trim() + "',title='" + txttitle.Text.Trim() + "',descripation='" + txtdescp.Text.Trim() + "',old_price='" + txtoldprice.Text.Trim() + "',new_price='" + txtnewprice.Text.Trim() + "',categ_id='" + Drpcategory.SelectedValue + "',Total_Quantity='" + txtqty.Text.Trim() + "',install_charge='" + txtinstallcharge.Text.Trim() + "',status='" + drpstatus.SelectedValue + "'   where product_id='" + ViewState["pid"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);
                sconn.Open();


                if (fileuploadimages.HasFile)
                {
                    foreach (HttpPostedFile uploadedFile in fileuploadimages.PostedFiles)
                    {
                        string filename = Path.GetFileName(uploadedFile.FileName);

                        SqlCommand ins_img = new SqlCommand("insert into Tbl_image (product_id,img_url) values ('" + ViewState["pid"] + "','" + filename + "')", sconn);
                        int res1 = ins_img.ExecuteNonQuery();
                        if (res1 == 1)
                        {
                            uploadedFile.SaveAs(Server.MapPath("image/product/") + filename);
                        }
                    }
                }


                int res = 0;
                try
                {
                    res = sqlcmd.ExecuteNonQuery();
                    if (res != -1)
                    {
                        divSuccess.Visible = true;
                        divError.Visible = false;
                        clearValues();
                        Response.Redirect("view_product.aspx");
                    }
                    else
                    {
                        divSuccess.Visible = false;
                        divError.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    divSuccess.Visible = false;
                    divError.Visible = true;
                    sconn.Close();
                }

            }
        }
    }


    private void clearValues()
    {
        ViewState["pid"] = null;
        txtproductcode.Text = "";
        txttitle.Text = "";
        txtdescp.Text = "";
        txtoldprice.Text = "";
        txtnewprice.Text = "";
        Drpcategory.ClearSelection();
        txtqty.Text = "";
        txtinstallcharge.Text = "";

    }
}
