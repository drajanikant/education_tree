using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using webEducationTree.utility;

namespace webEducationTree
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                alert.Visible = false;
                CheckCookies();
            }
        }

        private void CheckCookies()
        {
            HttpCookie myCookie = Request.Cookies["AdminCookie"];
            if (myCookie != null)
            {
                Response.Redirect("admin/admin-home.aspx");
            }
            myCookie = null;
            myCookie = Request.Cookies["MemberCookie"];
            if (myCookie != null)
            {
                Response.Redirect("member/member-home.aspx");
            }

        }



        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (drdType.SelectedItem.ToString().Equals("Admin"))
            {
                try
                {
                    DataRow dr = null;
                    dr = DBConnection.GetDataRow("select * from admin where admin_email='" + txtUserEmail.Text + "' and admin_pass='" + txtUserPass.Text + "'");
                    if (dr != null)
                    {
                        String adminId = dr["admin_id"].ToString();
                        String adminName = dr["admin_name"].ToString();
                        String adminEmail = dr["admin_email"].ToString();

                        HttpCookie myCookie = new HttpCookie("AdminCookie");

                        myCookie.Values.Add("adminId", adminId);
                        myCookie.Values.Add("adminName", adminName);
                        myCookie.Values.Add("adminEmail", adminEmail);
                        if (chbRemember.Checked)
                        {
                            myCookie.Expires = DateTime.Now.AddHours(3);
                        }
                        Response.Cookies.Add(myCookie);
                        Response.Redirect("admin/admin-home.aspx");
                    }
                    else
                    {
                        alert.Visible = true;
                    }
                }
                catch(Exception ee){
                    alert.Visible = true;
                    error_message.InnerText = ""+ee.Message;
                }
            }
            else if (drdType.SelectedItem.ToString().Equals("Member"))
            {
                try
                {

                    DataRow dr = null;
                    dr = DBConnection.GetDataRow("select * from member where member_email='" + txtUserEmail.Text + "' and password='" + txtUserPass.Text + "'");
                    if (dr != null)
                    {
                        String memberId = dr["member_id"].ToString();
                        String memberName = dr["member_name"].ToString();
                        String memberEmail = dr["member_email"].ToString();

                        HttpCookie myCookie = new HttpCookie("MemberCookie");

                        myCookie.Values.Add("memberId", memberId);
                        myCookie.Values.Add("memberName", memberName);
                        myCookie.Values.Add("memberEmail", memberEmail);
                        if (chbRemember.Checked)
                        {
                            myCookie.Expires = DateTime.Now.AddHours(3);
                        }
                        Response.Cookies.Add(myCookie);
                        Response.Redirect("member/member-home.aspx");
                    }
                    else
                    {
                        alert.Visible = true;
                    }
                }
                catch (Exception ee)
                {
                    alert.Visible = true;
                    error_message.InnerText = "" + ee.Message;
                }  
            }
        }
    }
}