<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_transac.aspx.cs" Inherits="E_WALLET.admin_transac" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User's Transactions</title>
	<link rel="stylesheet" href="adminSign.css" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
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
		
		<div class="col-div-6">
		<div class="profile">

			<img src="ProPic.png" class="pro-img" />
			<p> <asp:Label ID="Label1" runat="server" Text="Clark Mollejon" style="font-size: 13.5px; font-weight: 500; color: white;"></asp:Label> <span>Administrator</span></p>
		</div>
	</div >
		<div class="clearfix"></div>
	</div>

		<br/><br/>
		<div class="col-div-8" >
			<div class="box-8">
			<div class="content-box">
				

			</div>
		</div>
		</div>
			
		<div class="clearfix"></div>
	</div >


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

	  $(".nav").click(function(){
	    $("#mySidenav").css('width','70px');
	    $("#main").css('margin-left','70px');
	    $(".logo").css('visibility', 'hidden');
	    $(".logo span").css('visibility', 'visible');
	     $(".logo span").css('margin-left', '-10px');
	     $(".icon-a").css('visibility', 'hidden');
	     $(".icons").css('visibility', 'visible');
	     $(".icons").css('margin-left', '-8px');
	      $(".nav").css('display','none');
	      $(".nav2").css('display','block');
	  });

	$(".nav2").click(function(){
	    $("#mySidenav").css('width','300px');
	    $("#main").css('margin-left','300px');
	    $(".logo").css('visibility', 'visible');
	     $(".icon-a").css('visibility', 'visible');
	     $(".icons").css('visibility', 'visible');
	     $(".nav").css('display','block');
	      $(".nav2").css('display','none');
	 });

    </script>

</body>
</html>
