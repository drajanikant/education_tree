using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using webEducationTree.utility;


namespace webEducationTree.member
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
                LoadState();
                LoadDataList();
            }
        }
        String member_id = "";
        private void CheckCookies()
        {
            HttpCookie myCookie = Request.Cookies["MemberCookie"];
            if (myCookie == null)
            {
                Response.Redirect("../logout.aspx");
            }
            else
            {
                member_name.InnerHtml = myCookie["memberName"].ToString();
                member_id = myCookie["memberId"].ToString();
            }
        }
        private void LoadDataList()
        {
            try
            {
                HttpCookie myCookie = Request.Cookies["MemberCookie"];
                member_id = myCookie["memberId"].ToString();


                DataTable dt = DBConnection.GetDataTable("Select * from view_address where (member_id = " + member_id + ")");
                dataAddress.DataSource = dt;
                dataAddress.DataBind();

            }
            catch (Exception)
            {
                throw;
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
                drdState.Items.Insert(0, "");
            }
            catch (Exception)
            {

            }

        }

        protected void drdState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                String q = "select * from district where state_id like " + drdState.SelectedValue.ToString();
                DataTable dt = DBConnection.GetDataTable(q);
                drdDist.DataSource = dt;
                drdDist.DataTextField = "district_name";
                drdDist.DataValueField = "district_id";
                drdDist.DataBind();
                drdDist.Items.Insert(0, "");

            }
            catch (Exception )
            {

            }
        }

        protected void drdDist_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                String q = "select * from taluka where district_id like " + drdDist.SelectedValue.ToString();
                DataTable dt = DBConnection.GetDataTable(q);
                drdTaluka.DataSource = dt;
                drdTaluka.DataTextField = "taluka_name";
                drdTaluka.DataValueField = "taluka_id";
                drdTaluka.DataBind();
                drdTaluka.Items.Insert(0, "");
            }
            catch (Exception)
            {


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
            catch (Exception )
            {

                            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("Insert into address (address_line_1, address_line_2, address_state, address_district, address_taluka, address_city, address_pin_code, member_id) values(?address_line_1, ?address_line_2, ?address_state, ?address_district, ?address_taluka, ?address_city, ?address_pin_code, ?member_id)", con);
            cmd.Parameters.AddWithValue("address_line_1", txtAddress1.Text);
            cmd.Parameters.AddWithValue("address_line_2", txtAddress2.Text);
            cmd.Parameters.AddWithValue("address_state", drdState.SelectedValue);
            cmd.Parameters.AddWithValue("address_district", drdDist.SelectedValue);
            cmd.Parameters.AddWithValue("address_taluka", drdTaluka.SelectedValue);
            cmd.Parameters.AddWithValue("address_city", drdCity.SelectedValue);
            cmd.Parameters.AddWithValue("address_pin_code", txtPinCode.Text);
            cmd.Parameters.AddWithValue("member_id", member_id);
            try
            {
                 con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        success.Visible = true;
                        success_message.InnerHtml = "Address inserted successfually...";
                        LoadDataList();
                    }
                    else {
                        error.Visible = true;
                        error_message.InnerHtml = "Error while inserting the address...";
                    }
                    con.Close();
            }
            catch (Exception ee)
            {
                 error.Visible = true;
                error_message.InnerHtml = ""+ee.Message;
            }
        }

        protected void dataAddress_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "delete_address")
            {
                DeleteAddress(e.CommandArgument.ToString());
            }
        }

        private void DeleteAddress(string p)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("delete from address where address_id=?address_id", con);
            cmd.Parameters.AddWithValue("?address_id", p);
            
            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
                    success_message.InnerHtml = "Address deleted successfually...";
                    LoadDataList();
                }
                else
                {
                    error.Visible = true;
                    error_message.InnerHtml = "Error while deleting the address...";
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