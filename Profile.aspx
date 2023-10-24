<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="E_WALLET.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Client Profile</title>
  <!-- Link Styles -->
  <link rel="stylesheet" href="style.css"/>
  <link rel="stylesheet" href="button.css"/>
    <link rel="stylesheet" href="button2.css"/>
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>

    <style type="text/css">
        .container{
            background-color: white; 
            margin-left: 180px;
            position: absolute; 
            top: 50px;
            left: 320px;
            width: 800px;
            height: 810px;
            padding-top: 70px;
            border-top: 2px solid green;
            box-shadow: 5px 10px 18px #888888;
        }

        .content{
            font-size: large;
            font-weight: 500;
            font-family: Arial, Helvetica, sans-serif;
            vertical-align: middle;
            text-align: center;
            color: rgb(66,66,66);
        }

          #myprofile{
          position: absolute;
          top: 15px;
          left: 15px;
          border-radius: 50%;
          width: 120px;
          height: 120px;
        }
        .auto-style1 {
            width: 244px;
        }
        .auto-style2 {
            width: 168px;
            height: 22px;
        }

        #prof_fname, #prof_lname, #prof_suffix, #prof_midname,
        #prof_gender, #prof_dob, #prof_house_no, #prof_subdi,
        #prof_street, #prof_barangay, #prof_city, #prof_province,
        #prof_zip, #prof_mobile, #prof_country{
          border: none;
          border-bottom: 3px solid #000000;
          border-width: 0 0 3px;
          outline: none;
          background-color: white;
          color: darkgreen;
          font-weight: bold;
        }
        .auto-style3 {
            width: 214px;
        }
    </style>

