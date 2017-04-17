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
    public partial class WebForm4 : System.Web.UI.Page
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

        static String member_id = "";
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


                DataTable dt = DBConnection.GetDataTable("Select * from view_member_college where (member_id = " + member_id + ")");
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


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            HttpCookie myCookie = Request.Cookies["MemberCookie"];
            member_id = myCookie["memberId"].ToString();
             MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("Insert into member_college ( member_id, college_id, year_of_passing, college_type) values( ?member_id, ?college_id, ?year_of_passing, ?college_type)", con);
            cmd.Parameters.AddWithValue("?member_id", member_id);
            cmd.Parameters.AddWithValue("?college_id", drdCollegeName.SelectedValue);
            cmd.Parameters.AddWithValue("?year_of_passing", txtPassingYear.Text);
            cmd.Parameters.AddWithValue("?college_type", drdCollegeType.SelectedItem.ToString());

            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
                    success_message.InnerHtml = "College inserted successfually...";
                    LoadDataList();
                }
                else
                {
                    error.Visible = true;
                    error_message.InnerHtml = "Error while inserting the college...";
                }
                con.Close();
            }
            catch (Exception ee)
            {
                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message ;
            }
           
        }

        protected void drdState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                String q = "select * from district where state_id like " + drdState.SelectedValue.ToString();
                DataTable dt = DBConnection.GetDataTable(q);
                drdDistrict.DataSource = dt;
                drdDistrict.DataTextField = "district_name";
                drdDistrict.DataValueField = "district_id";
                drdDistrict.DataBind();
                drdDistrict.Items.Insert(0, "");

            }
            catch (Exception)
            {

            }
        }

       
        protected void drdCollegeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from college where (college_district=" + drdDistrict.SelectedValue + " and college_type='"+drdCollegeType.SelectedItem.ToString()+"')");
                drdCollegeName.DataSource = dt;

                drdCollegeName.DataValueField = "college_id";
                drdCollegeName.DataTextField = "college_name";
                drdCollegeName.DataBind();
            }
            catch (Exception)
            {
                
            }
        }

        protected void dataAddress_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName=="delete_college")
            {
                DeleteCollege(e.CommandArgument.ToString());
            }
        }

        private void DeleteCollege(string p)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("delete from member_college where ( member_college_id=?member_college_id)", con);
            cmd.Parameters.AddWithValue("?member_college_id", p);
          
            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
                    success_message.InnerHtml = "College deleted successfually...";
                    LoadDataList();
                }
                else
                {
                    error.Visible = true;
                    error_message.InnerHtml = "Error while deletion the college...";
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