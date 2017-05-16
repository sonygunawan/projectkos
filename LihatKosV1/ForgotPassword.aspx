<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="LihatKosV1.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LihatKos.com | Website Pencari Tempat Kos Terbaik dan Terkini</title>
    <meta name="description" content="Website listing Rumah Kos yang menyajikan berbagai macam data Tempat Kos yang Akurat dan Terverifikasi. Saat ini Lokasi jangkauan wilayah kami meliputi Jakarta, Bogor, Tangerang dan Bekasi." />
     <style type="text/css">
        .Button
        {
        background-color :#FF5A00;
        color: #FFFFFF;
        font-weight: bold;
        margin-right: 2px;
        padding: 4px 20px 4px 21px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <table cellspacing="2" cellpadding="2" border="0">
            <tr><td></td><td><h2><b>Forgot Password</b></h2></td></tr>
            <tr><td><b>Enter Your Email:</b></td><td><asp:TextBox ID="txtEmail" runat="server" /></td></tr>
            <tr><td></td><td><asp:button ID="btnSubmit" Text="Submit"  runat="server" OnClick="btnSubmit_Click" CssClass="Button"/></td></tr>
            <tr><td colspan="2" style=" color:red"><asp:Label ID="lblMessage" runat="server"/></td></tr>
        </table>
    </div>
    </form>
</body>
</html>
