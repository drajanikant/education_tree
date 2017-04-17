using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webEducationTree
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["AdminCookie"] != null)
            {
                Response.Cookies["AdminCookie"].Expires = DateTime.Now.AddDays(-1);
            }
            if (Request.Cookies["MemberCookie"] != null)
            {
                Response.Cookies["MemberCookie"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Redirect("login.aspx");
        }
    }
}