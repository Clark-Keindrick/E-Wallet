<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_out.aspx.cs" Inherits="E_WALLET.admin_out" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Out</title>
	<link rel="stylesheet" href="adminSign.css" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

	<style>

	#Btn_yes {
        appearance: none;
        background-color: #FFFFFF;
        border-radius: 40em;
        border-style: none;
        box-shadow: #ADCFFF 0 -12px 6px inset;
        box-sizing: border-box;
        color: #000000;
        cursor: pointer;
        display: inline-block;
        font-family: -apple-system,sans-serif;
        font-size: 1.2rem;
        font-weight: 700;
        letter-spacing: -.24px;
        outline: none;
        padding: 1rem 1.3rem;
        quotes: auto;
        text-align: center;
        text-decoration: none;
        transition: all .15s;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
        margin-top: 80px;
        margin-left: 150px;
    }

        #Btn_yes:hover {
            background-color: #FFC229;
            box-shadow: #FF6314 0 -6px 8px inset;
            transform: scale(1.125);
        }

        #Btn_yes:active {
            transform: scale(1.025);
        }

    @media (min-width: 768px) {
        #Btn_yes {
            font-size: 1.5rem;
            padding: .95rem 4.5rem;
        }
    }

    #Btn_no {
        appearance: none;
        background-color: #FFFFFF;
        border-radius: 40em;
        border-style: none;
        box-shadow: #ADCFFF 0 -12px 6px inset;
        box-sizing: border-box;
        color: #000000;
        cursor: pointer;
        display: inline-block;
        font-family: -apple-system,sans-serif;
        font-size: 1.2rem;
        font-weight: 700;
        letter-spacing: -.24px;
        outline: none;
        padding: 1rem 1.3rem;
        quotes: auto;
        text-align: center;
        text-decoration: none;
        transition: all .15s;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
        margin-top: 80px;
        margin-left: 160px;
    }

        #Btn_no:hover {
            background-color: #FFC229;
            box-shadow: #FF6314 0 -6px 8px inset;
            transform: scale(1.125);
        }

        #Btn_no:active {
            transform: scale(1.025);
        }

    @media (min-width: 768px) {
        #Btn_no {
            font-size: 1.5rem;
            padding: .95rem 4.5rem;
        }
    }
	</style>

</head>
<body>
	<form id="form5" runat="server">
        <div id="mySidenav" class="sidenav">
		<p class="logo"><span>E</span>-Wallet</p>
	  <a href="admin_dashboard.aspx" class="icon-a"><i class="fa fa-dashboard icons"></i>   Dashboard</a>
	  <a href="#"class="icon-a"><i class="fa fa-users icons"></i>  Users</a>
	  <a href="admin_transac.aspx"class="icon-a"><i class="fa fa-list icons"></i>   Transactions</a>
	  <a href="registerAdmin.aspx"class="icon-a"><i class="fa fa-user icons"></i>   Add New Admin</a>
	  <a href="admin_out.aspx"class="icon-a"><i class="fa fa-sign-out icons"></i>   Sign Out</a>

	</div>
	<div id="main" >

		<div class="head">
			<div class="col-div-6">
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav"  >☰ Sign up</span>
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav2"  >☰ Sign up</span>
	</div>
		
		<div class="clearfix"></div>
	</div>

		<br/><br/>
		<div class="col-div-9" >
			<div class="box-9">
			<div class="content-box2">
				
			<p style="font-size: 35px; color: white; font-weight: bold; line-height: 30px; 
                   padding-left: 10px; margin-top: 40px; display: inline-block; margin-left: 45px;">ARE YOU SURE DO YOU WANT TO SIGN OUT ?</p> <br /><br /><br />

				<asp:Button ID="Btn_yes" runat="server" Text="YES" OnClick="Btn_yes_Click" />
                <asp:Button ID="Btn_no" runat="server" Text="NO" OnClick="Btn_no_Click" />
				
		   </div>
		</div>
		</div>
			
		<div class="clearfix"></div>
	</div >


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

        $(".nav").click(function () {
            $("#mySidenav").css('width', '70px');
            $("#main").css('margin-left', '70px');
            $(".logo").css('visibility', 'hidden');
            $(".logo span").css('visibility', 'visible');
            $(".logo span").css('margin-left', '-10px');
            $(".icon-a").css('visibility', 'hidden');
            $(".icons").css('visibility', 'visible');
            $(".icons").css('margin-left', '-8px');
            $(".nav").css('display', 'none');
            $(".nav2").css('display', 'block');
        });

        $(".nav2").click(function () {
            $("#mySidenav").css('width', '300px');
            $("#main").css('margin-left', '300px');
            $(".logo").css('visibility', 'visible');
            $(".icon-a").css('visibility', 'visible');
            $(".icons").css('visibility', 'visible');
            $(".nav").css('display', 'block');
            $(".nav2").css('display', 'none');
        });

    </script>
	</form>
</body>
</html>
