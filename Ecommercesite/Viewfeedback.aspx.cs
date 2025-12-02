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
    public partial class Viewfeedback : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string f = "SELECT dbo.UserTab.User_id,dbo.UserTab.Name, dbo.review.Review_id, dbo.review.Review_message FROM dbo.UserTab INNER JOIN dbo.review ON dbo.UserTab.User_id = dbo.review.User_id where dbo.review.Review_status=1";
            DataSet ds = obj.Fn_Adapter(f);
            gridview1.DataSource = ds;
            gridview1.DataBind();
        }

        protected void LinkButton1_Command1(object sender, CommandEventArgs e)
        {
            int getid = Convert.ToInt32(e.CommandArgument);
            Session["feedid"] = getid;
            Response.Redirect("reply.aspx");

        }
    }
}