</head>
<body>
    <form id="form2" runat="server">
      <div class="sidebar">
        <div class="logo_details">
          <i class="bx bxs-wallet icon"></i>
          <div class="logo_name">E-WALLET</div>
          <i class="bx bx-menu" id="btn"></i>
        </div>
        <ul class="nav-list">
          <li>
            <i class="bx bx-search"></i>
            <input type="text" placeholder="Search..."/>
             <span class="tooltip">Search</span>
          </li>
          <li>
            <a href="Dashboard.aspx">
              <i class="bx bx-grid-alt"></i>
              <span class="link_name">Dashboard</span>
            </a>
            <span class="tooltip">Dashboard</span>
          </li>
          <li>
            <a href="Profile.aspx">
              <i class="bx bx-user"></i>
              <span class="link_name">Profile</span>
            </a>
            <span class="tooltip">Profile</span>
          </li>
          <li>
            <a href="Deposit_Withdraw.aspx">
              <i class="bx bx-money-withdraw"></i>
              <span class="link_name">Deposit/Withdraw</span>
            </a>
            <span class="tooltip">Deposit/Withdraw</span>
          </li>
          <li>
            <a href="Transactions.aspx">
              <i class="bx bx-history"></i>
              <span class="link_name">Transactions</span>
            </a>
            <span class="tooltip">Transactions</span>
          </li>
          <li>
            <a href="Send_money.aspx">
              <i class="bx bx-mail-send"></i>
              <span class="link_name">Send Money</span>
            </a>
            <span class="tooltip">Send Money</span>
          </li>
          <li>
            <a href="Delete_Acc.aspx">
              <i class="bx bx-strikethrough"></i>
              <span class="link_name">Delete</span>
            </a>
            <span class="tooltip">Delete</span>
          </li>
          <li class="profile">
            <div class="profile_details">
               <asp:Image ID="img" runat="server" alt="profile image"/>
              <div class="profile_content">
                <div class="name"><asp:Label ID="lbl_btm_name" runat="server" Text=""></asp:Label></div>
                <div class="designation"><asp:Label ID="userid" runat="server" Text=""></asp:Label></div>
              </div>
            </div>
            <i class="bx bx-log-out" id="log_out" onclick="logout()"></i>
          </li>
        </ul>

          <div class="container">
              <div class ="content">
                  <asp:Image ID="myprofile" runat="server" />
              
                  <b style="font-size:larger; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:&nbsp;&nbsp;</b><asp:Label ID="prof_fullname" runat="server" Text="" Font-Size="Large"></asp:Label>
                   <b style="font-size: larger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       Account No.&nbsp;:&nbsp;&nbsp;&nbsp;</b><asp:Label ID="prof_acc_num" runat="server" Text="" Font-Size="Large"></asp:Label> <br /><br /><br />
                  <asp:FileUpload ID="change_pic" runat="server" style="left: 30px; position: absolute;" Width="100px" Enabled="False" /><br /> <br /> <br /> <br />

                  <table style="margin-left: 50px;">
                      <tr>
                          <td>
                              <asp:TextBox ID="prof_fname" runat="server" Height="40px" Width="210px" placeholder="FIRST NAME" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td >
                              <asp:TextBox ID="prof_suffix" runat="server" Height="40px" Width="210px" placeholder="SUFFIX" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td>
                              <asp:TextBox ID="prof_midname" runat="server" Height="40px" Width="210px" placeholder="MIDDLE NAME" Enabled="False"></asp:TextBox>
                          </td>
                     </tr>
                  </table> <br /> 

                  <table style="margin-left: 50px;">
                      <tr>
                          <td>

                          </td>
                          <td class="auto-style1">
                              <h4 class="auto-style3" >Gender</h4>
                          </td>
                          <td>
                             <h4> Date of Birth</h4>
                          </td>
                      </tr>

                      <tr>
                          <td>
                              <asp:TextBox ID="prof_lname" runat="server" Height="40px" Width="210px" placeholder="LAST NAME" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td class="auto-style1">
                              <asp:DropDownList ID="prof_gender" runat="server" Height="40px" Width="210px" Enabled="False">
                                <asp:ListItem Text="--Select Gender--" disabled="Selected"></asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td>
                              <asp:TextBox ID="prof_dob" runat="server" Type="date" Height="40px" Width="210px" Enabled="False"></asp:TextBox>
                              </td>
                     </tr>
                  </table> <br /><br />

                  <h3 class="auto-style2">&nbsp;&nbsp;&nbsp; Address</h3><br />

                  <table style="margin-left: 50px;">
                       <tr>
                          <td>
                              <asp:TextBox ID="prof_house_no" runat="server" Height="40px" Width="210px" placeholder="HOUSE NO." Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td >
                              <asp:TextBox ID="prof_subdi" runat="server" Height="40px" Width="210px" placeholder="SUBDIVISION/VILLAGE" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td>
                              <asp:TextBox ID="prof_street" runat="server" Height="40px" Width="210px" placeholder="STREET" Enabled="False"></asp:TextBox>
                          </td>
                     </tr>
                  </table> <br />

                   <table style="margin-left: 50px;">
                       <tr>
                          <td>
                              <asp:TextBox ID="prof_barangay" runat="server" Height="40px" Width="210px" placeholder="BARANGAY" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td >
                              <asp:TextBox ID="prof_city" runat="server" Height="40px" Width="210px" placeholder="CITY/MUNICIPALITY" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td>
                              <asp:TextBox ID="prof_province" runat="server" Height="40px" Width="210px" placeholder="PROVINCE" Enabled="False"></asp:TextBox>
                          </td>
                     </tr>
                  </table>  <br />

                   <table style="margin-left: 50px;">
                       <tr>
                          <td>
                              <asp:TextBox ID="prof_zip" runat="server" Height="40px" Width="210px" placeholder="ZIP CODE" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td >
                              <asp:TextBox ID="prof_country" runat="server" Height="40px" Width="210px" placeholder="COUNTRY" Enabled="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td>
                              <asp:TextBox ID="prof_mobile" runat="server" Height="40px" Width="210px" placeholder="MOBILE NUMBER" Enabled="False"></asp:TextBox>
                          </td>
                     </tr>
                  </table> <br /><br />

                  <table style="margin-left: 50px;">
                       <tr>
                          <td>
                              <asp:Button ID="Btn_edit" runat="server" Text="EDIT" Height="40px" Width="210px" 
                                  Font-Bold="True" Font-Size="Larger" ForeColor="Black" OnClick="Btn_edit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td >
                             <asp:Button ID="Btn_save" runat="server" Text="SAVE" Height="40px" Width="210px" 
                                 Font-Bold="True" Font-Size="large" ForeColor="Black" OnClick="Btn_save_Click" Enabled="False" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>

                          <td>
                              <asp:Button ID="Btn_change_pass" runat="server" Text="CHANGE PASSWORD" Height="40px" 
                                  Width="210px" Font-Bold="True" ForeColor="Black" OnClick="Btn_change_pass_Click"/>
                          </td>
                     </tr>
                  </table>  <br />
              </div>
          </div>

      </div>
      <section class="home-section">
        <div class="text">Profile</div>
      </section>
      <!-- Scripts -->
      <script src="script.js"></script>

    <script>
        function logout() {
            window.location.href = "ask_to_out.aspx";
        }
    </script>
   </form>
</body>
</html>
