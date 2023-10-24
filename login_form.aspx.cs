using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;

namespace E_WALLET
{
    public partial class login_form : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] != null)
            {
                Response.Redirect("Dashboard.aspx");
                return;
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string username = Username.Text;
            string password = Password.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                invalidTxt.Text = "Please fill in the fields.";
                return;
            }
            else
            {
                using(var db = new SqlConnection(connString))
                {
                    db.Open();

                    using(var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM CLIENT_INFO WHERE USERNAME = @usname AND PASSWORD = @pword AND DEACTIVATE = 0";

                        cmd.Parameters.AddWithValue("@usname", username);
                        cmd.Parameters.AddWithValue("@pword", password);

                        using(var reader = cmd.ExecuteReader())
                        {
                            if(reader.Read())
                            {
                                if (string.Equals(reader["USERNAME"].ToString(), username, StringComparison.Ordinal) &&
                                    string.Equals(reader["PASSWORD"].ToString(), password, StringComparison.Ordinal))
                                {
                                    Session["ClientID"] = reader["ID"].ToString();
                                    Session["isLoggedIn"] = true;
                                    string script = "if (confirm('Log-in Successfully!')) { window.location.href = 'Dashboard.aspx'; }";
                                    ClientScript.RegisterStartupScript(this.GetType(), "ConfirmNavigation", script, true);
                                }
                                else
                                {
                                    invalidTxt.Text = "Sorry, Invalid Account";
                                }
                            }
                            else
                            {
                                invalidTxt.Text = "Sorry, Invalid Account";
                            }
                        }
                    }
                }
            }


        }

        protected void btnsign_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonalForm.aspx");
        }
    }
}