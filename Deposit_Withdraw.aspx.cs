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

namespace E_WALLET
{
    public partial class Deposit_Withdraw : System.Web.UI.Page
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
                            myprofile.ImageUrl = "data:image/jpg;base64," + str;
                            img.ImageUrl = "data:image/jpg;base64," + str;
                            userid.Text = Session["ClientID"].ToString();
                            lbl_btm_name.Text = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
                            prof_fullname.Text = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
                            prof_acc_num.Text = reader["ID"].ToString();
                            lbl_balance.Text = "₱" + reader["BALANCE"].ToString();
                            Session["Balance_amt"] = reader["BALANCE"].ToString();

                        }
                    }

                }
            }
         
        }

        protected void amount_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Btn_withdraw2_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                var myID = Session["ClientID"];
                double Myamount = Convert.ToDouble(amount.Text);
                string mybal2 = Session["Balance_amt"].ToString();
                double mybal = Convert.ToDouble(mybal2);

                if (Myamount % 100 != 0)
                {
                    Response.Write("<script>alert('We cannot provide coins!');</script>");
                }
                else
                {
                    if (Myamount > mybal)
                    {
                        Response.Write("<script>alert('Insufficient Amount!');</script>");
                    }
                    else
                    {
                        using (var db = new SqlConnection(connString))
                        {
                            db.Open();

                            using (var cmd = db.CreateCommand())
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "UPDATE CLIENT_INFO SET BALANCE -= @bal WHERE ID = '" + myID + "'";

                                cmd.Parameters.AddWithValue("@bal", Myamount);

                                var ctr = cmd.ExecuteNonQuery();

                                if (ctr > 0)
                                {
                                    Response.Write("<script>alert('Withdraw Successfully');</script>");
                                }
                                else
                                {
                                    Response.Write("<script>alert('Sorry, Failed to withdraw');</script>");
                                }
                            }

                            using (var cmd2 = db.CreateCommand())
                            {
                                cmd2.CommandType = CommandType.Text;
                                cmd2.CommandText = "INSERT INTO [Transaction] ([Amount], [Date], [Transac_type], [User_ID]) VALUES(@amnt, @t_date, @T_type, @MyId)";

                                cmd2.Parameters.AddWithValue("@amnt", Myamount);
                                cmd2.Parameters.AddWithValue("@t_date", DateTime.Now);
                                cmd2.Parameters.AddWithValue("@T_type", "WITHDRAW");
                                cmd2.Parameters.AddWithValue("@MyId", myID);

                                cmd2.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }
        }

        protected void Btn_deposit2_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                var myID = Session["ClientID"];
                double Myamount = Convert.ToDouble(amount.Text);
                string mybal2 = Session["Balance_amt"].ToString();
                double mybal = Convert.ToDouble(mybal2);
                double tot_bal = Myamount + mybal;

                if (Myamount % 100 != 0)
                {
                    Response.Write("<script>alert('No coins allowed!');</script>");
                }
                else
                {
                    if (tot_bal > 50000.00)
                    {
                        Response.Write("<script>alert('You already reached the maximum balance!');</script>");
                    }
                    else
                    {
                        using (var db = new SqlConnection(connString))
                        {
                            db.Open();

                            using (var cmd = db.CreateCommand())
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "UPDATE CLIENT_INFO SET BALANCE += @bal WHERE ID = '" + myID + "'";

                                cmd.Parameters.AddWithValue("@bal", Myamount);

                                var ctr = cmd.ExecuteNonQuery();

                                if (ctr > 0)
                                {
                                    Response.Write("<script>alert('Deposit Successfully');</script>");
                                }
                                else
                                {
                                    Response.Write("<script>alert('Sorry, Failed to deposit');</script>");
                                }

                            }

                            using (var cmd2 = db.CreateCommand())
                            {
                                cmd2.CommandType = CommandType.Text;
                                cmd2.CommandText = "INSERT INTO [Transaction] ([Amount], [Date], [Transac_type], [User_ID]) VALUES(@amnt, @t_date, @T_type, @MyId)";

                                cmd2.Parameters.AddWithValue("@amnt", Myamount);
                                cmd2.Parameters.AddWithValue("@t_date", DateTime.Now);
                                cmd2.Parameters.AddWithValue("@T_type", "DEPOSIT");
                                cmd2.Parameters.AddWithValue("@MyId", myID);

                                cmd2.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }

        }
    }
}