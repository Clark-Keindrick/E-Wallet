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
    public partial class Profile : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
                                prof_fullname.Text = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
                                prof_acc_num.Text = reader["ID"].ToString();
                                prof_fname.Text = reader["FIRSTNAME"].ToString();
                                prof_suffix.Text = reader["SUFFIX"].ToString();
                                prof_lname.Text = reader["LASTNAME"].ToString();
                                prof_midname.Text = reader["MID_NAME"].ToString();
                                prof_gender.SelectedItem.Text = reader["GENDER"].ToString();
                                prof_dob.Text = ((DateTime)reader["DOB"]).ToString("yyyy-MM-dd");
                                prof_house_no.Text = reader["HOUSE_NO"].ToString();
                                prof_subdi.Text = reader["SUBDI_VILLAGE"].ToString();
                                prof_street.Text = reader["STREET"].ToString();
                                prof_barangay.Text = reader["BARANGAY"].ToString();
                                prof_city.Text = reader["CITY_MUNICIPALITY"].ToString();
                                prof_country.Text = reader["COUNTRY"].ToString();
                                prof_province.Text = reader["PROVINCE"].ToString();
                                prof_zip.Text = reader["ZIP_CODE"].ToString();
                                prof_mobile.Text = reader["MOBILE_NO"].ToString();
                                img.ImageUrl = "data:image/jpg;base64," + str;
                                userid.Text = Session["ClientID"].ToString();
                                lbl_btm_name.Text = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();

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

        protected void Btn_edit_Click(object sender, EventArgs e)
        {
            change_pic.Enabled = true;
            prof_fname.Enabled = true;
            prof_suffix.Enabled = true;
            prof_lname.Enabled = true;
            prof_midname.Enabled = true;
            prof_gender.Enabled = true;
            prof_dob.Enabled = true;
            prof_house_no.Enabled = true;
            prof_subdi.Enabled = true;
            prof_street.Enabled = true;
            prof_barangay.Enabled = true;
            prof_city.Enabled = true;
            prof_province.Enabled = true;
            prof_country.Enabled = true;
            prof_zip.Enabled = true;
            prof_mobile.Enabled = true;
            Btn_save.Enabled = true;

        }

        protected void Btn_save_Click(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                var clientID = Session["ClientID"];
                HttpPostedFile postedFile = change_pic.PostedFile;

                using (var db = new SqlConnection(connString))
                {
                    db.Open();

                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM CLIENT_INFO WHERE ID = '" + clientID + "'";

                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                using (var cmd2 = db.CreateCommand())
                                {
                                    cmd2.CommandType = CommandType.Text;
                                    cmd2.CommandText = "UPDATE CLIENT_INFO SET ";

                                    List<string> updateset = new List<string>();

                                    if (postedFile != null && postedFile.ContentLength > 0)
                                    {
                                        byte[] pic = new byte[postedFile.ContentLength];
                                        change_pic.PostedFile.InputStream.Read(pic, 0, postedFile.ContentLength);
                                        cmd2.Parameters.AddWithValue("@pic", pic);
                                        updateset.Add("PIC = @pic");
                                    }

                                    if (!string.IsNullOrEmpty(prof_fname.Text) || !string.Equals(reader["FIRSTNAME"].ToString(), prof_fname.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@fname", prof_fname.Text);
                                        updateset.Add("FIRSTNAME = @fname");
                                    }

                                    if (!string.IsNullOrEmpty(prof_suffix.Text) || !string.Equals(reader["SUFFIX"].ToString(), prof_suffix.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@suf", prof_suffix.Text);
                                        updateset.Add("SUFFIX = @suf");
                                    }

                                    if (!string.IsNullOrEmpty(prof_lname.Text) || !string.Equals(reader["LASTNAME"].ToString(), prof_lname.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@lname", prof_lname.Text);
                                        updateset.Add("LASTNAME = @lname");
                                    }

                                    if (!string.IsNullOrEmpty(prof_midname.Text) || !string.Equals(reader["MID_NAME"].ToString(), prof_midname.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@mid", prof_midname.Text);
                                        updateset.Add("MID_NAME = @mid");
                                    }

                                    if (!string.IsNullOrEmpty(prof_gender.Text) || !string.Equals(reader["GENDER"].ToString(), prof_gender.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@gender", prof_gender.Text);
                                        updateset.Add("GENDER = @gender");
                                    }

                                    if (!string.IsNullOrEmpty(prof_dob.Text) || !string.Equals(reader["DOB"].ToString(), prof_dob.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@dob", prof_dob.Text);
                                        updateset.Add("DOB = @dob");
                                    }

                                    if (!string.IsNullOrEmpty(prof_house_no.Text) || !string.Equals(reader["HOUSE_NO"].ToString(), prof_house_no.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@h_num", prof_house_no.Text);
                                        updateset.Add("HOUSE_NO = @h_num");
                                    }

                                    if (!string.IsNullOrEmpty(prof_subdi.Text) || !string.Equals(reader["SUBDI_VILLAGE"].ToString(), prof_subdi.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@subdi", prof_subdi.Text);
                                        updateset.Add("SUBDI_VILLAGE = @subdi");
                                    }


                                    if (!string.IsNullOrEmpty(prof_street.Text) || !string.Equals(reader["STREET"].ToString(), prof_street.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@strt", prof_street.Text);
                                        updateset.Add("STREET = @strt");
                                    }

                                    if (!string.IsNullOrEmpty(prof_barangay.Text) || !string.Equals(reader["BARANGAY"].ToString(), prof_barangay.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@brgy", prof_barangay.Text);
                                        updateset.Add("BARANGAY = @brgy");
                                    }

                                    if (!string.IsNullOrEmpty(prof_city.Text) || !string.Equals(reader["CITY_MUNICIPALITY"].ToString(), prof_city.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@city", prof_city.Text);
                                        updateset.Add("CITY_MUNICIPALITY = @city");
                                    }

                                    if (!string.IsNullOrEmpty(prof_province.Text) || !string.Equals(reader["PROVINCE"].ToString(), prof_province.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@prov", prof_province.Text);
                                        updateset.Add("PROVINCE = @prov");
                                    }

                                    if (!string.IsNullOrEmpty(prof_country.Text) || !string.Equals(reader["COUNTRY"].ToString(), prof_country.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@coun", prof_country.Text);
                                        updateset.Add("COUNTRY = @coun");
                                    }

                                    if (!string.IsNullOrEmpty(prof_zip.Text) || !string.Equals(reader["ZIP_CODE"].ToString(), prof_zip.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@zip", prof_zip.Text);
                                        updateset.Add("ZIP_CODE = @zip");
                                    }

                                    if (!string.IsNullOrEmpty(prof_mobile.Text) || !string.Equals(reader["MOBILE_NO"].ToString(), prof_mobile.Text, StringComparison.Ordinal))
                                    {
                                        cmd2.Parameters.AddWithValue("@mobile", prof_mobile.Text);
                                        updateset.Add("MOBILE_NO = @mobile");
                                    }
                                    cmd2.CommandText += string.Join(", ", updateset);

                                    // Add the WHERE clause to update the specific user
                                    cmd2.CommandText += " WHERE ID = @user";
                                    cmd2.Parameters.AddWithValue("@user", clientID);

                                    reader.Close();

                                    var ctr = cmd2.ExecuteNonQuery();

                                    if (ctr > 0)
                                    {
                                        Response.Write("<script>alert('Update Successfully');</script>");
                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('Sorry, Failed to update');</script>");
                                    }

                                }
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

        protected void Btn_change_pass_Click(object sender, EventArgs e)
        {
            Response.Redirect("change_password.aspx");
        }
    }
}