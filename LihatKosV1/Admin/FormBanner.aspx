<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormBanner.aspx.cs" Inherits="LihatKosV1.Admin.FormBanner" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(function () {
            //$(".ajax__fileupload_footer").hide();
            $("#btnTambah").click(function () {
                $('#ContentPlaceHolder1_fuFotoBanner_UploadOrCancelButton').click();
            });
        });
</script> 
    <div style="margin-top:20px;"></div>
        <div class="container">
            <div class="row col-md-6 custyle">
                <div class="card mb-12">
                <h2>Form Banner</h2>
                <asp:Button ID="btnAddBanner" runat="server" Text="Add Banner" OnClick="btnAddBanner_Click" Visible="true" />
                <asp:UpdatePanel ID="UpdatePanelGrid" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="viewBanner" runat="server">
                            <div class="card-block p-0">
                                <asp:GridView ID="gvBanner" runat="server" CssClass="table table-striped custab"
                                    AutoGenerateColumns="false" OnRowDataBound="gvBanner_RowDataBound" 
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvBanner_PageIndexChanging" >
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" />
                                        <asp:BoundField DataField="Nama" HeaderText="Label" />
                                        <asp:BoundField DataField="FilePath" HeaderText="File" />
                                        <asp:BoundField DataField="Url" HeaderText="Url" />
                                        <asp:BoundField DataField="Prioritas" HeaderText="Prioritas" />
                                        <asp:TemplateField HeaderText="Action" HeaderStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" OnCommand="lbtnEdit_Command" runat="server" CssClass="btn btn-info btn-xs" OnClientClick="return confirm('Apakah Anda yakin ingin mengubah banner ini?');">Edit</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnDelete" OnCommand="lbtnDelete_Command" runat="server" CssClass="btn btn-danger btn-xs"  OnClientClick="return confirm('Apakah Anda yakin ingin menghapus banner ini?');">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Width="140px"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanelPopup" runat="server">
                    <ContentTemplate>
                        <script type="text/javascript">

                            function onClientBannerUploadComplete(sender, e) {
                                //if (sender._filesInQueue[sender._filesInQueue.length - 1]._isUploaded)
                                //    __doPostBack('UpdatePanelFoto', '');
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
                                img.style.width = '179px';
                                img.style.height = '80px';
                                img.setAttribute("src", url);

                                holder.appendChild(createFileInfo1(e));
                                holder.appendChild(img);

                                return holder;
                            }

                            function onClientBannerUploadStart(sender, e) {
                                document.getElementById('uploadCompleteInfo').innerHTML = 'Please wait while uploading ' + e.get_filesInQueue() + ' files...';

                            }

                            function onClientBannerUploadError(sender, e) {
                                document.getElementById('uploadCompleteInfo').innerHTML = "There was an error while uploading.";
                            }

                            function onClientBannerUploadCompleteAll(sender, e) {
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
                        <asp:Button ID="btn1" runat="server" Style="display:none;" />
                        <cc1:ModalPopupExtender ID="MPEForm" runat="server" TargetControlID="btn1" DropShadow="true" PopupControlID="pnlForm" 
                            CancelControlID="btnClose" BackgroundCssClass="modalBackground" />
                        <asp:Panel ID="pnlForm" runat="server" Style="display:none;background-color: #ffffff;width:900px;border-radius: 6px;background-clip: padding-box;overflow-y:auto;">
                            <div class="modal-header">
                                <asp:Button ID="btnClose" CssClass="close" runat="server" Text="x" />
                                <h3><asp:Literal ID="litPopupTitle" runat="server"></asp:Literal></h3>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-xs-11">
                                        <div class="well">
                                        <%--<div class="form-group">
                                            <label>Kode</label>
                                            <asp:TextBox ID="txtKode" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>--%>
                                        <div class="form-group">
                                            <label>Label</label>
                                            <asp:TextBox ID="txtNama" runat="server" CssClass="form-control"></asp:TextBox>
                                            <label>Prioritas</label>
                                            <asp:TextBox ID="txtPrioritas" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Url</label>
                                            <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Agar hasil maksimal, gunakan gambar dengan ukuran 1900x849 px </label>
                                            
                                                    <asp:Label runat="server" ID="throbberBanner" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif" /></asp:Label>
                                                    <ajaxToolkit:AjaxFileUpload ID="fuFotoBanner" runat="server" Padding-Bottom="4"
                                                    Padding-Left="2" Padding-Right="1" Padding-Top="4" ThrobberID="throbberBanner"
                                                    MaxFileSize="4096" Mode="Client" MaximumNumberOfFiles="1" AllowedFileTypes="jpg,jpeg,png,tiff"
                                                    OnClientUploadComplete="onClientBannerUploadComplete" OnUploadComplete="fuFotoBanner_UploadComplete"
                                                    OnClientUploadCompleteAll="onClientBannerUploadCompleteAll" OnUploadCompleteAll="fuFotoBanner_UploadCompleteAll"
                                                    OnUploadStart="fuFotoBanner_UploadStart" OnClientUploadStart="onClientBannerUploadStart" OnClientUploadError="onClientBannerUploadError" />
                                    
                                                    <asp:Label ID="uploadCompleteInfo" runat="server" ClientIDMode="Static" />
                                                    <div id="testuploaded" style="display: block; padding: 4px; border: gray 1px solid;">
                                                        <h4>list of uploaded files:</h4>
                                                        <hr />
                                                        <div style="border:0.5px dotted black;">
                                                            <asp:GridView ID="gvFileList" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="false"
                                                                 ShowHeader="true" ShowFooter="false" GridLines="None" OnRowDataBound="gvFileList_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Image" ItemStyle-Width="30%">
                                                                        <ItemTemplate>
                                                                            <div style="padding:4px;">
                                                                                <asp:Image ID="imgFile" runat="server" Style="width:179px;height:80px;" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--<asp:TemplateField HeaderText="Default" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="btnDefault" runat="server" Text="Default" />
                                                                            <asp:Literal ID="litStatus" runat="server"></asp:Literal>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField ItemStyle-Width="55%">
                                                                        <ItemTemplate>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                        </div>
                                        
                                        <asp:LinkButton ID="btnTambah" runat="server" CssClass="btn btn-info" 
                                            OnClick="btnTambah_Click" ClientIDMode="Static">Tambah</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
