using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_WALLET
{
    public partial class admin_out : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_yes_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login_form.aspx");
        }

        protected void Btn_no_Click(object sender, EventArgs e)
        {
           Response.Redirect("admin_dashboard.aspx");
        }
    }
}