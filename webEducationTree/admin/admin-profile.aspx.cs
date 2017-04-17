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
    public partial class admin_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
                LoadData();
            }
        }
        private void LoadData()
        {

            HttpCookie myCookie = Request.Cookies["AdminCookie"];
            if (myCookie == null)
            {
                Response.Redirect("../logout.aspx");
            }
            else
            {
                admin_name.InnerHtml = myCookie["adminName"].ToString();
                String admin_id = myCookie["adminId"].ToString();
                try
                {
                    DataRow dr = null;
                    dr = DBConnection.GetDataRow("Select * from admin where (admin_id=" + admin_id + ")");
                    txtAdminId.Text = dr["admin_id"].ToString();
                    txtAdminName.Text = dr["admin_name"].ToString();
                    txtAdminEmail.Text = dr["admin_email"].ToString();
                    txtContact.Text = dr["admin_contact"].ToString();

                }
                catch (Exception)
                {


                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (btnEdit.Text.Equals("Edit"))
            {
                txtAdminName.ReadOnly = false;
                txtAdminEmail.ReadOnly = false;
                txtContact.ReadOnly = false;
                btnEdit.Text = "Update";
            }
            else if (btnEdit.Text.Equals("Update"))
            {
                HttpCookie myCookie = Request.Cookies["AdminCookie"];
                String admin_id = myCookie["adminId"].ToString();
                MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
                MySqlCommand cmd = new MySqlCommand("Update admin set admin_name=?admin_name,admin_email=?admin_email,admin_contact=?admin_contact where (admin_id=?admin_id)", con);
                cmd.Parameters.AddWithValue("?admin_name", txtAdminName.Text);
                cmd.Parameters.AddWithValue("?admin_email", txtAdminEmail.Text);
                cmd.Parameters.AddWithValue("?admin_id", txtAdminId.Text);
                cmd.Parameters.AddWithValue("?admin_contact", txtContact.Text);
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
                    con.Close();
                }
                catch (Exception ee)
                {
                    error.Visible = true;
                    error_msg.InnerHtml = "" + ee.Message;
                }
                finally
                {
                    if (con != null)
                    {
                        con.Close();
                        con.Dispose();
                    }
                    if (cmd != null)
                    {
                        cmd.Dispose();
                    }
                }
                btnEdit.Text = "Edit";
                txtAdminName.ReadOnly = true;
                txtAdminEmail.ReadOnly = true;
                txtContact.ReadOnly = true;
            }
        }
    }
}