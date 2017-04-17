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
    public partial class state_register : System.Web.UI.Page
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
            MySqlCommand cmd = new MySqlCommand("Insert into state(state_name) values(?state_name)", con);
            cmd.Parameters.AddWithValue("?state_name",txtStateName.Text);
            try
            {
                con.Open();
                int res=cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;

                }
                else {
                    error.Visible = true;
                
                }
                con.Close();
            }
            catch (Exception ee)
            {
                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }
        }
    }
}