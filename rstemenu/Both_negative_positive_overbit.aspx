<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="Both_negative_positive_overbit.aspx.cs" Inherits="rstemenu.Both_negative_positivee_overbit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container " style="width: 100%; padding-top: 10%;">
        <div class="well" style="text-align: center;">
            <asp:Label Text="Positive Overbite" runat="server" Style="width: 100%;" CssClass="Labelhh" />
        </div>
    </div>
    <div class="container">

        <div class="row  ">
            <div class="col-sm-4  ">
                <asp:RadioButton ID="overbite_positive_s0" Text="Score 0" runat="server" GroupName="overbite_2" />
                <a href="helppage.aspx?id=36&heading=overbitpos0"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>
            <div class="col-sm-4   ">

                <asp:RadioButton ID="overbite_positive_s1" Text="Score 1" runat="server" GroupName="overbite_2" />
                <a href="helppage.aspx?id=37&heading=overbitpos1"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>

        </div>

        <div class="row   ">

            <div class="col-sm-4   ">

                <asp:RadioButton ID="overbite_positive_s2" Text="Score 2" runat="server" GroupName="overbite_2" />


                <a href="helppage.aspx?id=38&heading=overbitpos2"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>
            <div class="col-sm-4   ">

                <asp:RadioButton ID="overbite_positive_s3" Text="Score 3" runat="server" GroupName="overbite_2" />
                <a href="helppage.aspx?id=39&heading=overbitpos3"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>

        </div>

    </div>


    <div class="container " style="width: 92%; margin-top: 80px;">
        <div class="well" style="text-align: center;">
            <asp:Label Text="Negative Overbite" runat="server" Style="width: 100%;" CssClass="Labelhh" />
        </div>
    </div>

    <div class="container">

        <div class="row  ">
            <div class="col-sm-4  ">

                <asp:RadioButton ID="overbite_negative_s0" Text="Score 0" runat="server" GroupName="overbite_1" />

                <a href="helppage.aspx?id=40&heading=overbitneg0"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>


            <div class="col-sm-4   ">

                <asp:RadioButton ID="overbite_negative_s1" Text="Score 1" runat="server" GroupName="overbite_1" />


                <a href="helppage.aspx?id=41&heading=overbitneg1"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>
            <div class="col-sm-4   ">

                <asp:RadioButton ID="overbite_negative_s2" Text="Score 2" runat="server" GroupName="overbite_1" />


                <a href="helppage.aspx?id=42&heading=overbitneg2"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>



        </div>

        <div class="row   ">

            <div class="col-sm-4   ">

                <asp:RadioButton ID="overbite_negative_s3" Text="Score 3" runat="server" GroupName="overbite_1" />


                <a href="helppage.aspx?id=43&heading=overbitneg3"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>
            <div class="col-sm-4   ">

                <asp:RadioButton ID="overbite_negative_s4" Text="Score 4" runat="server" GroupName="overbite_1" />


                <a href="helppage.aspx?id=44&heading=overbitneg4"><span class="glyphicon glyphicon-info-sign"></span></a>
            </div>








        </div>



    </div>


    <div class="container" style="text-align: end; width: 92%; margin-top: 15px;">
        <div class="row">
            <asp:Label runat="server" Width="100%" CssClass="text-danger text-right" ID="showing_error" Text="Please Complete all domains to Continue" Visible="false"></asp:Label>

        </div>
        <asp:Button class="btn btn-primary" Text="SUBMIT" ID="submit_lower_right" runat="server" OnClick="submit_lower_right_Click" />
    </div>
</asp:Content>
