using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_WALLET
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(bool)Session["isLoggedIn"])
            {
                Response.Redirect("login_form.aspx");
            }

            var userID = Session["ClientID"];

            using(var db = new SqlConnection(connString))
            {
                db.Open();

                using(var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM CLIENT_INFO WHERE ID = '" + userID + "'";

                    using(var reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            byte[] pic = (byte[])reader["Pic"];
                            string str = Convert.ToBase64String(pic);
                            profile_pic.ImageUrl = "data:image/jpg;base64," + str;
                            img.ImageUrl = "data:image/jpg;base64," + str;
                            userid.Text = Session["ClientID"].ToString();
                            lbl_btm_name.Text = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
                            clientName.Text = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
                            accnum.Text = reader["ID"].ToString();
                            date_reg.Text = reader["DATE_REGISTERED"].ToString();
                            curr_bal.Text = "₱" + reader["BALANCE"].ToString();
                            total_sent.Text = "₱" + reader["TOTAL_SENT"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Records Found!') </script>");
                        }
                    }
                }
            }
        }
    }
}