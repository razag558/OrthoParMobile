<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="~/all_users.aspx.cs" Inherits="rstemenu.all_users" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header text-center">
        <h3>Registered Doctor List </h3>
    </div>

    <div class="row text-center">
        <div class="col-md-12 ">
            <div class="table-responsive">

                <asp:GridView ID="gv_all_user" Width="100%"
                    OnRowDeleting="datatable_RowDeleting"
                    OnRowCommand="datatable_RowCommand"
                    OnRowDataBound="datatable_RowDataBound"
                    OnPreRender="datatable_PreRender" 
                    allowpaging="true" 
                    CssClass="table table-striped jambo_table table-bordered grid-table sorted_table department-grid FixedHeader"
                    runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CellPadding="4" ForeColor="#333333"
                    GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>

                        <asp:BoundField DataField="username" HeaderText="UserName" />
                        <asp:BoundField DataField="id" HeaderText="ID" Visible="false" />
                        <asp:BoundField DataField="first_name" HeaderText="First Name"   />
                        <asp:BoundField DataField="last_name" HeaderText="Last Name"  />
                        <asp:BoundField DataField="email" HeaderText="Email"  />
                        <asp:BoundField DataField="city" HeaderText="City"  />
                        <asp:BoundField DataField="country" HeaderText="Country"  />
                        <asp:BoundField DataField="phone_number" HeaderText="Phone Number"  />
                 
                        <asp:TemplateField  HeaderText="Edit">
                            <ItemTemplate>
                                <a href="Updating_user_record.aspx?id=<%# Eval("id")%>"><i class="fa fa-pencil"></i></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="btn_Delete" CommandName="Delete" CommandArgument='<%# Eval("id") +";"+Eval("username")%> ' runat="server" CausesValidation="false"><i class="glyphicon glyphicon-trash"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#000000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000000" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#000000" ForeColor="White" HorizontalAlign="Right" BorderStyle="None" VerticalAlign="Middle" />
                    <RowStyle BackColor="#E4E4E4" ForeColor="#000000" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </div>
        </div>
    </div>
</asp:Content>
