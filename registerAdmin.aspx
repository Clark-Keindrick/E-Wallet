<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerAdmin.aspx.cs" Inherits="E_WALLET.registerAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign up</title>
	<link rel="stylesheet" href="adminSign.css" type="text/css"/>
	<link rel="stylesheet" href="register.css" type="text/css"/>
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

			<asp:Image ID="img" runat="server" alt="profile image" CssClass="pro-img"/>
			<p><asp:Label ID="admin_name" runat="server" Text="" style="font-size: 13.5px; font-weight: 500; color: white;"></asp:Label><span>Administrator</span></p>
		</div>
	</div >
		<div class="clearfix"></div>
	</div> 

		<br/><br/>
		<div class="col-div-8" >
			<div class="box-8">
			<div class="content-box">
				
				<div class="container">
					<div class="title">Registration</div>
					<div class="content">
					  <form action="#" runat="server">
						<div class="user-details">
						  <div class="input-box">
							<span class="details">Full Name</span>
							 <asp:TextBox ID="LBLfullname" runat="server" placeholder="Enter your name" required="True" AutoCompleteType="Disabled"></asp:TextBox>
						  </div>
						  <div class="input-box">
							<span class="details">Username &emsp;&emsp;&emsp;<asp:Label ID="userexist" runat="server" Text="" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red"></asp:Label></span>
							<asp:TextBox ID="LBLuser" runat="server" placeholder="Enter your username" required="True" AutoCompleteType="Disabled"></asp:TextBox>
						  </div>
						  <div class="input-box">
							<span class="details">Email &emsp;&emsp;<asp:RegularExpressionValidator ID="Validator1" runat="server" ErrorMessage="Invalid Email!!!" 
                              ControlToValidate="LBLemail" SetFocusOnError="True" style="color: red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
								Font-Names="Times New Roman" Font-Bold="True"></asp:RegularExpressionValidator></span>
							<asp:TextBox ID="LBLemail" runat="server" placeholder="Enter your email" required="True" AutoCompleteType="Disabled"></asp:TextBox>
						  </div>
						  <div class="input-box">
							<span class="details">Phone Number  &emsp;&emsp;<asp:Label ID="numexist" runat="server" Text="" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red"></asp:Label></span>
							<asp:TextBox ID="LBLnum" runat="server" placeholder="Enter your number" required="True" AutoCompleteType="Disabled"></asp:TextBox>
						  </div>
						  <div class="input-box">
							<span class="details">Password</span>
							<asp:TextBox ID="LBLpass" runat="server" placeholder="Enter your password" required="True" AutoCompleteType="Disabled" Type="Password"></asp:TextBox>
						  </div>
						  <div class="input-box">
							<span class="details">Confirm Password &emsp;&emsp;<asp:Label ID="XPass" runat="server" Text="" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red"></asp:Label></span>
							<asp:TextBox ID="LBLconfirm" runat="server" placeholder="Confirm your password" required="True" AutoCompleteType="Disabled" Type="Password"></asp:TextBox>
						  </div>
						   <div>
							<br />
							 <b><span class="details">Upload Photo: &emsp;</span></b>
							<asp:FileUpload ID="picUpload" runat="server"/>&emsp;&emsp; <asp:CheckBox ID="ShowPass" Text="Show Password" runat="server" onclick="TogglePasswordVisibility()"/>
							<br /><br />
						  </div>
						</div>
						<div class="gender-details">
						  <asp:RadioButton ID="dot_1" runat="server" GroupName="gender" />
						  <asp:RadioButton ID="dot_2" runat="server" GroupName="gender"/>
						  <asp:RadioButton ID="dot_3" runat="server" GroupName="gender"/>
						  
						  <span class="gender-title">Gender</span>
						  <div class="category">
							<label for="dot_1">
							<span class="dot one"></span>
							<span class="gender">Male</span>
						  </label>
						  <label for="dot_2">
							<span class="dot two"></span>
							<span class="gender">Female</span>
						  </label>
						  <label for="dot_3">
							<span class="dot three"></span>
							<span class="gender">Prefer not to say</span>
							</label>
						  </div>
						</div>
        <div class="button">
			<asp:Button ID="BTNreg" runat="server" Text="Register" OnClick="BTNreg_Click" />
        </div>
			<script>
                function TogglePasswordVisibility() {
					var passwordField = document.getElementById("<%= LBLpass.ClientID %>");
                    var confirmField = document.getElementById("<%= LBLconfirm.ClientID %>");
                    var showPasswordCheckBox = document.getElementById("<%= ShowPass.ClientID %>");

                    if (showPasswordCheckBox.checked) {
						passwordField.type = "text";
                        confirmField.type = "text";
                    } else {
						passwordField.type = "password";
                        confirmField.type = "password";
                    }
                }
            </script>
      </form>
    </div>
  </div>

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
