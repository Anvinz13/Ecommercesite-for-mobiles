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
    public partial class Productadd : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string s = "Select Category_id,Category_name from Category2";
                DataSet ds = con.Fn_Adapter(s);
                ddlCategory.DataSource = ds;
                ddlCategory.DataTextField = "Category_name";
                ddlCategory.DataValueField = "Category_id";
                ddlCategory.DataBind();
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string s = "~/Product/" + fileProductImage.FileName;
            fileProductImage.SaveAs(MapPath(s));
            string ins = "insert into Product1 values('" + ddlCategory.SelectedItem.Value + "','" + txtProductName.Text + "','"+txtProductDescription.Text+ "','" + s + "','" + txtProductPrice.Text + "','" + ddlStatus.SelectedValue + "','" + txtProductStock.Text + "')";
            int i = con.Fn_nonquery(ins);
            if (i != 0)
            {
                Label1.Visible = true;
                Label1.Text = "Inserted";
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "failed";
            }

        }

       
    }
}