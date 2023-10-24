<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="E_WALLET.Transactions" %>

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
            top: 20px;
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
            margin-top: -100px;
            color: rgb(66,66,66);
        }

         #from_date, #to_date, #trans_type{
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
     <form id="form12" runat="server">
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
                      <br /><br /><br />
                       <b style="font-size: large;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; From:&nbsp;&nbsp; </b>
                      <asp:TextBox ID="from_date" runat="server" Type="date" Height="30px" Width="162px" ></asp:TextBox>
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                      <asp:DropDownList ID="trans_type" runat="server" Height="31px" Width="180px" OnSelectedIndexChanged="trans_type_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="--Transaction Type--" disabled="Selected"></asp:ListItem>
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Deposit</asp:ListItem>
                        <asp:ListItem>Withdraw</asp:ListItem>
                        <asp:ListItem>Sent</asp:ListItem>
                        <asp:ListItem>Recieved</asp:ListItem>

                    </asp:DropDownList>
                      <br /><br />
                     <b style="font-size: large; margin-left: -460px;"> To:&nbsp;&nbsp; </b> <asp:TextBox ID="to_date" runat="server" Type="date" Height="30px" Width="162px"></asp:TextBox>
                       <br /><br />

                      <asp:GridView ID="Records" runat="server" AutoGenerateColumns ="false" Width="751px" CssClass="auto-style12" style="margin-left: 21px">
                        <Columns>
                            <asp:BoundField DataField ="Transac_ID" HeaderText = "Transaction ID" />
                            <asp:BoundField DataField ="Amount" HeaderText = "Amount" />
                            <asp:BoundField DataField ="Date" HeaderText = "Date" />
                            <asp:BoundField DataField ="Transac_Type" HeaderText = "Type" />
                            <asp:BoundField DataField ="User_ID" HeaderText = "User ID" />

                        </Columns>
                   </asp:GridView>

                      <h1> <asp:Label ID="gridlbl" runat="server" Text="YOU DON'T HAVE ANY TRANSACTIONS"></asp:Label></h1>
                  </div>
              </div>

      </div>
      <section class="home-section">
        <div class="text">Transactions</div>
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
