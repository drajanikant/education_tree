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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
               
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


                DataTable dt = DBConnection.GetDataTable("Select * from social_links where (member_id = " + member_id + ")");
                dataAddress.DataSource = dt;
                dataAddress.DataBind();

            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            HttpCookie myCookie = Request.Cookies["MemberCookie"];
            member_id = myCookie["memberId"].ToString();
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("Insert into social_links (  member_id, site_name, social_address) values(  ?member_id, ?site_name, ?social_address)", con);
            cmd.Parameters.AddWithValue("?member_id", member_id);
            cmd.Parameters.AddWithValue("?site_name", drdLinkName.Text);
            cmd.Parameters.AddWithValue("?social_address", txtLink.Text);
      
            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
                    success_message.InnerHtml = "Link inserted successfually...";
                    LoadDataList();
                }
                else
                {
                    error.Visible = true;
                    error_message.InnerHtml = "Error while inserting the link...";
                }
                con.Close();
            }
            catch (Exception ee)
            {
                error.Visible = true;
                error_message.InnerHtml = "" + ee.Message;
            }
          
        }

        protected void dataAddress_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName=="delete_link")
            {
                DeleteLink(e.CommandArgument.ToString());
            }
        }

        private void DeleteLink(string p)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("delete from social_links where ( social_link_id=?social_link_id)", con);
            cmd.Parameters.AddWithValue("?social_link_id", p);

            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
                    success_message.InnerHtml = "Link deleted successfually...";
                    LoadDataList();
                }
                else
                {
                    error.Visible = true;
                    error_message.InnerHtml = "Error while deletion the link...";
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