using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Ecommercesite
{
    public class connection
    {
        SqlConnection con;
        SqlCommand cmd;

        public connection()
        {
            con = new SqlConnection(@"server=LAPTOP-6U7QMFB9\SQLEXPRESS;database=project_ecom;Integrated security=true");

        }
        public int Fn_nonquery(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        public string Fn_Scalar(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            string str = cmd.ExecuteScalar().ToString();
            con.Close();
            return str;
        }
        public SqlDataReader Fn_reader(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }
        public DataSet Fn_Adapter(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            SqlDataAdapter dr = new SqlDataAdapter(sqlquery, con);
            DataSet ds = new DataSet();
            dr.Fill(ds);
            return ds;

        }
        public DataTable Fn_Datatable(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            SqlDataAdapter dr = new SqlDataAdapter(sqlquery, con);
            DataTable dss = new DataTable();
            dr.Fill(dss);
            return dss;

        }
    }
}