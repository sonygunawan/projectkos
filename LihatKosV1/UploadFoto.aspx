<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadFoto.aspx.cs" Inherits="LihatKosV1.UploadFoto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>LihatKos.com | Website Pencari Tempat Kos Terbaik dan Terkini</title>

    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,500,800|Old+Standard+TT' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,500,800' rel='stylesheet' type='text/css'>

    <!-- font awesome -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- bootstrap -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/login.css" />
     
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body id="home">
    <form class="form-horizontal" id="form1" runat="server">
        <asp:ScriptManager ID="sm" AsyncPostBackTimeout="36000" runat="server"></asp:ScriptManager>
        <!-- header -->
        <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.php">
                        <img src="" alt="LihatKos"></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">

                    <ul class="nav navbar-nav">
                        <!--
        <li><a href="index.php">Home </a></li>
        <li><a href="rooms-tariff.php">Rooms & Tariff</a></li>
        <li><a href="introduction.php">Introduction</a></li>
        <li><a href="gallery.php">Gallery</a></li>
        <li><a href="contact.php">Contact</a></li>
      -->

                        <li><a href="/Register">Register</a></li>
                        <li><a href="/Login">Login</a></li>
                    </ul>
                </div>
                <!-- navbar-collapse -->
            </div>
            <!-- container-fluid -->
        </nav>
        <div style="margin-top: 20px;"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Form Pendaftaran LihatKos
                        </div>
                        
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:ValidationSummary ID="vs" runat="server" />
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Nama Kost</label>
                                <div class="col-md-9">
                                    <asp:Label ID="lblNama" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Alamat</label>
                                <div class="col-md-9">
                                    <asp:Label ID="lblAlamat" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Foto Depan</label>
                                <div class="col-md-9">
                                    <style>
                                        .ajax__fileupload_button {
                                            background-color: green;
                                        }
                                    </style>

                                    <script type="text/javascript">

                                        function onClientDepanUploadComplete(sender, e) {

                                            onImageValidated1("TRUE", e);
                                        }

                                        function onImageValidated1(arg, context) {
                                            var test = document.getElementById("testuploaded");
                                            test.style.display = 'block';

                                            var fileList = document.getElementById("fileList");
                                            var item = document.createElement('div');
                                            item.style.padding = '4px';

                                            if (arg == "TRUE") {
                                                var url = context.get_postedUrl();
                                                url = url.replace('&amp;', '&');
                                                item.appendChild(createThumbnail1(context, url));
                                            } else {
                                                item.appendChild(createFileInfo1(context));
                                            }

                                            fileList.appendChild(item);
                                        }

                                        function createFileInfo1(e) {
                                            var holder = document.createElement('div');
                                            holder.appendChild(document.createTextNode(e.get_fileName() + ' with size ' + e.get_fileSize() + ' bytes'));

                                            return holder;
                                        }

                                        function createThumbnail1(e, url) {
                                            var holder = document.createElement('div');
                                            var img = document.createElement("img");
                                            img.style.width = '80px';
                                            img.style.height = '80px';
                                            img.setAttribute("src", url);

                                            holder.appendChild(createFileInfo1(e));
                                            holder.appendChild(img);

                                            return holder;
                                        }

                                        function onClientDepanUploadStart(sender, e) {
                                            document.getElementById('uploadCompleteInfo').innerHTML = 'Please wait while uploading ' + e.get_filesInQueue() + ' files...';

                                        }

                                        function onClientDepanUploadError(sender, e) {
                                            document.getElementById('uploadCompleteInfo').innerHTML = "There was an error while uploading.";
                                        }

                                        function onClientDepanUploadCompleteAll(sender, e) {
                                            //alert('upload complete all');
                                            var args = JSON.parse(e.get_serverArguments()),
                                                unit = args.duration > 60 ? 'minutes' : 'seconds',
                                                duration = (args.duration / (args.duration > 60 ? 60 : 1)).toFixed(2);

                                            var info = 'At <b>' + args.time + '</b> server time <b>'
                                                + e.get_filesUploaded() + '</b> of <b>' + e.get_filesInQueue()
                                                + '</b> files were uploaded with status code <b>"' + e.get_reason()
                                                + '"</b> in <b>' + duration + ' ' + unit + '</b>';

                                            document.getElementById('uploadCompleteInfo').innerHTML = info;
                                        }
                                    </script>
                                    <asp:Label runat="server" ID="throbberDepan" Style="display: none;"><img align="absmiddle" alt="" src="images/uploading.gif" /></asp:Label>
                                        <ajaxToolkit:AjaxFileUpload ID="fuFotoDepan" runat="server" Padding-Bottom="4"
                                        Padding-Left="2" Padding-Right="1" Padding-Top="4" ThrobberID="throbberDepan"
                                        MaxFileSize="1024" MaximumNumberOfFiles="3" AllowedFileTypes="jpg,jpeg,png" 
                                        OnClientUploadComplete="onClientDepanUploadComplete" OnUploadComplete="fuFotoDepan_UploadComplete"
                                        OnClientUploadCompleteAll="onClientDepanUploadCompleteAll" OnUploadCompleteAll="fuFotoDepan_UploadCompleteAll" 
                                        OnUploadStart="fuFotoDepan_UploadStart" OnClientUploadStart="onClientDepanUploadStart" OnClientUploadError="onClientDepanUploadError" />
                                    <div id="uploadCompleteInfo"></div>
                                    <br />
                                    <div id="testuploaded" style="display: none; padding: 4px; border: gray 1px solid;">
                                        <h4>list of uploaded files:</h4>
                                        <hr />
                                        <div id="fileList">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Foto Bagian Dalam</label>
                                <div class="col-md-9">
                                    <script type="text/javascript">

                                        function onClientDalamUploadComplete(sender, e) {

                                            onImageValidated2("TRUE", e);
                                        }

                                        function onImageValidated2(arg, context) {
                                            var test = document.getElementById("testuploaded2");
                                            test.style.display = 'block';

                                            var fileList2 = document.getElementById("fileList2");
                                            var item = document.createElement('div');
                                            item.style.padding = '4px';

                                            if (arg == "TRUE") {
                                                var url = context.get_postedUrl();
                                                url = url.replace('&amp;', '&');
                                                item.appendChild(createThumbnail2(context, url));
                                            } else {
                                                item.appendChild(createFileInfo2(context));
                                            }

                                            fileList2.appendChild(item);
                                        }

                                        function createFileInfo2(e) {
                                            var holder = document.createElement('div');
                                            holder.appendChild(document.createTextNode(e.get_fileName() + ' with size ' + e.get_fileSize() + ' bytes'));

                                            return holder;
                                        }

                                        function createThumbnail2(e, url) {
                                            var holder = document.createElement('div');
                                            var img = document.createElement("img");
                                            img.style.width = '80px';
                                            img.style.height = '80px';
                                            img.setAttribute("src", url);

                                            holder.appendChild(createFileInfo2(e));
                                            holder.appendChild(img);

                                            return holder;
                                        }

                                        function onClientDalamUploadStart(sender, e) {
                                            document.getElementById('uploadCompleteInfo2').innerHTML = 'Please wait while uploading ' + e.get_filesInQueue() + ' files...';

                                        }

                                        function onClientDalamUploadError(sender, e) {
                                            document.getElementById('uploadCompleteInfo2').innerHTML = "There was an error while uploading.";
                                        }

                                        function onClientDalamUploadCompleteAll(sender, e) {
                                            //alert('upload complete all');
                                            var args = JSON.parse(e.get_serverArguments()),
                                                unit = args.duration > 60 ? 'minutes' : 'seconds',
                                                duration = (args.duration / (args.duration > 60 ? 60 : 1)).toFixed(2);

                                            var info = 'At <b>' + args.time + '</b> server time <b>'
                                                + e.get_filesUploaded() + '</b> of <b>' + e.get_filesInQueue()
                                                + '</b> files were uploaded with status code <b>"' + e.get_reason()
                                                + '"</b> in <b>' + duration + ' ' + unit + '</b>';

                                            document.getElementById('uploadCompleteInfo2').innerHTML = info;
                                        }
                                    </script>
                                    <asp:Label runat="server" ID="throbberDalam" Style="display: none;"><img align="absmiddle" alt="" src="images/uploading.gif" /></asp:Label>
                                        <ajaxToolkit:AjaxFileUpload ID="fuFotoDalam" runat="server" Padding-Bottom="4"
                                        Padding-Left="2" Padding-Right="1" Padding-Top="4" ThrobberID="throbberDalam"
                                        MaxFileSize="1024" MaximumNumberOfFiles="3" AllowedFileTypes="jpg,jpeg,png" 
                                        OnClientUploadComplete="onClientDalamUploadComplete" OnUploadComplete="fuFotoDalam_UploadComplete"
                                        OnClientUploadCompleteAll="onClientDalamUploadCompleteAll" OnUploadCompleteAll="fuFotoDalam_UploadCompleteAll" 
                                        OnUploadStart="fuFotoDalam_UploadStart" OnClientUploadStart="onClientDalamUploadStart" OnClientUploadError="onClientDalamUploadError" />
                                    <div id="uploadCompleteInfo2"></div>
                                    <br />
                                    <div id="testuploaded2" style="display: none; padding: 4px; border: gray 1px solid;">
                                        <h4>list of uploaded files:</h4>
                                        <hr />
                                        <div id="fileList2">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="submit"></label>
                                <div class="col-md-9">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Simpan" OnClick="btnSubmit_Click" />
                                    <%--<button id="submit" name="submit" class="btn btn-primary">Insert</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
