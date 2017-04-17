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
    public partial class list_college : System.Web.UI.Page
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
                drdState.Items.Insert(0, "");

            }
            catch (Exception)
            {

            }

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadDataList();
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

        private void LoadDataList() {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from view_college where (district_id='" + drdDistrict.SelectedValue.ToString() + "' and college_type='" + drdCollegeType.SelectedItem.ToString() + "')");
                dataCollegeName.DataSource = dt;
                dataCollegeName.DataBind();

            }
            catch (Exception)
            {

            }
        }
        protected void dataCollegeName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dataCollegeName_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit_college")
            {
                Response.Redirect("update_college.aspx?college_id=" + e.CommandArgument.ToString());   
            }
            else if (e.CommandName == "delete_college")
            {
                DeleteCollege(e.CommandArgument.ToString());
            }
        }

        private void DeleteCollege(string college_id)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("delete from college where(college_id=?college_id)",con);
            cmd.Parameters.AddWithValue("?college_id", college_id);
            try
            {
                con.Open();
                int res=cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
                    LoadDataList();
                }
                else {
                    error.Visible = true;
                }
                con.Close();
            }
            catch (Exception ee)
            {
                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message.ToString();
            }
        }
    }
}