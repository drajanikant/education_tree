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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                error.Visible = false;
                success.Visible = false;
                LoadData();

            }
        }
        String member_id = "";
        private void LoadData() {
            try
            {
                
                DataRow dr = DBConnection.GetDataRow("Select * from member where (member_id='"+member_id+"')");
                if (dr!=null)
                {
                    txtMemberName.Text=dr["member_name"].ToString();
                    txtDob.Text = dr["member_dob"].ToString();
                    drdGender.SelectedValue = dr["member_gender"].ToString();
                    txtEmail.Text = dr["member_email"].ToString();
                    txtMobile.Text = dr["member_mobile"].ToString();
                    txtEducationType.Text = dr["education_type"].ToString();
                    drdJobType.SelectedValue = dr["job_type"].ToString();
                    txtCompanyName.Text = dr["company_name"].ToString();
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
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
                member_id=myCookie["memberId"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
          
                MySqlConnection con = new MySqlConnection(DBConnection.ConnectString);
                MySqlCommand cmd = new MySqlCommand("UPDATE member set member_name=?member_name, member_dob=?member_dob, member_gender=?member_gender, member_email=?member_email, member_mobile=?member_mobile, education_type=?education_type, job_type=?job_type, company_name=?company_name where member_id=?member_id", con);
                cmd.Parameters.AddWithValue("member_name", txtMemberName.Text);
                cmd.Parameters.AddWithValue("member_dob", txtDob.Text);
                cmd.Parameters.AddWithValue("member_gender", drdGender.Text);
                cmd.Parameters.AddWithValue("member_email", txtEmail.Text);
                cmd.Parameters.AddWithValue("member_mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("education_type", txtEducationType.Text);
                cmd.Parameters.AddWithValue("job_type", drdJobType.Text);
                cmd.Parameters.AddWithValue("company_name", txtCompanyName.Text);
                cmd.Parameters.AddWithValue("member_id",member_id);
                try
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        success.Visible = true;
                    }
                    else {
                        error.Visible = false;
                    }
                    con.Close();
            }
            catch (Exception ee)
            {
                error.Visible = true;
                error_message.InnerHtml = ""+ee.Message;
                
            }
        }
    }
}