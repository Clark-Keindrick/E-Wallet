<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_form.aspx.cs" Inherits="E_WALLET.login_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Log-in</title>
    <link href="css/style.default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form5" runat="server">
        <div class=" page-holder d-flex align-items-center">
            <div class="container">
                <div class="row align-items-center py-5">
                    <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
                    
                        <div class="pr-lg-5">
                            <img src="e-wallet_bg.png" alt="" class="img-fluid" />     
                        </div>
                    </div>
                    <div class="col-lg-5 px-lg-4">
                        <h1 class="text-base text-primary text-uppercase mb-4">Login Here</h1>
                        <h2 class="mb-4">Welcome Back!</h2>
                        <asp:Label ID="invalidTxt" runat="server" Text="" Font-Bold="True" Font-Names="Open Sans Light" ForeColor="Red"></asp:Label> <br />
                        <div class ="form-group mb-4">
                            <asp:TextBox ID="Username" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Username" runat="server" ></asp:TextBox>

                        </div>

                             <div class ="form-group mb-4">
                            <asp:TextBox ID="Password" type="Password" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Password" runat="server"></asp:TextBox>

                        </div>
                        <div class="form-group mb-4">
                            <div class="custom-control custom-checkbox">
                                <asp:CheckBox ID="ShowPasswordCheckBox" Text="&nbsp&nbsp&nbspShow Password" runat="server" onclick="TogglePasswordVisibility()"/>
                            </div>
                        </div>
                        <asp:Button ID="btnlogin" Text="LOGIN" CssClass="btn btn-primary" Height="50px" Width="400px" runat="server" OnClick="btnlogin_Click" /> <br /><br />
                        <h3 style="margin-left: 180px;" class="mb-4">OR</h3>
                        <asp:Button ID="btnsign" Text="SIGN UP" CssClass="btn btn-primary" Height="50px" Width="400px" runat="server" OnClick="btnsign_Click" />
                    </div>
                </div>

               
                <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100 " style="text-align:end;margin-top:390px">
                    <div class="container-fluid">
                        <div class="row">   
                            <div class="col-md-6 text-center text-md-left text-primary">
                                <p class  ="mb-2 mb-md-0">Mollejon &copy;2023 BSIT II-A</p>
                            </div>
                            <div class="col-md-6 text-center text-md-right text-gray-400">
                                <p class="mb-0">E-WALLET &nbsp; &nbsp;<a href="admin_login.aspx">Log in as Admin</a></p>

                            </div>
                        </div>
                    </div>
                </footer>
            </div>        
        </div>

         <script>
             function TogglePasswordVisibility() {
                 var passwordField = document.getElementById("<%= Password.ClientID %>");
                 var showPasswordCheckBox = document.getElementById("<%= ShowPasswordCheckBox.ClientID %>");

                 if (showPasswordCheckBox.checked) {
                     passwordField.type = "text";
                 } else {
                     passwordField.type = "password";
                 }
             }
         </script>

    </form>
</body>
</html>
