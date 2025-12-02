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
    public partial class Userregisteration : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string s = "Select State_id,State_name from State";
                DataSet ds = con.Fn_Adapter(s);
                ddlState.DataSource = ds;
                ddlState.DataTextField = "State_name";
                ddlState.DataValueField = "State_id";
                ddlState.DataBind();
                ddlState.Items.Insert(0, "Select");
            }


        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sa = "Select District_id,District_name from District where State_id='"+ddlState.SelectedValue+"'";
            DataSet da = con.Fn_Adapter(sa);
            ddlDistrict.DataSource = da;
            ddlDistrict.DataTextField = "District_name";
            ddlDistrict.DataValueField = "District_id";
            ddlDistrict.DataBind();
            ddlState.Items.Insert(0, "Select");

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            String id = "select max(Reg_id) from Login1";
            string maxregid = con.Fn_Scalar(id);
            int regid = 0;
            if (maxregid == "")
            {
                regid = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                regid = newregid + 1;
            }

            string ins = "insert into UserTab values(" + regid + ",'" + txtName.Text + "'," + txtAge.Text + ",'" + txtEmail.Text + "','" + txtAddress.Text + "','" + txtPhone.Text + "','" + txtLocation.Text + "'," + txtPincode.Text + "," + ddlState.SelectedValue + "," + ddlDistrict.SelectedValue + ",'"+ddlStatus.Text+"')";
            int i = con.Fn_nonquery(ins);
            if (i == 1)
            {
                string insert = "insert into Login1 values(" + regid + ",'" + txtUsername.Text + "','" + txtPassword.Text + "','User')";
                int j = con.Fn_nonquery(insert);
                if (i == 1 && j == 1)
                {
                    Label1.Visible = true;
                    Label1.Text = "Successfully Registered";
                }
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Error";

            }
        }

        
    }
}