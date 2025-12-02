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
    public partial class Userhome : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnShopNow_Click(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["id"] == null)
            {
                // User not logged in → redirect to login page
                Response.Redirect("Loginpage.aspx");
            }
            else
            {
                // User is logged in → redirect to shop page
                Response.Redirect("Userpage.aspx");
            }
        }

    }
}


