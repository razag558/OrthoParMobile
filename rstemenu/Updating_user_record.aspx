<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="Updating_user_record.aspx.cs" Inherits="rstemenu.Updating_user_record" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div>
        <div class="pagination">
            <div class="page-header">
                <label class="h2">
                    Update User Record
                </label>
            </div>
            <div class="page">

                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">ID</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" Text=" " ID="user_id" CssClass="form-control" ReadOnly="true" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="user_id" ErrorMessage="ID is Needed" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">First Name</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="user_First_name" CssClass="form-control" Text=" " />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="user_First_name" ErrorMessage="First Name is Needed" />

                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">Last Name</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="user_Last_name" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="user_Last_name" ErrorMessage="Last Name is Needed" />

                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">Email</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="username" CssClass="form-control" ReadOnly="true" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="username" ErrorMessage="Email is Needed" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">Country  </asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="user_country" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="user_country" ErrorMessage="Country is Needed" />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">City  </asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="user_City" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="user_City" ErrorMessage="City is Needed" />
                    </div>
                </div>

                <div class="form-group" runat="server" visible="false">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">Email</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="user_Email" CssClass="form-control" TextMode="Email" ReadOnly="true" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="user_Email" ErrorMessage="Email is Needed" />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">Contact No</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="contact_no" CssClass="form-control" TextMode="Phone" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="contact_no" ErrorMessage="Contact Number  is Needed" />

                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">Password</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="user_Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="user_Password" ErrorMessage="password  is Needed" />

                    </div>

                </div>

                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-3 control-label">Account </asp:Label>
                    <div class="col-md-9">
                        <asp:CheckBox runat="server" ID="ch_activating_user" />
                        <asp:Label runat="server"> Active</asp:Label>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 5%;">
                    <asp:Label runat="server" CssClass="col-md-3 control-label"> Admin </asp:Label>
                    <div class="col-md-9">
                        <asp:CheckBox runat="server" ID="chk_MakeAdmin" />
                        <asp:Label runat="server"> Admin</asp:Label>
                    </div>

                </div>

                <div class="form-group" style="margin-bottom: 5%;">
                    <asp:Label runat="server" CssClass="col-md-3 control-label"> Premium </asp:Label>
                    <div class="col-md-9">
                        <asp:CheckBox runat="server" ID="chk_premium" />
                        <asp:Label runat="server"> Yes</asp:Label>
                    </div>

                </div>

            </div>

            <div class="footer">
                <div class="form-group" style="margin-top: 20px;">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" ID="update_record" Text="UPDATE" CssClass="btn btn-default" OnClick="update_record_Click" />
                    </div>
                </div>
                <asp:Label ID="LabelUserError" runat="server" />
            </div>
        </div>


    </div>



</asp:Content>
