<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LihatKosV1.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .jumbotron {
            /*background: #358CCE;*/
            color: #FFF;
            border-radius: 0px;
        }

        .jumbotron-sm {
            padding-top: 24px;
            padding-bottom: 24px;
        }

        .jumbotron small {
            color: #FFF;
        }

        .h1 small {
            font-size: 24px;
        }
    </style>
    <div class="jumbotron jumbotron-sm spacersmall services">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <h1 class="h1">About Us</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
               <asp:Label ID="lblContent" runat="server" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function show() {
            document.write("<head id='Head1' runat='server' />");
        }
    </script>
</asp:Content>
