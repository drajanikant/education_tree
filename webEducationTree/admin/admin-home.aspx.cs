using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webEducationTree.admin
{
    public partial class admin_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                admin_name.InnerHtml=myCookie["adminName"].ToString();
            }
        }
    }
}