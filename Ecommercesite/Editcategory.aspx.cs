using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Ecommercesite
{
    public partial class Editcategory : System.Web.UI.Page
    {
        connection con = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                grid_view();
            }
            

        }
        public void grid_view()
        {
            string s = "select * from Category2";
            DataSet ds = con.Fn_Adapter(s);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            grid_view();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            TextBox textstatus = (TextBox)GridView1.Rows[i].Cells[3].Controls[0];
            TextBox textdesc = (TextBox)GridView1.Rows[i].Cells[2].Controls[0];
            FileUpload fileUpload = (FileUpload)GridView1.Rows[i].FindControl("FileUpload1");
            HiddenField HiddenField1 = (HiddenField)GridView1.Rows[i].FindControl("HiddenField1");

            string imgPath = HiddenField1.Value; // Set old image as default

            if (fileUpload != null && fileUpload.HasFile)
            {


                string fileName = Path.GetFileName(fileUpload.FileName);
                string uploadPath = Server.MapPath("~/Category/") + fileName;
                fileUpload.SaveAs(uploadPath);
                imgPath = "~/Category/" + fileName;

            }


            string h = "update Category2 set Category_status='" + textstatus.Text + "',Category_description='" + textdesc.Text + "',Category_image='" + imgPath + "' where Category_id=" + getid + "";
            int c = con.Fn_nonquery(h);
            if (c == 1)
            {
                Label1.Visible = true;
                Label1.Text = "updated";

                GridView1.EditIndex = -1;
                grid_view();
            }
            else
            {
                Label1.Text = "unable to update";
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            grid_view();

        }
    }
}