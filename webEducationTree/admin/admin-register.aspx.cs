using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using webEducationTree.utility;

namespace webEducationTree.admin
{
    public partial class admin_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
            }
            CheckCookies();
        }
        private void CheckCookies()
        {
            HttpCookie myCookie = Request.Cookies["AdminCookie"];
            if (myCookie == null)
            {
                Response.Redirect("../logout.aspx");
            }
            else
            {
                admin_name.InnerHtml = myCookie["adminName"].ToString();
            }
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("Insert into admin (admin_name,admin_email,admin_pass,admin_contact) values (?admin_name,?admin_email,?admin_pass,?admin_contact)", con);
            cmd.Parameters.AddWithValue("?admin_name",txtAdminName.Text);
            cmd.Parameters.AddWithValue("?admin_email",txtAdminEmail.Text);
            cmd.Parameters.AddWithValue("?admin_pass",txtPassword.Text);
            cmd.Parameters.AddWithValue("?admin_contact",txtContact.Text);
            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
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
            finally {
                if (con!=null)
                {
                    con.Close();
                    con.Dispose();
                }
                if (cmd!=null)
                {
                    cmd.Dispose();
                }
            }
        }

    }
}