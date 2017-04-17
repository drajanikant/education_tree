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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                LoadGeneralInfo();
                LoadAddress();
                LoadCollege();
                LoadSocial();
            }
        }

        private void LoadSocial()
        {
            try
            {
                HttpCookie myCookie = Request.Cookies["MemberCookie"];
                member_id = myCookie["memberId"].ToString();


                DataTable dt = DBConnection.GetDataTable("Select * from social_links where (member_id = " + member_id + ")");
                dataSocial.DataSource = dt;
                dataSocial.DataBind();

            }
            catch (Exception)
            {
                throw;
            }
        }

        private void LoadCollege()
        {
            try
            {
                HttpCookie myCookie = Request.Cookies["MemberCookie"];
                member_id = myCookie["memberId"].ToString();


                DataTable dt = DBConnection.GetDataTable("Select * from view_member_college where (member_id = " + member_id + ")");
                dataCollege.DataSource = dt;
                dataCollege.DataBind();

            }
            catch (Exception)
            {
                throw;
            }
        }

        private void LoadAddress()
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

        private void LoadGeneralInfo()
        {
            try
            {
                HttpCookie myCookie = Request.Cookies["MemberCookie"];
                member_id = myCookie["memberId"].ToString();


                DataTable dt = DBConnection.GetDataTable("Select * from member where (member_id = " + member_id + ")");
                dataGeneral.DataSource = dt;
                dataGeneral.DataBind();

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}