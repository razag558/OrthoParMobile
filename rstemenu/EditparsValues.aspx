<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="EditparsValues.aspx.cs" Inherits="rstemenu.EditparsValues" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <h5> Pre Treatment  </h5>

   
    <div class="row">
        <div class="col-sm-6 col-md-3">

            <a> Anterior Segments  (c) </a>
            <asp:TextBox runat="server" CssClass="form-control" id="txt_crowding_a" />
    </div>


        <div class="col-sm-6 col-md-3">

            <a> Buccal Occlussion (f) </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_buccal_f" />
    </div>
    <br />
        </div>
     <div class="row">
      <div class="col-sm-6 col-md-3">

            <a> Overjet (I) </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_overbite_i" />
    </div>
  

     <div class="col-sm-6 col-md-3">

            <a> Overbite (L) </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_overjet_l" />
    </div>
     <br />
           </div>
     <div class="row">

     <div class="col-sm-6 col-md-3">

            <a> midline (n) </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_midline_n" />
    </div>

     <div class="col-sm-6 col-md-3">

            <a> P1 Value </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_p1_value" />
    </div>
         </div>




    <!-- Post Treatment Values -->

        <h5> Post Treatment  </h5>

   
    <div class="row">
        <div class="col-sm-6 col-md-3">

            <a> Anterior Segments  (c) </a>
            <asp:TextBox runat="server" CssClass="form-control" id="txt_crowding_c_2" />
    </div>


        <div class="col-sm-6 col-md-3">

            <a> Buccal Occlussion (f) </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_buccal_f_2" />
    </div>
    <br />
        </div>
     <div class="row">
      <div class="col-sm-6 col-md-3">

            <a> Overjet (I) </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_oberbite_i_2" />
    </div>
  

     <div class="col-sm-6 col-md-3">

            <a> Overbite (L) </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_ovejet_l_2" />
    </div>
     <br />
           </div>
     <div class="row">

     <div class="col-sm-6 col-md-3">

            <a> midline (n) </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_midline_m_2" />
    </div>

     <div class="col-sm-6 col-md-3">

            <a> P2 Value </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_p2" />
    </div>
         </div>



        <!-- Result Values  -->

        <h5> Result Values </h5>

   
    <div class="row">
        <div class="col-sm-6 col-md-3">

            <a>Percentage </a>
            <asp:TextBox runat="server" CssClass="form-control" id="txt_percentage" />
    </div>


        <div class="col-sm-6 col-md-3">

            <a> Point Value </a>
            <asp:TextBox runat="server"  CssClass="form-control" id="txt_point" />
    </div>
    <br />
        </div>

    <div class="row" style="margin-top:20px;" >

        <div class="col-md-5 text-center" >
            <asp:Button runat="server" ID="Update" Text="Update" CssClass="btn btn-primary" OnClick="Update_Click" />
            <asp:Button runat="server" ID="Calculate" Text="Calculate" CssClass="btn btn-primary" OnClick="Calculate_Click" />


        </div>
        

    </div>
 
   
</asp:Content>
