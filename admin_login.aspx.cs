using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_WALLET
{
    public partial class admin_login : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";
        
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] != null)
            {
                Response.Redirect("admin_dashboard.aspx");
                return;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] != null)
            {
                Response.Redirect("admin_dashboard.aspx");
                return;
            }
        }

        protected void BTNsubmit_Click(object sender, EventArgs e)
        {
            string Uname = username.Text;
            string Pword = password.Text;

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM ADMIN WHERE USERNAME = @usname AND PASSWORD = @pword";

                    cmd.Parameters.AddWithValue("@usname", Uname);
                    cmd.Parameters.AddWithValue("@pword", Pword);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (string.Equals(reader["USERNAME"].ToString(), Uname, StringComparison.Ordinal) &&
                                string.Equals(reader["PASSWORD"].ToString(), Pword, StringComparison.Ordinal))
                            {
                                Session["AdminID"] = reader["ID"].ToString();
                                Session["isLoggedIn"] = true;
                                string script = "if (confirm('Log-in Successfully!')) { window.location.href = 'admin_dashboard.aspx'; }";
                                ClientScript.RegisterStartupScript(this.GetType(), "ConfirmNavigation", script, true);
                            }
                            else
                            {
                                Response.Write("<script>alert('Sorry, Invalid Account!') </script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Sorry, Invalid Account!') </script>");
                        }
                    }
                }
            }
        }
    }
}