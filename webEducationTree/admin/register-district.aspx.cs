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
    public partial class register_district : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
                LoadState();
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
        private void LoadState() 
        {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from state");
                drdState.DataSource = dt;
                drdState.DataTextField = "state_name";
                drdState.DataValueField = "state_id";
                drdState.DataBind();
                drdState.Items.Insert(0,"");
             }
            catch (Exception)
            {
                
            }
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("INSERT INTO district(state_id,district_name) values(?state_id,?district_name)", con);
            cmd.Parameters.AddWithValue("?state_id", drdState.SelectedValue);
            cmd.Parameters.AddWithValue("?district_name", txtDistrictName.Text);
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
                cmd.Dispose();
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