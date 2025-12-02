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
    public partial class viewproduct : System.Web.UI.Page
    {
        connection obj = new connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (!IsPostBack)
                {
                    string s = "select * from Product1 where Product_status ='Active' and Category_id =" + Session["uid"] + "";
                    DataSet ds = obj.Fn_Adapter(s);
                    DataList1.DataSource = ds;
                    DataList1.DataBind();

                }

        }

        protected void ImageButton2_Command(object sender, CommandEventArgs e)
        {
            int getid = Convert.ToInt32(e.CommandArgument);
            Session["pid"] = getid;
            Response.Redirect("singleprd.aspx");
        }
    }
}
