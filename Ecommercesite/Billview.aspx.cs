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
    public partial class Billview : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string f = "SELECT dbo.UserTab.Name, dbo.UserTab.Email, dbo.UserTab.Phone, dbo.UserTab.Address FROM  dbo.UserTab INNER JOIN dbo.Bill ON dbo.UserTab.User_id = dbo.Bill.User_id where dbo.Bill.User_id=" + Session["id"] + "and dbo.Bill.Bill_id=" + Session["billid"] + "";
            SqlDataReader dr = obj.Fn_reader(f);
            if (dr.Read())
            {
                Label6.Text = dr["Name"].ToString();
                Label8.Text = dr["Address"].ToString();
                Label9.Text = dr["Phone"].ToString();
                //Label12.Text = dr["Grandtotal"].ToString();
                Label7.Text = dr["Email"].ToString();

            }
            string sel = "select sum(Subtotal)from Orders where User_id=" + Session["id"] + " and Order_status='order'";
            string s = obj.Fn_Scalar(sel);
            Label12.Text = s;

            string j = "SELECT dbo.Orders.Quantity, dbo.Orders.Subtotal, dbo.Product1.Product_name, dbo.Product1.Product_price FROM dbo.Orders INNER JOIN dbo.Product1 ON dbo.Orders.Product_id = dbo.Product1.Product_id  where dbo.Orders.User_id=" + Session["id"] + "and dbo.Orders.Order_status='order'";
            DataSet ds = obj.Fn_Adapter(j);
            GridView1.DataSource = ds;
            GridView1.DataBind();


        }
    }
}