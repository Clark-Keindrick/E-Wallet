using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;
using System.Web.DynamicData;

namespace E_WALLET
{
    public partial class Send_money : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            view_account.Visible = false;
            view_inputs.Visible = false;

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
                            Session["Balance_amt"] = reader["BALANCE"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Records Found!') </script>");
                        }
                    }
                }
            }
      
        }

        protected void Btn_confirm_Click(object sender, EventArgs e)
        {
            var recipientID = send_userID.Text;
            var userID = Session["ClientID"];
            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM CLIENT_INFO WHERE ID = '" + recipientID + "'";

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            invalid_id.Text = "";
                            lbl_Xpass.Text = "";
                            send_amount.Text = "";
                            lbl_password.Text = "";
                            if (string.Equals(reader["ID"].ToString(), userID.ToString(), StringComparison.Ordinal))
                            {
                                invalid_id.Text = "You can't Send to Your Self!";
                            }
                            else
                            {
                                view_account.Visible = true;
                                view_inputs.Visible = true;
                                prof_fullname.Text = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
                                prof_acc_num.Text = reader["ID"].ToString();
                            }
                        }
                        else
                        {
                            invalid_id.Text = "Invalid User ID!";
                        }
                    }

                }
            }

        }

        protected void Btn_send_money_Click(object sender, EventArgs e)
        {
            string confirmpass = lbl_password.Text;
            double Myamount = Convert.ToDouble(send_amount.Text);
            double myBAL = Convert.ToDouble(Session["Balance_amt"].ToString());
            string RecipientID = send_userID.Text;
            var userID = Session["ClientID"];

            if(IsPostBack)
            {
                view_account.Visible = false;
                view_inputs.Visible = false;

                if (Myamount % 100 != 0)
                {
                    Response.Write("<script>alert('No coins allowed!');</script>");
                }
                else
                {
                    if (Myamount > myBAL)
                    {
                        Response.Write("<script>alert('Insufficient Balance!');</script>");
                    }
                    else
                    {
                        using (var db = new SqlConnection(connString))
                        {
                            db.Open();

                            using (var cmd = db.CreateCommand())
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "SELECT * FROM CLIENT_INFO WHERE ID = @id AND PASSWORD = @pword";

                                cmd.Parameters.AddWithValue("@id", userID);
                                cmd.Parameters.AddWithValue("@pword", confirmpass);

                                using (var reader = cmd.ExecuteReader())
                                {
                                    if (reader.Read())
                                    {
                                        lbl_Xpass.Text = "";
                                        using (var cmd2 = db.CreateCommand())
                                        {
                                            cmd2.CommandType = CommandType.Text;
                                            cmd2.CommandText = "UPDATE CLIENT_INFO SET BALANCE -= @amt, TOTAL_SENT = TOTAL_SENT + @amt WHERE ID = @userId";
                                            cmd2.Parameters.AddWithValue("@amt", Myamount);
                                            cmd2.Parameters.AddWithValue("@userId", userID);

                                            reader.Close();
                                            int ctr = cmd2.ExecuteNonQuery();

                                            if (ctr > 0)
                                            {

                                                Response.Write("<script>alert('Send successfully!!');</script>");
                                            }
                                            else
                                            {
                                                Response.Write("<script>alert('Failed to Send!!');</script>");

                                            }
                                        }
                                        using (var cmd3 = db.CreateCommand())
                                        {
                                            cmd3.CommandType = CommandType.Text;
                                            cmd3.CommandText = "UPDATE CLIENT_INFO SET BALANCE += @MYamt WHERE ID = @repId";
                                            cmd3.Parameters.AddWithValue("@MYamt", Myamount);
                                            cmd3.Parameters.AddWithValue("@repId", RecipientID);
                                            cmd3.ExecuteNonQuery();
                                        }

                                        using (var cmd4 = db.CreateCommand())
                                        {
                                            cmd4.CommandType = CommandType.Text;
                                            cmd4.CommandText = "INSERT INTO [Transaction] ([Amount], [Date], [Transac_type], [User_ID]) VALUES(@amnt, @t_date, @T_type, @MyId)";

                                            cmd4.Parameters.AddWithValue("@amnt", Myamount);
                                            cmd4.Parameters.AddWithValue("@t_date", DateTime.Now);
                                            cmd4.Parameters.AddWithValue("@T_type", "SENT");
                                            cmd4.Parameters.AddWithValue("@MyId", userID);

                                            cmd4.ExecuteNonQuery();
                                        }

                                        using (var cmd5 = db.CreateCommand())
                                        {
                                            cmd5.CommandType = CommandType.Text;
                                            cmd5.CommandText = "INSERT INTO [Transaction] ([Amount], [Date], [Transac_type], [User_ID]) VALUES(@amnt, @t_date, @T_type, @MyId)";

                                            cmd5.Parameters.AddWithValue("@amnt", Myamount);
                                            cmd5.Parameters.AddWithValue("@t_date", DateTime.Now);
                                            cmd5.Parameters.AddWithValue("@T_type", "RECIEVED");
                                            cmd5.Parameters.AddWithValue("@MyId", RecipientID);

                                            cmd5.ExecuteNonQuery();
                                        }
                                    }
                                else
                                    {
                                        lbl_Xpass.Text = "Wrong Password";
                                    }
                                }

                            }
                        }
                    }
                }
              
            }
        }
    }
}