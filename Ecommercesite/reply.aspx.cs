using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Net.Mail;

namespace Ecommercesite
{
    public partial class reply : System.Web.UI.Page
    {
        connection obj = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = "select Admin_email from Admin1 where Admin_id=" + Session["id"] + "";
            SqlDataReader dr = obj.Fn_reader(s);
            while (dr.Read())
            {
                TextBox2.Text = dr["Admin_email"].ToString();
            }
            string z = "SELECT dbo.UserTab.Email FROM dbo.UserTab INNER JOIN dbo.review ON dbo.UserTab.User_id = dbo.review.User_id where dbo.review.Review_id=" + Session["feedid"] + "";
            SqlDataReader dr1 = obj.Fn_reader(z);
            while (dr1.Read())
            {
                TextBox1.Text = dr1["Email"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "select Admin_name from Admin1 where Admin_id=" + Session["id"] + "";
            string cv = obj.Fn_Scalar(s);
            string z = "SELECT dbo.UserTab.Name FROM dbo.UserTab INNER JOIN dbo.review ON dbo.UserTab.User_id = dbo.review.User_id where dbo.review.Review_id=" + Session["feedid"] + "";
            string gh = obj.Fn_Scalar(z);

            SendEmail2(cv, TextBox2.Text, "jerr nhmy naau uunw", gh, TextBox1.Text, TextBox3.Text, TextBox4.Text);
        }
        public static void SendEmail2(string yourname, string yourGmailUserName, string yourGmailPassword, string tonaame, string toEmail, string subject, string body)

        {
            string to = toEmail; //To address    
            string from = yourGmailUserName; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = body;
            message.Subject = subject;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential(yourGmailUserName, yourGmailPassword);
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

}