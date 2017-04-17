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
    public partial class register_city : System.Web.UI.Page
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

        private void LoadDistrict()
        {
            try
            {

                String q = "select * from district where state_id like " + drdState.SelectedValue.ToString();
                DataTable dt = DBConnection.GetDataTable(q);
                drdDistrict.DataSource = dt;
                drdDistrict.DataTextField = "district_name";
                drdDistrict.DataValueField = "district_id";
                drdDistrict.DataBind();
                drdDistrict.Items.Insert(0,"");

            }
            catch (Exception ee)
            {

                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }

        }
        private void LoadTaluka()
        {
            try
            {

                String q = "select * from taluka where district_id like " + drdDistrict.SelectedValue.ToString();
                DataTable dt = DBConnection.GetDataTable(q);
                drdTaluka.DataSource = dt;
                drdTaluka.DataTextField = "taluka_name";
                drdTaluka.DataValueField = "taluka_id";
                drdTaluka.DataBind();
                drdTaluka.Items.Insert(0,"");
            }
            catch (Exception ee)
            {

                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("Insert into city(taluka_id, city_name) values(?taluka_id, ?city_name)", con);
            cmd.Parameters.AddWithValue("?taluka_id", drdTaluka.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("?city_name", txtCity.Text);
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
                    error.Visible = false;

                }
                con.Close();
            }
            catch (Exception ee)
            {
                error.Visible = false;
                error_message.InnerHtml = "" + ee.Message;
            }
        }

        protected void drdState_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDistrict();
        }

        protected void drdDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadTaluka();
        }

    }
}