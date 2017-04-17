using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using webEducationTree.utility;

namespace webEducationTree
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            error.Visible = false;
            success.Visible = false;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("Insert into member (member_name,member_email,password) values (?member_name,?member_email,?member_pass)", con);
            cmd.Parameters.AddWithValue("?member_name", txtUserName.Text);
            cmd.Parameters.AddWithValue("?member_email", txtUserEmail.Text);
            cmd.Parameters.AddWithValue("?member_pass", txtUserPass.Text);
            
            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
                 //   Response.Redirect("login.aspx");
                }
                else
                {
                    error.Visible = true;
                }
                con.Close();
            }
            catch (Exception ee)
            {
                error.Visible = true;
                error_msg.InnerHtml = "" + ee.Message;
            }
            finally
            {
                if (con != null)
                {
                    con.Close();
                    con.Dispose();
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                }
            }
        }
    }
}