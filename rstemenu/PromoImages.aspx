<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="PromoImages.aspx.cs" Inherits="rstemenu.PromoImages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        function ShowImagePreview(input) {

            $("#gallery").empty();
            for (var i = 0; i < input.files.length; i++) {
                if (input.files && input.files[i]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {

                        var image = jQuery('<div/>', {
                            id: 'some-id' + i,
                            "class": 'col-md-3',
                            "height": '300',
                        }).appendTo('#gallery');
                        $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(image).css("width", 300).css("margin-right", 40).css("height", 300);
                    }
                    reader.readAsDataURL(input.files[i]);
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="well text-center" style="margin: 10px;">
        <h3 style="font-family: Arial, Helvetica, sans-serif;">Promotion Images</h3>
    </div>

    <div class="row" style="margin: 20px;">
        <div class="col-md-12">
            <div id="gallery">
            </div>
        </div>
    </div>
   <%-- <div class="row" style="margin: 20px;">

        <div class="col-md-4">
            <asp:FileUpload ID="flupImage" runat="server" CssClass="btn btn-success" onchange="ShowImagePreview(this);" />
        </div>

        <div class="col-md-6">
            <asp:Button ID="btnSavephoto" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="UploadImage" />
        </div>

    </div>--%>


    <div style="margin-top: 20px; ">
            <div class="table-responsive">
                <asp:GridView ID="datatable" Width="100%" class="table table-striped jambo_table table-bordered grid-table sorted_table department-grid"
                    runat="server" AutoGenerateColumns="False"
                    OnRowCommand="datatable_RowCommand" OnRowDeleting="datatable_RowDeleting"
                    OnRowDataBound="datatable_RowDataBound" OnPreRender="datatable_PreRender"
                    ClientIDMode="Static" CellPadding="4" ForeColor="#333333"
                    GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>

                        <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="60px" >
                            <ItemTemplate>
                                <img src='http://orthopar.org//images/<%# Eval("ImageName")%>' alt="" width="80" />
                            </ItemTemplate>
                            <ControlStyle Width="65px"></ControlStyle>
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image TYpe" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="60px">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("ImageType")%>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="65px"></ControlStyle>
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Added By" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="150px"  >
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("UserName")%>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Selected" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label runat="server"  ID="chk_use"   />
                            </ItemTemplate>
                            <ControlStyle Width="80px"></ControlStyle>
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:TemplateField>

                        <%-- --%>
                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" CommandName="Delete" 
                                    CommandArgument='<%#Eval("ID")+","+ Eval("ImageName")%>'> <i class="fa fa-trash" style="font-size:15px;" aria-hidden="true"> </i> </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Use" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>

                                <asp:LinkButton ID="btn_use" runat="server" CausesValidation="false" CommandName="Use"
                                    CommandArgument='<%# Eval("ID") %>'> <i class="fa fa-check-circle" style="font-size:15px;" aria-hidden="true"></i> </asp:LinkButton>



                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#53565D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#2A3F54" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E4E4E4" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
        </div>
   



</asp:Content>
