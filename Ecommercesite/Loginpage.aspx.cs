using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Ecommercesite
{
    public partial class Loginpage : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
                string str = "select count(Reg_id) from Login1 where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'";
                string cid = obj.Fn_Scalar(str);
                if (cid == "1")
                {
                    string selectid = "select Reg_id from Login1 where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'";
                    string scid = obj.Fn_Scalar(selectid);
                Session["id"] = scid;


                    string log = "select Log_type from Login1 where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'";
                    string logtype = obj.Fn_Scalar(log);

                    if (logtype == "Admin")
                    {
                        Response.Redirect("Adminhome.aspx");
                    }
                    else if (logtype == "User")
                    {
                    string df = "select User_status from UserTab where User_id=" + Session["id"] + "";
                    string sa = obj.Fn_Scalar(df);

                    if (sa == "Active")
                    {
                        Response.Redirect("Userhome.aspx");
                    }
                    else
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "Your account is currently blocked";
                        
                    }
                }
                }


        }
    }
}