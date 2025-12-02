using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Ecommercesite
{
    public partial class userpage : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String s = "select * from Category2";
                DataSet ds = obj.Fn_Adapter(s);
                DataList1.DataSource = ds;
                DataList1.DataBind();

            }

        }
      

        protected void ImageButton2_Command(object sender, CommandEventArgs e)
        {
            int getid = Convert.ToInt32(e.CommandArgument);
            Session["uid"] = getid;
            Response.Redirect("viewproduct.aspx");

        }
    }
}