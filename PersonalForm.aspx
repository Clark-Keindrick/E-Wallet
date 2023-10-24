<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalForm.aspx.cs" Inherits="Personal_Information.PersonalForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration form</title>
</head>
<body style="background-color: antiquewhite">
    <form id="form1" runat="server">
        <div style="margin-left:450px; margin-top: 100px; margin-bottom: 500px">

            <h1 style="color: #825538; font-family: sans-serif; font-size:50px">PERSONAL INFORMATION FORM</h1> <br />

            <table>
                <tr>
                    <td><h2 style="font-family: sans-serif; color: brown">Name</h2> </td>
                    <td style="padding-top: 5%"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Fill out this field" 
                             ControlToValidate="Fname" SetFocusOnError="True" style="color: red"></asp:RequiredFieldValidator></td>
                    <td style="padding-top: 5%"> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Type N/A if not applicable" 
                        ControlToValidate="Suf_Name" SetFocusOnError="True" style="color: red"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td> <asp:DropDownList ID="Title" runat="server" Height="50px" Width="180px" BackColor="#FFFFCC" Font-Names="sans-serif" Font-Size="Large" style="border-color: gold; padding-left: 10px" ForeColor="Brown" >
                        <asp:ListItem Text="Title" disabled="Selected" ></asp:ListItem>
                        <asp:ListItem>Ms</asp:ListItem>
                        <asp:ListItem>Mr</asp:ListItem>
                        <asp:ListItem>Mrs</asp:ListItem>
                        </asp:DropDownList> &nbsp;&nbsp;&nbsp;&nbsp;</td>

                    <td><asp:TextBox ID="Fname" runat="server" Height="47px" Width="350px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                        Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="First Name" style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;</td>

                    <td> <asp:TextBox ID="Suf_Name" runat="server" Height="47px" Width="180px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                        Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Suffix" 
                        style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox></td>
                </tr>

            </table>
            <br />
            <table>
                 <tr>
                    <td><asp:TextBox ID="Mid_Name" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Middle Name" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                 
                    <td><asp:TextBox ID="Lname" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Last Name" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox></td>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Type N/A if not applicable" 
                         SetFocusOnError="True" ControlToValidate="Mid_Name" style="color: red"></asp:RequiredFieldValidator>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Fill out this field" 
                         SetFocusOnError="True" ControlToValidate="Lname" style="color: red; margin-left: 300px"></asp:RequiredFieldValidator>
                </tr> 
            </table>
            
            <br />

            <table style="margin-bottom: -35px">
                <tr>
                    <td><h2 style="font-family: sans-serif; color: brown; font-size: 23px ">&nbsp;Gender</h2> </td>
                    <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Please Select a Gender"
                        style="color: red; margin-left: 20px" SetFocusOnError="True" ControlToValidate="RBLgender" ></asp:RequiredFieldValidator></td>
                </tr>
            </table>

            <p style="font-family: sans-serif; color: brown; font-size: 23px"> <b>
            <asp:RadioButtonList ID="RBLgender" runat="server" Font-Bold="True" Font-Size="X-Large" Height="82px" Width="172px" ForeColor="Brown" style="margin-bottom: 40px">
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:RadioButtonList> </b>
            </p>

            <h2 style="font-family: sans-serif; color: brown">Date of Birth</h2>

            <asp:TextBox ID="Date" runat="server" Type="date"  Height="47px" Width="350px" BackColor="#FFFFCC" Font-Size="Large" 
                BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" style="padding-left: 15px; margin-top: -15px" ForeColor="Brown"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Fill out this field" ControlToValidate="Date" 
            SetFocusOnError="True" style="color: red"></asp:RequiredFieldValidator> <br /> <br /> <br />
           

            <h2 style="font-family: sans-serif; color: brown; margin-bottom: 1px">Address</h2>

             <table>
                 <tr>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Type N/A if not applicable" 
                         SetFocusOnError="True" ControlToValidate="H_num" style="color: red"></asp:RequiredFieldValidator>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Type N/A if not applicable" 
                         SetFocusOnError="True" ControlToValidate="Village" style="color: red; margin-left: 235px"></asp:RequiredFieldValidator>

                    <td><asp:TextBox ID="H_num" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="House No." 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                 
                    <td><asp:TextBox ID="Village" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Village/Subdivision" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox></td>
                </tr> 
            </table>

             <table>
                 <tr>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Type N/A if not applicable" 
                         SetFocusOnError="True" ControlToValidate="Street" style="color: red"></asp:RequiredFieldValidator>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*Type N/A if not applicable" 
                         SetFocusOnError="True" ControlToValidate="BRGY" style="color: red; margin-left: 235px"></asp:RequiredFieldValidator>
                    <td><asp:TextBox ID="Street" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Street Address" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                 
                    <td><asp:TextBox ID="BRGY" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Barangay" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox></td>
                </tr> 
            </table>

            <table>
                 <tr>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Fill out this field" 
                         SetFocusOnError="True" ControlToValidate="CITY" style="color: red"></asp:RequiredFieldValidator>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*Type N/A if not applicable" 
                         SetFocusOnError="True" ControlToValidate="PROV" style="color: red; margin-left: 295px"></asp:RequiredFieldValidator>

                    <td><asp:TextBox ID="CITY" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="City/Municipality" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                 
                    <td><asp:TextBox ID="PROV" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Province" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox></td>
                </tr> 
            </table>

            <table>
                 <tr>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Input!!!" 
                    ControlToValidate="ZIP" SetFocusOnError="True" style="color: red" ValidationExpression="^[\d-]+$"></asp:RegularExpressionValidator>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Fill out this field" 
                         SetFocusOnError="True" ControlToValidate="Citizen" style="color: red; margin-left: 315px"></asp:RequiredFieldValidator>

                    <td><asp:TextBox ID="ZIP" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Postal/Zip Code" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    
                     <td><asp:TextBox ID="Citizen" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Country" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox></td>  
                </tr> 
            </table> <br /> <br/>

            <h2 style="font-family: sans-serif; color: brown; margin-bottom: 1px">Mobile Number</h2>

             <asp:TextBox ID="Mobile" runat="server" Height="47px" Width="500px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="###########" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox> 
            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Input!!!" 
                         ControlToValidate="Mobile" SetFocusOnError="True" style="color: red" ValidationExpression="^[\d-]+$"></asp:RegularExpressionValidator><br /> <br/>

            <h2 style="font-family: sans-serif; color: brown; margin-bottom: 1px">Email Address</h2>

             <asp:TextBox ID="email" runat="server" Height="47px" Width="500px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" style="padding-left: 15px" ForeColor="Brown" placeholder="@" AutoCompleteType="Disabled"></asp:TextBox>

            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Input!!!" 
                         ControlToValidate="email" SetFocusOnError="True" style="color: red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> <br /> <br /> <br /><br /> <br />

            <h2 style="font-family: sans-serif; color: brown; margin-bottom: 1px">E-wallet account</h2>

            <table>
                 <tr>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Fill out this field" 
                         SetFocusOnError="True" ControlToValidate="lblusername" style="color: red"></asp:RequiredFieldValidator>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*Type N/A if not applicable" 
                         SetFocusOnError="True" ControlToValidate="lblpass" style="color: red; margin-left: 295px"></asp:RequiredFieldValidator>

                    <td><asp:TextBox ID="lblusername" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Username" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                 
                    <td><asp:TextBox ID="lblpass" runat="server" Height="47px" Width="360px" BackColor="#FFFFCC" Font-Names="sans-serif" 
                     Font-Size="Large" BorderColor="Gold" BorderStyle="Solid" BorderWidth="1px" placeholder="Password" 
                     style="padding-left: 15px" ForeColor="Brown" AutoCompleteType="Disabled"></asp:TextBox></td>
                </tr> 
            </table> <br /><br />
            <h3 style="margin-left: 240px;">(Upload your profile photo here!)</h3>
            <asp:FileUpload ID="picUpload" runat="server" Height="33px" Width="265px" style="margin-left: 240px;" Font-Bold="True" />


            <br /> <br /> <br /><br /> <br />

            <asp:Button ID="btnsubmit" runat="server" Text="SIGN UP" Height="50px" Width="120px" style="margin-left: 350px" BackColor="#663300" BorderStyle="None" Font-Bold="True" Font-Size="Medium" ForeColor="White" OnClick="btnsubmit_Click"/>
        </div>
    </form>
</body>
</html>
