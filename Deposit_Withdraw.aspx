<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deposit_Withdraw.aspx.cs" Inherits="E_WALLET.Deposit_Withdraw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Deposit/Withdraw</title>
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

          #myprofile{
          position: absolute;
          top: 15px;
          left: 15px;
          border-radius: 50%;
          width: 120px;
          height: 120px;
        }
        #amount{
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
   <form id="form6" runat="server">
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
              <asp:Image ID="img" runat="server"/>
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
                  <asp:Image ID="myprofile" runat="server" />
              
                  <b style="font-size:larger; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      Name:&nbsp;&nbsp;</b><asp:Label ID="prof_fullname" runat="server" Text="" Font-Size="Large"></asp:Label>
                  <b style="font-size: larger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       Account No.&nbsp;:&nbsp;&nbsp;&nbsp;</b><asp:Label ID="prof_acc_num" runat="server" Text="" Font-Size="Large"></asp:Label> 
                      <br /><br /><br /><br /><br /><br />
                 
                  <p style="margin-left: 250px; font-family: Tw Cen MT Condensed Extra Bold; font-weight: bold; font-size: 35px;">Total Balance:&nbsp;
                      <asp:Label ID="lbl_balance" runat="server" Text="" Font-Underline="True"></asp:Label></p><br /><br /><br /><br /><br />

                   &nbsp;<asp:Label ID="lbl_insufficient" runat="server" Text="" Font-Bold="True" Font-Names="Segoe UI Black" ForeColor="Red"></asp:Label> <br />

                   <asp:TextBox ID="amount" runat="server" Height="60px" Width="300px" placeholder="P 0.00" Font-Bold="True" Font-Size="X-Large" 
                       ForeColor="Black" BackColor="#ECFFFF" Type="Number" min="100" max="10000" style="text-align: center;" required="True" OnTextChanged="amount_TextChanged"></asp:TextBox><br />
                   
                  <h1 style="color: darkgreen; font-weight: bold; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">INPUT AMOUNT</h1>
                  <br /><br /><br /><br />

                   <asp:Button ID="Btn_deposit2" runat="server" Text="DEPOSIT" Height="50px" 
                                  Width="240px" Font-Bold="True" ForeColor="Black" OnClick="Btn_deposit2_Click"/>

                 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

                  <asp:Button ID="Btn_withdraw2" runat="server" Text="WITHDRAW" Height="50px" 
                                  Width="240px" Font-Bold="True" ForeColor="Black" OnClick="Btn_withdraw2_Click"/>
              </div>
          </div>

      </div>
          <section class="home-section">
            <div class="text">Deposit/Withdraw</div>
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
