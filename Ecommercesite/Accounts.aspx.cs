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
    public partial class Accounts : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sel = "select sum(Subtotal) from Orders where User_id=" + Session["id"] + " and Order_status='order'";
            string ll = obj.Fn_Scalar(sel);
            TextBox3.Text = ll;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ins = "insert into Account values(" + Session["id"] + ",'" + DropDownList1.SelectedItem.Text + "','" + TextBox1.Text + "'," + TextBox3.Text + ")";
            int i = obj.Fn_nonquery(ins);
            if (i == 1)
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string c = "select count(Account_no) from Account where User_id=" + Session["id"] + " and Account_no='" + TextBox1.Text + "'";
            string j = obj.Fn_Scalar(c);
            int jj = Convert.ToInt32(j);
            if (jj == 1)
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ServiceReference1.ServiceClient obj1 = new ServiceReference1.ServiceClient();
            string bal = obj1.balancecheck(TextBox1.Text);
            int r = Convert.ToInt32(TextBox3.Text);
            int n = Convert.ToInt32(bal);
            if (n < r)
            {
                Label9.Text = "No enough balance";
            }
            else
            {
                string h = "select Product_id from Orders where User_id=" + Session["id"] + " and Order_status='order'";
                SqlDataReader dr = obj.Fn_reader(h);
                List<string> ptdlist = new List<string>();
                while (dr.Read())
                {
                    ptdlist.Add((dr["Product_id"].ToString()));
                }
                foreach (string productid in ptdlist)
                {
                    string d = "select * from Orders where Product_id=" + productid + " and User_id=" + Session["id"] + "";
                    SqlDataReader drr = obj.Fn_reader(d);
                    string qty = "";
                    while (drr.Read())
                    {
                        qty = (drr["Order_quantity"].ToString());
                    }

                    string pp = "update Orders set Order_status='Payed' where User_id=" + Session["id"] + " and Product_id=" + productid + "";
                    int q = obj.Fn_nonquery(pp);

                    string ee = "select Product_stock from Product1 where Product_id=" + productid + "";
                    string tt = obj.Fn_Scalar(ee);
                    int oldstock = Convert.ToInt32(tt);
                    int orderedqty = Convert.ToInt32(qty);
                    int updatedstock = oldstock - orderedqty;

                    string xx = "update Product1 set Product_stock=" + updatedstock + " where Product_id=" + productid + "";
                    int m = obj.Fn_nonquery(xx);
                }

                string lk = "select Balance_amount from Account where User_id=" + Session["id"] + " and Account_no='" + TextBox1.Text + "'";
                string poo = obj.Fn_Scalar(lk);
                int z = Convert.ToInt32(poo);
                int zz = Convert.ToInt32(TextBox3.Text);
                int yy = z - zz;

                int uid = Convert.ToInt32(Session["id"]);
                int y = obj1.amountreduction(TextBox1.Text, uid, yy);
                Label9.Text = "Payment Successful";
            }

        }

    }
}
            
