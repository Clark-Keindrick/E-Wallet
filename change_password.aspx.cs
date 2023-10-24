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
    public partial class change_password : System.Web.UI.Page
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
                        }
                    }
                }
            }
        }

        protected void Btn_save_pass_Click(object sender, EventArgs e)
        {
            var userID = Session["ClientID"];
            string newpassword = new_pass.Text;
            string oldpassword = old_pass.Text;
            string confirmpass = confirm_new_pass.Text;

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM CLIENT_INFO WHERE ID = '" + userID + "' AND PASSWORD = @oldpass";

                    cmd.Parameters.AddWithValue("@oldpass", oldpassword);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lbl_wrongpass.Text = " ";
                            if (newpassword != null)
                            {
                                reader.Close();
                                if (newpassword != oldpassword)
                                {
                                    if(newpassword == confirmpass)
                                    {
                                        using(var cmd2 =  db.CreateCommand())
                                        {
                                            cmd2.CommandType = CommandType.Text;
                                            cmd2.CommandText = "UPDATE CLIENT_INFO SET PASSWORD = @newpass WHERE ID = @clientid";

                                            cmd2.Parameters.AddWithValue("@newpass", confirmpass);
                                            cmd2.Parameters.AddWithValue("@clientid", userID);

                                            int ctr = cmd2.ExecuteNonQuery();

                                            if (ctr > 0)
                                            {
                                                Response.Write("<script>alert('Password changed successfully!!');</script>");
                                                Response.Redirect("Profile.aspx");
                                            }
                                            else
                                            {
                                                Response.Write("<script>alert('Password changed unsuccessfully!!');</script>");
                                                return;
                                            }
                                        }
                                    }
                                    else
                                    {
                                        lbl_Xmatch.Text = "Password didn't match!!!";
                                    }

                                }
                                else
                                {
                                    lbl_Xmatch.Text = "New Password must not be the same with Old Password";
                                }
                            }
                            else
                            {
                                lbl_Xmatch.Text = "Please fill a new password";
                            }
                        }
                        else
                        {
                            lbl_wrongpass.Text = "Wrong Password, Try Again!";
                        }
                    }
                }
            }
        }
    }
}