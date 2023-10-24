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
    public partial class registerAdmin : System.Web.UI.Page
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

        protected void BTNreg_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = picUpload.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExt = Path.GetExtension(filename).ToLower();
            int filesize = postedFile.ContentLength;
            byte[] pic = new byte[filesize];
            picUpload.PostedFile.InputStream.Read(pic, 0, filesize);

            string fullname = LBLfullname.Text;
            string username = LBLuser.Text;
            string email = LBLemail.Text;
            string phnum = LBLnum.Text;
            string password = LBLpass.Text;
            string confirm = LBLconfirm.Text;

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM ADMIN WHERE USERNAME = @user_name OR EMAIL = @emailAd";

                    cmd.Parameters.AddWithValue("@user_name", username);
                    cmd.Parameters.AddWithValue("@emailAd", email);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (reader["USERNAME"].ToString().ToLower() == username.ToLower())
                            {
                                userexist.Text = "Username already exist";
                                return;
                            }

                            else if (reader["PHONE"].ToString().Equals(phnum, StringComparison.InvariantCultureIgnoreCase))
                            {
                                numexist.Text = "Phone Number already exists";
                                return;
                            }

                            else if (reader["EMAIL"].ToString().ToLower() == email.ToLower())
                            {
                                Validator1.ErrorMessage = "Email already exists";
                                Validator1.IsValid = false;
                                return;
                            }
                        }
                    }
                }

                if (fileExt == ".bmp" || fileExt == ".jpg" || fileExt == ".png" || fileExt == ".jpeg")
                {
                    if(password == confirm)
                    {
                        using (var cmd2 = db.CreateCommand())
                        {
                            cmd2.CommandType = CommandType.Text;
                            cmd2.CommandText = "INSERT INTO ADMIN(FULLNAME, USERNAME, PASSWORD, EMAIL, PHONE, PIC, GENDER) VALUES (@fname, @uname, @pword, @emailAD, @mobile, @photo, @gen)";

                            cmd2.Parameters.AddWithValue("@fname", fullname);
                            cmd2.Parameters.AddWithValue("@uname", username);
                            if (dot_1.Checked == true)
                            {
                                cmd2.Parameters.AddWithValue("@gen", "Male");
                            }
                            else if (dot_2.Checked == true)
                            {
                                cmd2.Parameters.AddWithValue("@gen", "Female");
                            }
                            else
                            {
                                cmd2.Parameters.AddWithValue("@gen", "N/A");
                            }
                            cmd2.Parameters.AddWithValue("@mobile", phnum);
                            cmd2.Parameters.AddWithValue("@emailAD", email);
                            cmd2.Parameters.AddWithValue("@pword", password);
                            cmd2.Parameters.AddWithValue("@photo", pic);

                            var ctr = cmd2.ExecuteNonQuery();

                            if (ctr >= 1)
                            {
                                string script = "if (confirm('Registered Successfully!')) { window.location.href = 'admin_login.aspx'; }";
                                ClientScript.RegisterStartupScript(this.GetType(), "ConfirmNavigation", script, true);
                            }
                            else
                            {
                                Response.Write("<script> alert('Record is not saved!') </script>");
                            }
                        }
                    }
                    else
                    {
                        XPass.Text = "Password doesn't match!!!";
                    }
                    
                }
                else
                {
                    Response.Write("<script> alert('File is not valid!') </script>");
                }
            }
        }
    }
}