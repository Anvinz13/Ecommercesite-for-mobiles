using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommercesite
{
    public partial class Categoryadd : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string s = "~/Category/" + fuCategoryImage.FileName;
            fuCategoryImage.SaveAs(MapPath(s));
            string ins = "insert into Category2 values('" + txtCategoryName.Text + "','" + s + "','" + ddlStatus.SelectedValue + "','" + txtDescription.Text + "')";
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