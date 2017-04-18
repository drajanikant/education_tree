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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                String mem_id=Request.QueryString["mem_id"].ToString();
                LoadGeneralInfo(mem_id);
                LoadAddress(mem_id);
                LoadCollege(mem_id);
                LoadSocial(mem_id);
            }
        }

        private void LoadSocial(string mem_id)
        {
            try
            {
                  DataTable dt = DBConnection.GetDataTable("Select * from social_links where (member_id = " + mem_id + ")");
                dataSocial.DataSource = dt;
                dataSocial.DataBind();

            }
            catch (Exception)
            {
                throw;
            }
        }

        private void LoadCollege(string mem_id)
        {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from view_member_college where (member_id = " + mem_id + ")");
                dataCollege.DataSource = dt;
                dataCollege.DataBind();

            }
            catch (Exception)
            {
                throw;
            }
        }

        private void LoadAddress(string mem_id)
        {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from view_address where (member_id = " + mem_id + ")");
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

        private void LoadGeneralInfo(string mem_id)
        {
            try
            {
                DataTable dt = DBConnection.GetDataTable("Select * from member where (member_id = " + mem_id + ")");
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