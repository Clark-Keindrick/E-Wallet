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

namespace Personal_Information
{
    public partial class PersonalForm : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\OneDrive\Programming 2\ASP.NET\E-WALLET\E-WALLET\App_Data\E_WALLET.mdf;Integrated Security=True";

        protected void Page_Init(object sender, EventArgs e)
        {
           Date.Attributes.Add("max", DateTime.Now.ToString("yyyy-MM-dd"));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = picUpload.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExt = Path.GetExtension(filename).ToLower();
            int filesize = postedFile.ContentLength;
            byte[] pic = new byte[filesize];
            picUpload.PostedFile.InputStream.Read(pic, 0, filesize);

            string Firstname = Fname.Text;
            string Suffix = Suf_Name.Text;
            string Lastname = Lname.Text;
            string Midname = Mid_Name.Text;
            string Dob = Date.Text; 
            string HouseNo = H_num.Text;
            string Strt = Street.Text;
            string Vil = Village.Text;
            string Brngy = BRGY.Text;
            string mun_cit = CITY.Text;
            string Province = PROV.Text;
            int Postal = int.Parse(ZIP.Text);
            string Country = Citizen.Text;
            string MobileNo = Mobile.Text;
            string EmailAd = email.Text;
            string Username = lblusername.Text;
            string Password = lblpass.Text;
            string Gender = RBLgender.Text;
            string Curr_date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            using (var db = new SqlConnection(connString))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM CLIENT_INFO WHERE USERNAME = @user_name OR EMAIL_AD = @emailAd";

                    cmd.Parameters.AddWithValue("@user_name", Username);
                    cmd.Parameters.AddWithValue("@emailAd", EmailAd);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (reader["USERNAME"].ToString().ToLower() == Username.ToLower())
                            {
                                RequiredFieldValidator14.ErrorMessage = "Username already exists";
                                RequiredFieldValidator14.IsValid = false;
                                return;
                            }

                            else if (reader["MOBILE_NO"].ToString().Equals(MobileNo, StringComparison.InvariantCultureIgnoreCase))
                            {
                                RegularExpressionValidator4.ErrorMessage = "Phone Number already exists";
                                RegularExpressionValidator4.IsValid = false;
                                return;
                            }

                            else if (reader["EMAIL_AD"].ToString().ToLower() == EmailAd.ToLower())
                            {
                                RegularExpressionValidator5.ErrorMessage = "Email already exists";
                                RegularExpressionValidator5.IsValid = false;
                                return;
                            }
                        }
                    }
                }
                if (fileExt == ".bmp" || fileExt == ".jpg" || fileExt == ".png" || fileExt == ".jpeg")
                {
                    using (var cmd2 = db.CreateCommand())
                    {
                        cmd2.CommandType = CommandType.Text;
                        cmd2.CommandText = "INSERT INTO CLIENT_INFO(FIRSTNAME, LASTNAME, SUFFIX, MID_NAME, GENDER, DOB, HOUSE_NO, SUBDI_VILLAGE," +
                                           "STREET, BARANGAY, CITY_MUNICIPALITY, PROVINCE, ZIP_CODE, COUNTRY, MOBILE_NO, EMAIL_AD, USERNAME, PASSWORD," +
                                           "DATE_REGISTERED, PIC) VALUES (@fname, @lname, @suf, @midname, @gender, @dob, @houseno, @subdi, @st," +
                                           "@BRGY, @city, @prov, @zip, @country, @mobno, @email, @user, @pass, @date_reg, @photo)";

                        cmd2.Parameters.AddWithValue("@fname", Firstname);
                        cmd2.Parameters.AddWithValue("@lname", Lastname);
                        cmd2.Parameters.AddWithValue("@suf", Suffix);
                        cmd2.Parameters.AddWithValue("@midname", Midname);
                        cmd2.Parameters.AddWithValue("@gender", Gender);
                        cmd2.Parameters.AddWithValue("@dob", Dob);
                        cmd2.Parameters.AddWithValue("@houseno", HouseNo);
                        cmd2.Parameters.AddWithValue("@subdi", Vil);
                        cmd2.Parameters.AddWithValue("@st", Strt);
                        cmd2.Parameters.AddWithValue("@BRGY", Brngy);
                        cmd2.Parameters.AddWithValue("@city", mun_cit);
                        cmd2.Parameters.AddWithValue("@prov", Province);
                        cmd2.Parameters.AddWithValue("@zip", Postal);
                        cmd2.Parameters.AddWithValue("@country", Country);
                        cmd2.Parameters.AddWithValue("@mobno", MobileNo);
                        cmd2.Parameters.AddWithValue("@email", EmailAd);
                        cmd2.Parameters.AddWithValue("@user", Username);
                        cmd2.Parameters.AddWithValue("@pass", Password);
                        cmd2.Parameters.AddWithValue("@date_reg", Curr_date);
                        cmd2.Parameters.AddWithValue("@photo", pic);

                        var ctr = cmd2.ExecuteNonQuery();

                        if (ctr >= 1)
                        {
                            string script = "if (confirm('Registered Successfully!')) { window.location.href = 'login_form.aspx'; }";
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
                    Response.Write("<script> alert('File is not valid!') </script>");
                }

            }
        }
    }
}