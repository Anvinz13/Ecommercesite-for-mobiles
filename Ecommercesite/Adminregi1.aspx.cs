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
    public partial class Adminregi1 : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string s = "select max(Reg_id) from Login1";
            string maxregid = obj.Fn_Scalar(s);
            int reg_id = 0;
            if (maxregid == "")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                reg_id = newregid + 1;
            }

            string ins = "insert into Admin1 values(" + reg_id + ",'" + txtName.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "')";
            int i = obj.Fn_nonquery(ins);
            if (i == 1)
            {
                string sel = "insert into Login1 values(" + reg_id + ",'" + txtUsername.Text + "','" + txtPassword.Text + "','Admin')";
                int op = obj.Fn_nonquery(sel);
                if (i == 1 && op == 1)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Successfully Registered";
                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Failed";
            }
        }
    }
}