<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="all_patients_record.aspx.cs" EnableEventValidation="false" Inherits="rstemenu.all_patients_record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <div class="row" style="margin-top:100px;">
        <div class="col-xm-6">
            <h1 style="color: #6f7a83; text-align: center; font-family: Georgia, 'Times New Roman', Times, serif;">Patients Record</h1>
        </div>
        <div class="col-xm-8" style="float: right; margin-right: 5%;">
            <div class="btn-group">
                <asp:Button runat="server" Visible="false" ID="download_csv" CssClass="btn btn-default btn-lg" Text="CSV" OnClick="download_csv_Click" Style="margin-right: 5px;" />
                <asp:Button runat="server" Visible="false" ID="Button2" CssClass="btn btn-default btn-lg" Text="PDF" OnClick="download_pdf_Click" />
            </div>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="col-md-12 col-sm-12">


                <div class="table-responsive">
                    <asp:GridView ID="gv_patient_info" Width="100%"
                        OnRowCommand="datatable_RowCommand"
                        OnRowDeleting="datatable_RowDeleting"
                        OnRowDataBound="datatable_RowDataBound"
                        OnPreRender="datatable_PreRender"
                        CssClass="table table-striped jambo_table table-bordered grid-table sorted_table department-grid FixedHeader"
                        runat="server" AutoGenerateColumns="False"  
                        CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="ID" />


                            <asp:TemplateField HeaderText="Patient Name"  ControlStyle-Width="15%">
                                <ItemTemplate>
                                    <a href="Patient_Pars_Values.aspx?id=<%# Eval("id")%>"><%# Eval("pat_name")%>   </a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="doc_name" HeaderText="D Name" />
                            <asp:BoundField DataField="pat_id" HeaderText="P ID" />
                            <asp:BoundField DataField="pat_gender" HeaderText="Gender" />
                            <asp:BoundField DataField="impact_teeth" HeaderText="Impact " />
                            <asp:BoundField DataField="missing_teeth" HeaderText="Missing " />
                            <asp:BoundField DataField="extracted_teeth" HeaderText="Extraction" />
                            <asp:BoundField DataField="replacement_teeth" HeaderText="Replacement" />
                            <asp:BoundField DataField="restorative" HeaderText="Restorative" />
                            <asp:BoundField DataField="entry_date" HeaderText="DateTime" />

                            <asp:TemplateField HeaderText="Edit Values"  >
                                <ItemTemplate>
                                    <a href="Treatment_type.aspx?pat_id=<%# Eval("id")%>"><i class="fa fa-edit"></i></a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit" >
                                <ItemTemplate>
                                    <a href="Updating_Patient_info.aspx?id=<%# Eval("id")%>&patie_id= <%# Eval("pat_id")%>"><i class="fa fa-pencil"></i></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete"  >
                                <ItemTemplate>
                                    <asp:LinkButton ID="btn_Delete" CommandName="Delete" CommandArgument='<%# Eval("id")%>' runat="server" CausesValidation="false"><i class="glyphicon glyphicon-trash"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                          <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#53565D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#2A3F54" Font-Bold="True" ForeColor="White" />
                                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                                    <PagerStyle BackColor="#2A3F54" ForeColor="White" HorizontalAlign="Right" BorderStyle="None" VerticalAlign="Middle" />
                                    <RowStyle BackColor="#E4E4E4" ForeColor="#000000" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                       
                    </asp:GridView>

                </div>


            </div>
        </div>
    </div>
</asp:Content>
