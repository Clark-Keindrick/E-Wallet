<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send_money.aspx.cs" Inherits="E_WALLET.Send_money" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Send Money</title>
  <!-- Link Styles -->
  <link rel="stylesheet" href="style.css"/>
  <link rel="stylesheet" href="button.css"/>
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

        #send_userID, #send_amount, #lbl_password{
          border: none;
          border-bottom: 3px solid #000000;
          border-width: 0 0 3px;
          outline: none;
          background-color: white;
          color: darkgreen;
          font-weight: bold;
        }
    </style>

</head>
<body>
   <form id="form7" runat="server">
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
                <div class="name"><asp:Label ID="lbl_btm_name" runat="server" Text=""></asp:Label> </div>
                <div class="designation"> 
                    <asp:Label ID="userid" runat="server" Text=""></asp:Label>
                </div>
              </div>
            </div> 
            <i class="bx bx-log-out" id="log_out" onclick="logout()"></i>
          </li>
        </ul>

          <div class="container">
              <div class ="content">

                 <div id="view_account" runat="server">
                     <b style="font-size:20px; margin-left: -85px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          Name:&nbsp;&nbsp;</b><asp:Label ID="prof_fullname" runat="server" Text="" Font-Size="22px"></asp:Label>
                      <b style="font-size: 20px">&emsp;&emsp;&emsp;
                          Account No.&nbsp;:&nbsp;&nbsp;&nbsp;</b><asp:Label ID="prof_acc_num" runat="server" Text="" Font-Size="22px"></asp:Label>
                </div><br /><br /><br /><br />

                  <h2 style="color: darkgreen; font-weight: bold; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                      &emsp; &emsp; &emsp;&emsp;USER ID</h2>

                  &emsp;&emsp;&emsp;&emsp; <b style="margin-left: -100px; font-weight: bold; font-size: 30px;">Send to:</b>&nbsp;&nbsp;&nbsp; 
                  <asp:TextBox ID="send_userID" runat="server" Height="50px" Width="290px" Font-Bold="True" Font-Size="31px" ForeColor="Black" 
                    style="text-align:center;" placeholder="####" required="True"></asp:TextBox><br /><br />

                          &nbsp;

                  <asp:Button ID="Btn_confirm" runat="server" Text="CONFIRM" Height="40px" 
                                  Width="190px" ForeColor="Black" Font-Names="Cooper Black" OnClick="Btn_confirm_Click" /><br />

                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;

                  <asp:Label ID="invalid_id" runat="server" Text=""
                          Font-Bold="True" Font-Names="Segoe UI Black" ForeColor="Red"></asp:Label>
                  <br /><br /><br /><br />

                  <div id="view_inputs" runat="server">
                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <asp:Label ID="insuf_amount" runat="server" Text="" 
                          Font-Bold="True" Font-Names="Segoe UI Black" ForeColor="Red"></asp:Label> <br />

                      &emsp;&emsp;&emsp;&emsp; <b style="margin-left: -100px; font-weight: bold; font-size: 30px;">Amount:</b>&nbsp;&nbsp;&nbsp;&emsp; 
                      <asp:TextBox ID="send_amount" runat="server" Height="40px" Width="290px" Font-Bold="True" Font-Size="22px" ForeColor="Black" 
                        style="text-align:center;" placeholder="P 0.00" Type="Number" min="100" max="10000" AutoCompleteType="Disabled"></asp:TextBox><br /><br />

                      &emsp;&emsp;&emsp;&emsp; <b style="margin-left: -100px; font-weight: bold; font-size: 30px;">Password:</b>&nbsp;&nbsp;&nbsp; 
                      <asp:TextBox ID="lbl_password" runat="server" Height="40px" Width="290px" Font-Bold="True" Font-Size="22px" ForeColor="Black" 
                        style="text-align:center;" AutoCompleteType="Disabled"></asp:TextBox><br />

                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <asp:Label ID="lbl_Xpass" runat="server" Text="" 
                          Font-Bold="True" Font-Names="Segoe UI Black" ForeColor="Red"></asp:Label> <br /><br />

                              

                      <asp:Button ID="Btn_send_money" runat="server" Text="SEND MONEY" Height="40px" 
                                  Width="230px" ForeColor="Black" Font-Bold="True" Font-Names="Calibri" Font-Size="28px" OnClick="Btn_send_money_Click"/>

                </div>

              </div>
          </div>

      </div>
      <section class="home-section">
        <div class="text">Send Money</div>
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
