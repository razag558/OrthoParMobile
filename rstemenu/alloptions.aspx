<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="alloptions.aspx.cs" Inherits="rstemenu.alloptions" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">





    <div class="container">
        <asp:Label Text="" runat="server" ID="label_home_option" Font-Size="18px" Style="color: black; text-align: center;"></asp:Label>

    </div>


    <div class="container" style="width: 100%; padding-top: 7%; text-align: center;">

        <div class="col-md-12 col-sm-12 col-xm-12" style="margin-top: 10px;">

            <asp:Button ID="btn_crowding" runat="server" Text="Anterior segments" Width="100%" CssClass="btn btn-primary btn-lg  fa-align-center  " OnClick="btn_crowding_Click"></asp:Button>

            <div class="mt-4" style="margin-top: 10px;">


                <a href="helppage.aspx?id=1&heading=firstbutton" class="col-sm-5 col-xm-5"><span style="font-size: 17px;" class="glyphicon glyphicon-info-sign"></span></a>

                <asp:LinkButton Text="Reset" runat="server" Style="font-size: 17px;" CssClass="col-sm-5 col-xm-5" ID="reset_button" OnClick="reset_button_Click"> </asp:LinkButton>
            </div>

        </div>

        <div class="col-md-12 col-sm-12 col-xm-12" style="margin-top: 10px;">

            <asp:Button ID="btn_occlusion" runat="server" Text="Buccal occlusion" Width="100%" CssClass="btn btn-primary btn-lg fa-align-center " OnClick="btn_occlusion_Click" />

            <div class="mt-4" style="margin-top: 10px;">
                <a href="helppage.aspx?id=11&heading=secondbutton" class="col-sm-5 col-xm-5"><span style="font-size: 17px;" class="glyphicon glyphicon-info-sign"></span></a>

                <asp:LinkButton Text="Reset" runat="server" Style="font-size: 17px;" ID="reset_button2" class="col-sm-5 col-xm-5" OnClick="reset_button2_Click"></asp:LinkButton>

            </div>


        </div>


        <div class="col-md-12 col-sm-12 col-xm-12" style="margin-top: 10px;">

            <asp:Button ID="btn_aoccusion" runat="server" Text="Anterior occlusion (Overjet)" Width="100%" CssClass="btn btn-primary btn-lg fa-align-center  " OnClick="btn_aoccusion_Click" />
            <div class="mt-4" style="margin-top: 10px;">
                <a href="helppage.aspx?id=22&heading=thirdbutton" class="col-sm-5 col-xm-5"><span style="font-size: 17px;" class="glyphicon glyphicon-info-sign  "></span></a>

                <asp:LinkButton Text="Reset" runat="server" Style="font-size: 17px;" ID="reset_button3" CssClass="col-sm-5 col-xm-5" OnClick="reset_button3_Click"></asp:LinkButton>
            </div>

        </div>


        <div class="col-md-12 col-sm-12 col-xm-12" style="margin-top: 10px;">

            <asp:Button ID="btn_boccusion" runat="server" Text="Anterior occlusion (Overbite)" Width="100%" Style="font-size: 12pt !important;" CssClass="btn btn-primary btn-lg  fa-align-center " OnClick="btn_boccusion_Click" />
            <div class="mt-4" style="margin-top: 10px;">
                <a href="helppage.aspx?id=35&heading=fourthbutton" class="col-sm-5 col-xm-5"><span style="font-size: 17px;" class="glyphicon glyphicon-info-sign"></span></a>

                <asp:LinkButton Text="Reset" runat="server" Style="font-size: 17px;" ID="reset_button4" class="col-sm-5 col-xm-5" OnClick="reset_button4_Click"></asp:LinkButton>


            </div>

        </div>


        <div class="col-md-12 col-sm-12 col-xm-12" style="margin-top: 10px;">

            <asp:Button ID="btn_miding" runat="server" Text="Midline" Width="100%" CssClass="btn btn-primary btn-lg  fa-align-center " OnClick="btn_miding_Click" />

            <div class="mt-4" style="margin-top: 10px;">
                <a href="helppage.aspx?id=45&heading=fifthbutton" class="col-sm-5 col-xm-5"><span style="font-size: 17px;" class="glyphicon glyphicon-info-sign"></span></a>

                <asp:LinkButton Text="Reset" runat="server" class="col-sm-5 col-xm-5" Style="font-size: 17px;" ID="reset_button5" OnClick="reset_button5_Click"></asp:LinkButton>


            </div>
        </div>


        <div class="col-md-12 col-sm-12 col-xm-12" style="margin-top: 5%; text-align: center;">
            <asp:Label runat="server" ID="error_show" CssClass="text-danger  text-center" Visible="false" Text="Please Complete all domains to Continue" Width="100%" />

            <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="btn btn-default btn-lg" Width="40%" OnClick="Submit_Click" Style="margin-top: 10px;" />


        </div>

    </div>

</asp:Content>
