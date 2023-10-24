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
    public partial class admin_dashboard : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(bool)Session["isLoggedIn"])
            {
                Response.Redirect("admin_login.aspx");
            }

            var adminID = Session["AdminID"];

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM ADMIN WHERE ID = '" + adminID + "'";

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            byte[] pic = (byte[])reader["Pic"];
                            string str = Convert.ToBase64String(pic);
                            img.ImageUrl = "data:image/jpg;base64," + str;
                            admin_name.Text = reader["FULLNAME"].ToString();
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