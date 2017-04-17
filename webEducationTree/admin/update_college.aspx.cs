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
    public partial class update_college : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
                LoadState();
                LoadDistrict();
                LoadTaluka();
                LoadCities();
                GetValues();
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


        private void GetValues()
        {
            if (String.IsNullOrEmpty(Request.QueryString["college_id"]))
            {
                Response.Redirect("list-college.aspx");
            }
            else
            {
                String college_id = Request.QueryString["college_id"];
                try
                {
                    DataRow dr = null;
                    dr = DBConnection.GetDataRow("Select * from college where (college_id=" + college_id + ")");
                    txtCollegeID.Text = dr["college_id"].ToString();
                    txtCollegeName.Text = dr["college_name"].ToString();
                    drdCollegeState.SelectedValue = dr["college_state"].ToString();
                    drdDistrict.SelectedValue = dr["college_district"].ToString();
                    drdTaluka.SelectedValue = dr["college_taluka"].ToString();
                    drdCity.SelectedValue = dr["college_city"].ToString();
                    drdCollegeType.Text = dr["college_type"].ToString();

                }
                catch (Exception)
                {

                   
                }
            }
        }
        private void LoadState()
        {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from state");
                drdCollegeState.DataSource = dt;
                drdCollegeState.DataTextField = "state_name";
                drdCollegeState.DataValueField = "state_id";
                drdCollegeState.DataBind();
                drdCollegeState.Items.Insert(0, "");

            }
            catch (Exception)
            {

            }

        }

        private void LoadDistrict() {
            try
            {

                String q = "select * from district ";
                DataTable dt = DBConnection.GetDataTable(q);
                drdDistrict.DataSource = dt;
                drdDistrict.DataTextField = "district_name";
                drdDistrict.DataValueField = "district_id";
                drdDistrict.DataBind();
                drdDistrict.Items.Insert(0, "");

            }
            catch (Exception ee)
            {

                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }

        }
        private void LoadTaluka() {
            try
            {

                String q = "select * from taluka ";
                DataTable dt = DBConnection.GetDataTable(q);
                drdTaluka.DataSource = dt;
                drdTaluka.DataTextField = "taluka_name";
                drdTaluka.DataValueField = "taluka_id";
                drdTaluka.DataBind();
                drdTaluka.Items.Insert(0, "");
            }
            catch (Exception ee)
            {

                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }

        }
        private void LoadCities() {
            try
            {

                String q = "select * from city ";
                DataTable dt = DBConnection.GetDataTable(q);
                drdCity.DataSource = dt;
                drdCity.DataTextField = "city_name";
                drdCity.DataValueField = "city_id";
                drdCity.DataBind();
                drdCity.Items.Insert(0, "");

            }
            catch (Exception ee)
            {

                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }
        }
        protected void drdCollegeState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                String q = "select * from district where state_id like " + drdCollegeState.SelectedValue.ToString();
                DataTable dt = DBConnection.GetDataTable(q);
                drdDistrict.DataSource = dt;
                drdDistrict.DataTextField = "district_name";
                drdDistrict.DataValueField = "district_id";
                drdDistrict.DataBind();
                drdDistrict.Items.Insert(0, "");

            }
            catch (Exception ee)
            {

                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }

        }

        protected void drdDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                String q = "select * from taluka where district_id like " + drdDistrict.SelectedValue.ToString();
                DataTable dt = DBConnection.GetDataTable(q);
                drdTaluka.DataSource = dt;
                drdTaluka.DataTextField = "taluka_name";
                drdTaluka.DataValueField = "taluka_id";
                drdTaluka.DataBind();
                drdTaluka.Items.Insert(0, "");
            }
            catch (Exception ee)
            {

                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }

        }

        protected void drdTaluka_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                String q = "select * from city where taluka_id like " + drdTaluka.SelectedValue.ToString();
                DataTable dt = DBConnection.GetDataTable(q);
                drdCity.DataSource = dt;
                drdCity.DataTextField = "city_name";
                drdCity.DataValueField = "city_id";
                drdCity.DataBind();
                drdCity.Items.Insert(0, "");

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
            MySqlCommand cmd = new MySqlCommand("UPDATE college set college_name=?college_name,college_state=?college_state,college_district=?college_district,college_taluka=?college_taluka,college_city=?college_city,college_type=?college_type where (college_id=?college_id)", con);
            cmd.Parameters.AddWithValue("?college_name", txtCollegeName.Text);
            cmd.Parameters.AddWithValue("?college_state", drdCollegeState.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("?college_district", drdDistrict.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("?college_taluka", drdTaluka.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("?college_city", drdCity.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("?college_type", drdCollegeType.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("?college_id", txtCollegeID.Text);


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