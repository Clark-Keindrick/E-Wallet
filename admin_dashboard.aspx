<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="E_WALLET.admin_dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
	<link rel="stylesheet" href="admindb.css" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mySidenav" class="sidenav">
		<p class="logo"><span>E</span>-Wallet</p>
	  <a href="admin_dashboard.aspx" class="icon-a"><i class="fa fa-dashboard icons"></i>   Dashboard</a>
	  <a href="#"class="icon-a"><i class="fa fa-users icons"></i>  Users</a>
	  <a href="admin_transac.aspx"class="icon-a"><i class="fa fa-list icons"></i>   Transactions</a>
	  <a href="registerAdmin.aspx"class="icon-a"><i class="fa fa-user icons"></i>   Add New Admin</a>
	  <a href="admin_out.aspx"class="icon-a"><i class="fa fa-sign-out icons"></i>   Sign Out</a>

	</div>
	<div id="main">

		<div class="head">
			<div class="col-div-6">
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav"  >☰ Dashboard</span>
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav2"  >☰ Dashboard</span>
	</div>
		
		<div class="col-div-6">
		<div class="profile">

			<asp:Image ID="img" runat="server" alt="profile image" CssClass="pro-img"/>
			<p><asp:Label ID="admin_name" runat="server" Text="" style="font-size: 13.5px; font-weight: 500; color: white;"></asp:Label><span>Administrator</span></p>
		</div>
	</div>
		<div class="clearfix"></div>
	</div>

		<div class="clearfix"></div>
		<br/>
		
		<div class="col-div-3">
			<div class="box">
				<p>67<br/><span>Customers</span></p>
				<i class="fa fa-users box-icon"></i>
			</div>
		</div>
		<div class="col-div-3">
			<div class="box">
				<p>88<br/><span>Projects</span></p>
				<i class="fa fa-list box-icon"></i>
			</div>
		</div>
		<div class="col-div-3">
			<div class="box">
				<p>99<br/><span>Orders</span></p>
				<i class="fa fa-shopping-bag box-icon"></i>
			</div>
		</div>
		<div class="col-div-3">
			<div class="box">
				<p>78<br/><span>Tasks</span></p>
				<i class="fa fa-tasks box-icon"></i>
			</div>
		</div>
		<div class="clearfix"></div>
		<br/><br/>
		<div class="col-div-8">
			<div class="box-8">
			<div class="content-box">
				<p>Top Selling Projects <span>Sell All</span></p>
				<br/>
				 <table>
				  <tr>
					<th>Company</th>
					<th>Contact</th>
					<th>Country</th>
				  </tr>
				  <tr>
					<td>Alfreds Futterkiste</td>
					<td>Maria Anders</td>
					<td>Germany</td>
				  </tr>
				  <tr>
					<td>Centro comercial Moctezuma</td>
					<td>Francisco Chang</td>
					<td>Mexico</td>
				  </tr>
				  <tr>
					<td>Ernst Handel</td>
					<td>Roland Mendel</td>
					<td>Austria</td>
				  </tr>
				  <tr>
					<td>Island Trading</td>
					<td>Helen Bennett</td>
					<td>UK</td>
				  </tr>
	  
				</table>
			</div>
		</div>
		</div>
			
		<div class="clearfix"></div>
	</div>


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
    </form>
</body>
</html>
