<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="Updating_Patient_info.aspx.cs" Inherits="rstemenu.Updating_Patient_info" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="form-horizontal">
        <h1 style="font-size:20px;" >Patient Information</h1>
        <hr />
      </div>
    <div class="text-left" style="margin-left:0% ;" >
            <div class="text-left">
            <asp:Label runat="server"   CssClass="text-primary  control-label">Doctor Name *</asp:Label>
            </div>
    <div class="text-left">
                <asp:TextBox runat="server" ID="doctor_name" CssClass="form-control"   />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger"  ControlToValidate="doctor_name" ErrorMessage="Please Fill Doctor Name" />
              </div>
         
               <div class="text-left">
            <asp:Label runat="server"   CssClass="text-left text-primary control-label">Patient id * </asp:Label>
           </div>
         
    <div class="text-left">
                <asp:TextBox runat="server" ID="pat_id" CssClass="form-control"     />
                <asp:RequiredFieldValidator runat="server" CssClass="text-primary" ControlToValidate="pat_id" ErrorMessage="Please Fill Patient id " />
        </div>
       
     <div class="text-left">
            <asp:Label runat="server"   CssClass="text-left text-primary control-label">Patient Name * </asp:Label>
            </div>
         
    <div class="text-left">
                <asp:TextBox runat="server" ID="pat_name" CssClass="form-control"    />
                 
        </div>
      
        <br />
        <div class="text-left">
            <asp:Label runat="server"  CssClass="text-left text-primary control-label">Entry Date * </asp:Label>
            </div>
         
          <div class="text-left">
                <asp:TextBox runat="server" ID="entry_date" CssClass="form-control" Width="43%"  TextMode="DateTime"   />
                 
            </div>
        <br />
       <div class="text-left">
            <asp:Label runat="server"   CssClass="text-left text-primary control-label">Gender *  </asp:Label>
           </div>
         
    <div class="text-left">
                 <asp:RadioButton Text="  Male" ID="gen_male"  GroupName="gender" runat="server"  />
                 <asp:RadioButton Text="  Female" ID="gen_female"   GroupName="gender" runat="server" style="margin-left:7px;" />
                 
         
                
        </div>
         
         <div class="text-left">
            <asp:Label runat="server"   CssClass="text-left text-primary control-label">Are there any impacted teeth?   </asp:Label>
           </div>
         
    <div class="text-left">
                 <asp:RadioButton  Text="  Yes" ID="impct_yes"  GroupName="impct_teeth" runat="server" />
                 <asp:RadioButton Text="   No" ID="impct_no"   GroupName="impct_teeth" runat="server" style="margin-left:7px;" />
                
         
                
        </div>
        

         <div class="text-left">
            <asp:Label runat="server"   CssClass="text-left text-primary control-label">Are there any missing teeth?   </asp:Label>
           </div>
         
    <div class="text-left">
                 <asp:RadioButton Text="  Yes" ID="missing_yes"  GroupName="missing" runat="server" />
                 <asp:RadioButton Text="  No" ID="missing_no"   GroupName="missing" runat="server" style="margin-left:7px;" />
                
         
                
        </div>
        
        <div class="text-left">
            <asp:Label runat="server"   CssClass="text-left text-primary control-label">Did the patient have any teeth extracted?   </asp:Label>
           </div>
         
    <div class="text-left">
                 <asp:RadioButton Text="  Yes" ID="extracted_yes"  GroupName="extracted" runat="server" />
                 <asp:RadioButton Text="  No" ID="extracted_no"   GroupName="extracted" runat="server" style="margin-left:7px;" />
                
         
                
        </div>
        
            <div class="text-left">
            <asp:Label runat="server"   CssClass="text-left text-primary control-label">Is the patient being providing with a prosthetic replacement for any of the spaces?   </asp:Label>
           </div>
         
    <div class="text-left">
                 <asp:RadioButton Text="  Yes" ID="replacement_yes"  GroupName="replacement" runat="server" />
                 <asp:RadioButton Text="  No" ID="replacement_no"   GroupName="replacement" runat="server" style="margin-left:7px;" />
                
         
                
        </div>
        
         <div class="text-left">
            <asp:Label runat="server"   CssClass="text-left text-primary control-label">Has the patient had any restorative treatment affecting the malocclusion?   </asp:Label>
           </div>
         
    <div class="text-left">
                 <asp:RadioButton Text="  Yes" ID="restorative_yes"  GroupName="restorative" runat="server" />
                 <asp:RadioButton Text="  No" ID="restorative_no"   GroupName="restorative" runat="server" style="margin-left:7px;" />
                
         
                
        </div>
     
            <div class="col-sm-10 text-left" style="margin-top:7px;" >
                <asp:Button runat="server" id="btn_update" Width="100px" Text="Update" CssClass="btn btn-primary" OnClick="btn_update_Click"  />
     
                </div>
             

         
  
    
  </div>
</asp:Content>
