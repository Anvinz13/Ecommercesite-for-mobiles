using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommercesite
{
    public partial class Feedback : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ins = "insert into review values(" + Session["id"] + ",'" + TextBox1.Text + "','Nill',1)";
            int i = obj.Fn_nonquery(ins);
            if (i == 1)
            {
                Label2.Visible = true;
                Label2.Text = "Review posted successfully";
            }
        }
    }
}