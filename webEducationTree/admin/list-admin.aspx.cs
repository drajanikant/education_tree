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
    public partial class list_admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
                LoadDataList();
            }
            CheckCookies();
        }
        string admin_id = "";
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

        private void LoadDataList()
        {
            try
            {
                HttpCookie myCookie = Request.Cookies["AdminCookie"];
                admin_id = myCookie["adminId"].ToString();
                DataTable dt = DBConnection.GetDataTable("Select * from admin where (admin_id != "+admin_id+")");
                dataAdminName.DataSource = dt;
                dataAdminName.DataBind();

            }
            catch (Exception)
            {

            }
        }

        protected void dataAdminName_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit_admin")
            {
                Response.Redirect("update-admin.aspx?admin_id=" + e.CommandArgument.ToString());
            }
            else if (e.CommandName == "delete_admin")
            {
                DeleteAdmin(e.CommandArgument.ToString());
            }
        }

        private void DeleteAdmin(string admin_id)
        {
            MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
            MySqlCommand cmd = new MySqlCommand("delete from admin where(admin_id=?admin_id)", con);
            cmd.Parameters.AddWithValue("?admin_id", admin_id);
            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    success.Visible = true;
                    LoadDataList();
                }
                else
                {
                    error.Visible = true;
                }
                con.Close();
            }
            catch (Exception ee)
            {
                error.Visible = true;
                error_msg.InnerHtml = "" + ee.Message.ToString();
            }
        }
    }
}