<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete_Acc.aspx.cs" Inherits="E_WALLET.Delete_Acc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Delete Account</title>
  <!-- Link Styles -->
  <link rel="stylesheet" href="style.css"/>
  <link rel="stylesheet" href="button3.css"/>
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

    </style>

</head>
<body>
   <form id="form25" runat="server">
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
                  <br /><br /><br />
                  <h2>Do you want to delete or deactivate your account?</h2> <br /><br /><br /><br /><br /><br />
                 
                  <asp:Button ID="Btn_del" runat="server" Text="Delete" Height="40px" 
                                  Width="180px" ForeColor="Black" style="margin-left: -10px;" OnClick="Btn_del_Click" Font-Names="Cooper Black"/>
                  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                  <asp:Button ID="Btn_deac" runat="server" Text="Deactivate" Height="40px" 
                                  Width="180px" ForeColor="Black" OnClick="Btn_deac_Click" Font-Names="Cooper Black"/>
              </div>
          </div>

      </div>
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
