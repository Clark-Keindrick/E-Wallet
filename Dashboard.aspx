<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="E_WALLET.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Client Dashboard</title>
  <!-- Link Styles -->
  <link rel="stylesheet" href="style.css"/>
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>

    <style type="text/css">
        .container{
        background-color: white; 
        margin-left: 180px;
        position: absolute; 
        top: 300px;
        left: 320px;
        width: 800px;
        height: 410px;
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

        .circle-frame {
          background-color: white; 
          position: absolute; 
          top: 45px;
          left: 790px;
          border: 5px solid green;  
          width: 200px;
          height: 200px;
          border-radius: 50%;
          overflow: hidden;
        }

        .circle-frame #profile_pic {
          border-radius: 50%;
          padding: 5px;
          box-sizing: border-box;
          width: 100%;
          height: 100%;
          object-fit: cover; /* Maintain the image aspect ratio */
        }
    </style>
</head>

<body>
   <form id="form4" runat="server">
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
            <a href="#">
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

          <div class="circle-frame">
              <asp:Image ID="profile_pic" runat="server" />
          </div> <br />

          <div class="container">
              <div class ="content">

                  <table>
                      <tr>
                          <td>
                              <b style="font-size: larger;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAME:&nbsp;&nbsp; </b>
                              <asp:Label ID="clientName" runat="server" Text="" Font-Size="X-Large" Font-Underline="True" style="font-family:'Open Sans'"></asp:Label>
                          </td>

                          <td >
                              <b style="margin-left: 140px; font-size: larger">ACCOUNT NO. :&nbsp;&nbsp; </b>
                              <asp:Label ID="accnum" runat="server" Text="" Font-Size="X-Large" Font-Underline="True" style="font-family:'Open Sans'"></asp:Label>
                          </td>
                      </tr> 
                  </table> <br /> <br /> <br />

                  <table>
                      <tr>
                          <td>
                              <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DATE REGISTERED:&nbsp;&nbsp; </b>
                              <asp:Label ID="date_reg" runat="server" Text="" Font-Size="large" Font-Underline="True" style="font-family:'Open Sans'"></asp:Label>
                          </td>

                          <td >
                              <b style="margin-left: 50px; font-size: larger">CURRENT BALANCE:&nbsp;&nbsp;&nbsp;</b>
                              <asp:Label ID="curr_bal" runat="server" Text="P15,000" Font-Size="X-Large" Font-Underline="True" style="font-family:'Open Sans'"></asp:Label>
                          </td>
                      </tr>
                  </table> <br /> <br /> <br /> <br /> <br />

                   <table>
                      <tr>
                          <td>
                              <b style="font-size: X-Large; margin-left: 170px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TOTAL MONEY SENT:&nbsp;&nbsp; </b>
                              <asp:Label ID="total_sent" runat="server" Text="P79500.00" Font-Size="X-Large" Font-Underline="True" style="font-family:'Open Sans'"></asp:Label>
                          </td>
                      </tr>
                  </table>
              </div>
          </div>
      </div>
      <section class="home-section">
        <div class="text">Dashboard</div>
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
