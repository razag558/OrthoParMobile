<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="all_patients_record.aspx.cs" EnableEventValidation="false" Inherits="rstemenu.all_patients_record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
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

    <div runat="server">

        <asp:Panel ID="panelid1" runat="server" ScrollBars="Auto">

            <asp:GridView ID="gv_patient_info" Width="100%" OnRowCommand="datatable_RowCommand" OnRowDeleting="datatable_RowDeleting" CssClass="table table-striped jambo_table table-bordered grid-table sorted_table department-grid" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>

                    <asp:TemplateField HeaderText="ID" HeaderStyle-ForeColor="Maroon" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="10%">
                        <ItemTemplate>
                            <%# Eval("id")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Patient Name" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="15%">
                        <ItemTemplate>
                            <a href="Patient_Pars_Values.aspx?id=<%# Eval("id")%>"><%# Eval("pat_name")%>   </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Doctor Name" SortExpression="suburb, street" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="15%">
                        <ItemTemplate>
                            <%# Eval("doc_name")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Patient ID" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="5%">
                        <ItemTemplate>
                            <%# Eval("pat_id")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Patient Gender" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="5%">
                        <ItemTemplate>
                            <%# Eval("pat_gender")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Impact Teeth" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="5%">
                        <ItemTemplate>
                            <%# Eval("impact_teeth")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Missing Teeth" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="5%">
                        <ItemTemplate>
                            <%# Eval("missing_teeth")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Extracted Teeth" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="5%">
                        <ItemTemplate>
                            <%# Eval("extracted_teeth")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Replacement Teeth" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="5%">
                        <ItemTemplate>
                            <%# Eval("replacement_teeth")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Restorative Teeth" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="5%">
                        <ItemTemplate>
                            <%# Eval("restorative")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Entry Date" HeaderStyle-ForeColor="Maroon" ControlStyle-Width="5%">
                        <ItemTemplate>
                            <%# Eval("entry_date")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pars Values" HeaderStyle-ForeColor="Maroon">
                        <ItemTemplate>
                            <a href="Treatment_type.aspx?pat_id=<%# Eval("id")%>"><i class="fa fa-pencil"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit" HeaderStyle-ForeColor="Maroon">
                        <ItemTemplate>
                            <a href="Updating_Patient_info.aspx?id=<%# Eval("id")%>&patie_id= <%# Eval("pat_id")%>"><i class="fa fa-pencil"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" HeaderStyle-ForeColor="Maroon">
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_Delete" CommandName="Delete" CommandArgument='<%# Eval("id")%>' runat="server" CausesValidation="false"><i class="glyphicon glyphicon-trash"></i></asp:LinkButton>
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
        </asp:Panel>
    </div>
    </center>
</asp:Content>
