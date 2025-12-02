using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommercesite
{
    public partial class Adminreg : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "select max(Reg_id) from Login1";
            string maxregid = obj.Fn_Scalar(s);
            int reg_id = 0;
            
            if (maxregid=="")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                reg_id = newregid + 1;
            }

            string ins = "insert into Admin1 values(" + reg_id + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "')";
            int i = obj.Fn_nonquery(ins);
            if (i!=0)
            {
                string sel = "insert into Login1 values(" + reg_id + ",'" + TextBox4.Text + "','" + TextBox5.Text + "','Admin')";
                int op = obj.Fn_nonquery(sel);
                if (i!=0 && op!=0)
                {
                    //Label1.Visible = true;
                    Label1.Text = "Successfully Registered";
                }
            }
            else
            {
                //Label1.Visible = true;
                Label1.Text = "Failed";
            }

        }
    }
}