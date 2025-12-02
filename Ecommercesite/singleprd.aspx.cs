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
    public partial class viewallprod : System.Web.UI.Page
    {
        connection obj = new connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string s = "select Product_name,Product_price,Product_description,Product_stock,Product_image from Product1 where Product_id=" + Session["pid"] + "";
                SqlDataReader dr = obj.Fn_reader(s);
                while (dr.Read())
                {
                    Label6.Text = dr["Product_name"].ToString();
                    Label7.Text = dr["Product_price"].ToString();
                    Label8.Text = dr["Product_description"].ToString();
                    Label9.Text = dr["Product_stock"].ToString();
                    Image1.ImageUrl = dr["Product_image"].ToString();
                }
            }
        

        }
        public void stockcheck()
        {
            string sto = "select Product_stock from Product1 where Product_id=" + Session["pid"] + "";
            string i = obj.Fn_Scalar(sto);
            int k = Convert.ToInt32(i);
            int userstk = Convert.ToInt32(TextBox1.Text);
            if (k < userstk)
            {
                Label10.Visible = true;
                Label10.Text = "Product is out of stock";
            }
            else
            {
                Label10.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                int quantity;
                string t = TextBox1.Text;
                if (t == "")
                {
                    quantity = 0;
                    TextBox1.Text = Convert.ToString(quantity);
                }

                else
                {

                    int newqty = Convert.ToInt32(TextBox1.Text);
                    quantity = newqty - 1;
                    TextBox1.Text = Convert.ToString(quantity);

                }

                stockcheck();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int quantity;
            string t = TextBox1.Text;
            if (t == "")
            {
                quantity = 0;
                TextBox1.Text = Convert.ToString(quantity);
            }
            else
            {
                int newqty = Convert.ToInt32(TextBox1.Text);
                quantity = newqty + 1;
                TextBox1.Text = Convert.ToString(quantity);

            }

            stockcheck();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string b = "select Product_stock from Product1 where Product_id=" + Session["pid"] + "";
            string bb = obj.Fn_Scalar(b);
            int q = Convert.ToInt32(bb);
            if (q <= 0)
            {
                Label9.Visible = true;
                Label9.Text = "Product is out of stock";
            }
            else
            {
                Label9.Visible = false;
                int price = Convert.ToInt32(Label7.Text);
                int quant = Convert.ToInt32(TextBox1.Text);
                int subtotal = price * quant;
                string ins = "insert into Cart values (" + Session["pid"] + "," + Session["id"] + ",'" + quant + "','" + subtotal + "','1')";
                int l = obj.Fn_nonquery(ins);
                if (l == 1)
                {
                    Label11.Visible = true;
                    Label11.Text = "Added to cart";
                }
                else
                {
                    Label11.Visible = false;
                }
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Userhome.aspx");

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            stockcheck();
        }
    }
}
