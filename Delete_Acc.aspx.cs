using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace E_WALLET
{
    public partial class Delete_Acc : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            var userID = Session["ClientID"];

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM CLIENT_INFO WHERE ID = '" + userID + "'";

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            byte[] pic = (byte[])reader["Pic"];
                            string str = Convert.ToBase64String(pic);
                            img.ImageUrl = "data:image/jpg;base64," + str;
                            userid.Text = Session["ClientID"].ToString();
                            lbl_btm_name.Text = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
                        }
                    }
                }
            }
        }

        protected void Btn_del_Click(object sender, EventArgs e)
        {
            var userID = Session["ClientID"];

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "DELETE FROM CLIENT_INFO WHERE ID = '" + userID + "'";

                    cmd.ExecuteNonQuery();
                }
            }

            Session.Abandon();
            Response.Redirect("login_form.aspx");
        }

        protected void Btn_deac_Click(object sender, EventArgs e)
        {
            var userID = Session["ClientID"];

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE CLIENT_INFO SET DEACTIVATE = 1 WHERE ID = @userid";

                    cmd.Parameters.AddWithValue("@userid", userID);

                    cmd.ExecuteNonQuery();
                }
            }

            Session.Abandon();
            Response.Redirect("login_form.aspx");
        }
    }
}