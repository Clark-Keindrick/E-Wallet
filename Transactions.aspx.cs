using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Reflection.Emit;
using System.Runtime.InteropServices.ComTypes;
using System.Security.Principal;

namespace E_WALLET
{
    public partial class Transactions : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";

        protected void Page_Init(object sender, EventArgs e)
        {
            to_date.Attributes.Add("max", DateTime.Now.ToString("yyyy-MM-dd"));
        }

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
                        else
                        {
                            Response.Write("<script>alert('No Records Found!') </script>");
                        }
                        reader.Close();
                    }
                }
            }

            gridTable();
        }

        protected void trans_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            var userID = Session["ClientID"];

            if(from_date.Text == null && to_date.Text == null)
            {
                Response.Write("<script>alert('Date is empty') </script>");
            }
            else
            {
                string transtype = trans_type.SelectedItem.Text.ToUpper();
                var fromdate = DateTime.Parse(from_date.Text);
                var todate = DateTime.Parse(to_date.Text);

                if (trans_type.SelectedItem != null)
                {

                    using (var db = new SqlConnection(connString))
                    {
                        db.Open();

                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "SELECT * FROM [TRANSACTION] WHERE [DATE] >= @f_date AND [DATE] < @t_date AND [USER_ID] = @userid AND [TRANSAC_TYPE] = @t_type ORDER BY [TRANSAC_TYPE] DESC";
                            cmd.Parameters.AddWithValue("@f_date", fromdate);
                            cmd.Parameters.AddWithValue("@t_date", todate.AddDays(1));
                            cmd.Parameters.AddWithValue("@userid", userID);
                            cmd.Parameters.AddWithValue("@t_type", transtype);

                            DataTable dt = new DataTable();
                            SqlDataAdapter sda = new SqlDataAdapter(cmd);
                            sda.Fill(dt);
                            Records.DataSource = dt;
                            Records.DataBind();

                            Records.Visible = true;

                        }
                    }
                }

                if (trans_type.SelectedItem.Text == "All")
                {
                    using (var db = new SqlConnection(connString))
                    {
                        db.Open();

                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "SELECT * FROM [TRANSACTION] WHERE [DATE] >= @f_date AND [DATE] < @t_date AND [USER_ID] = @userid ORDER BY [TRANSAC_TYPE] DESC";
                            cmd.Parameters.AddWithValue("@f_date", fromdate);
                            cmd.Parameters.AddWithValue("@t_date", todate.AddDays(1));
                            cmd.Parameters.AddWithValue("@userid", userID);

                            DataTable dt = new DataTable();
                            SqlDataAdapter sda = new SqlDataAdapter(cmd);
                            sda.Fill(dt);
                            Records.DataSource = dt;
                            Records.DataBind();

                            Records.Visible = true;

                        }
                    }
                }
            }

        }

        private void gridTable()
        {
            var userID = Session["ClientID"];

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd2 = db.CreateCommand())
                {
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "SELECT * FROM [Transaction] WHERE [User_ID] = @myID";

                    cmd2.Parameters.AddWithValue("@myID", userID);

                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd2);

                    sda.Fill(dt);
                    Records.DataSource = dt;
                    Records.DataBind();

                    if (Records.Rows.Count == 0)
                    {
                        gridlbl.Visible = true;
                    }
                    else
                    {
                        gridlbl.Visible = false;
                    }
                }
            }
        }
    }
}