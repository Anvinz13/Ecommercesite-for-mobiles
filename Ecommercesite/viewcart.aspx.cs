using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Ecommercesite
{
    public partial class viewcart : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_view();
                grand_total();

            }
        }
        public void grid_view()
        {
            string p = "SELECT dbo.Product1.Product_name, dbo.Product1.Product_image, dbo.Product1.Product_price, dbo.Cart.Cart_id, dbo.Cart.Quantity, dbo.Cart.Subtotal FROM  dbo.Product1 INNER JOIN dbo.Cart ON dbo.Product1.Product_id = dbo.Cart.Product_id where dbo.Cart.User_id=" + Session["id"] + "and dbo.Cart.Cart_status=1";
            DataSet ds = obj.Fn_Adapter(p);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        public void grand_total()
        {
            string p = "select sum(Subtotal) from Cart where User_id=" + Session["id"] + "and Cart_status=1";
            string f = obj.Fn_Scalar(p);

            if (f == "")
            {
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = true;
                Label3.Text = "no products in cart";
            }
            else
            {
                Label1.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                Label3.Text = f;
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string f = "delete from Cart where Cart_id=" + getid + "";
            int w = obj.Fn_nonquery(f);
            grid_view();
            grand_total();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            
            string f = "SELECT dbo.Product1.Product_price FROM dbo.Cart INNER JOIN dbo.Product1 ON dbo.Cart.Product_id = dbo.Product1.Product_id where dbo.Cart.Cart_id="+getid+"";
            string a = obj.Fn_Scalar(f);
            int k = Convert.ToInt32(a);
            TextBox textqty = (TextBox)GridView1.Rows[i].Cells[5].Controls[0];
            string d = "update Cart set Quantity=" + textqty.Text + " where Cart_id=" + getid + "";
            int v = obj.Fn_nonquery(d);
            string c = "select Quantity from Cart where Cart_id=" + getid + "";
            string jj = obj.Fn_Scalar(c);
            int getsub = Convert.ToInt32(jj);
            string fg = "update Cart set Subtotal=" + getsub * k + "where Cart_id=" + getid + "";
            int l = obj.Fn_nonquery(fg);
            GridView1.EditIndex = -1;
            grid_view();
            grand_total();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            grid_view();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            grid_view();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string f = "select Product_id from Cart where User_id=" + Session["id"] + "and Cart_status=1";
            SqlDataReader dr = obj.Fn_reader(f);
            List<string> pdlist = new List<string>();
            while (dr.Read())
            {
                pdlist.Add((dr["Product_id"].ToString()));
            }
            foreach (string productid in pdlist)
            {
                string d = "select * from Cart where Product_id=" + productid + "and User_id=" + Session["id"] + "";
                SqlDataReader dv = obj.Fn_reader(d);
                string subtotal = "", qty = "";
                while (dv.Read())
                {
                    subtotal = (dv["Subtotal"].ToString());
                    qty = (dv["Quantity"].ToString());
                }
                string w = "insert into Orders values(" + productid + "," + Session["id"] + ",'" + DateTime.Now.ToString("yyyy-MM-dd") + "'," + qty + "," + subtotal + ",'order')";
                int i = obj.Fn_nonquery(w);


                string k = "update Cart set Cart_status=0 where Product_id=" + productid + "";
                int g = obj.Fn_nonquery(k);
                string b = "select Product_stock from Product1 where Product_id=" + productid + "";
                string ni = obj.Fn_Scalar(b);
                int currentStock = Convert.ToInt32(ni);

                int orderedQty = Convert.ToInt32(qty);

                int updatedStock = currentStock - orderedQty;
                string up = "update Product1 set Product_stock=" + updatedStock + " where Product_id=" + productid;
                int kl = obj.Fn_nonquery(up);
            }
            string a = "select sum(Subtotal) from Orders where User_id=" + Session["id"] + "and Order_status='order'";
            string l = obj.Fn_Scalar(a);

            string q = "insert into Bill values(" + Session["id"] + "," + l + ",'" + DateTime.Now.ToString("yyyy-MM-dd").ToString() + "')";
            int t = obj.Fn_nonquery(q);
            if (t == 1)
            {
                grid_view();
                string k = "select MAX(Bill_id) from Bill where User_id="+Session["id"]+"";
                string h = obj.Fn_Scalar(k);
                Session["billid"] = h;
                Response.Redirect("Billview.aspx");
                Label4.Text = "success";
            }

        }
    }
}