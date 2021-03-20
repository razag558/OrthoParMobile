﻿<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="Patient_Pars_Values.aspx.cs" Inherits="rstemenu.Patient_Pars_Values" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/html2canvas.min.js"></script>
    <link href="CSS/GraphDesign.css" rel="stylesheet" />
    <script type="text/javascript">
        function ConvertToImage(btnExport) {
            html2canvas(document.getElementById('<% =contentcontrol.ClientID %>')).then(function (canvas) {
                var base64 = canvas.toDataURL();
                $("[id*=hdnImageData]").val(base64);
                __doPostBack(btnExport.name, "");
            });
            return false;
        }
    </script>
    <div class="row" style="margin-top: 100px;">
        <div class="col-xm-6" style="text-align: center;">
            <h3 style="color: #6f7a83; text-align: center; font-family: Georgia,'Times New Roman', Times, serif;">Completer Result 
                <asp:LinkButton Font-Size="Large" Text="( help )" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" />
            </h3>
        </div>
        <div class="row text-center">
            <asp:Label runat="server" ID="email_response_show" Width="100%" CssClass="text-danger" Style="font-size: 18px;" />
        </div>
        <div class="col-xm-6" style="float: right;">
            <div class="btn-group">
                <asp:Button runat="server" Visible="false" ID="download_csb" CssClass="btn btn-default btn-lg" Text="CSV" OnClick="download_csv_Click" Style="margin-right: 5px;" />
                <asp:Button runat="server" ID="Button1" Width="100px" CssClass="btn btn-default btn-lg" Text="Email" Style="margin-right: 5px;" OnClick="Button1_Click" />
                <asp:Button runat="server" ID="Button2" CssClass="btn btn-default btn-lg" Text="PDF " Visible="false" OnClick="download_pdf_Click" Style="margin-right: 10px;" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xm-6"></div>
        <div class="col-xm-6" style="float: right; margin-top: 2%; margin-right: 6%;">
            <asp:Panel runat="server" ID="sendid" Visible="false">
                <asp:TextBox runat="server" ID="txb_email" CssClass="form-control"></asp:TextBox>
                <div class="text-center" style="margin-top: 2%;">
                    <asp:Button runat="server" ID="btn_send_email" CssClass="btn btn-danger" Text="Send Mail" UseSubmitBehavior="false" OnClick="btn_send_email_Click" OnClientClick="return ConvertToImage(this)" />
                </div>
            </asp:Panel>
        </div>
    </div>
    <div class="text-left" style="width: 100%; margin-top: 3%;">
        <div style="display: none;">
            <asp:Label runat="server" Font-Size="16px" ID="lbl_prvalue"></asp:Label>
            <asp:Label runat="server" Font-Size="16px" ID="lbl_povalue"></asp:Label>
        </div>
        <asp:Label runat="server" Text="" Font-Size="16px" ID="pretreatment_value"></asp:Label>
        <br />
        <asp:Label runat="server" Text="" Font-Size="16px" ID="Label1"></asp:Label>
        <br />
        <asp:Label runat="server" Text="" Font-Size="16px" ID="Label2"></asp:Label>
        <br />
        <asp:Label runat="server" Text="" Font-Size="16px" ForeColor="Red" ID="point_result"></asp:Label>
        <br />
        <asp:Label runat="server" Text="" Font-Size="16px" ID="Label3"></asp:Label>
        <asp:LinkButton Text="(help)" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" />
        <br />
        <asp:Label runat="server" Text="" ForeColor="Red" Font-Size="16px" ID="Label4"></asp:Label>
        <br />
    </div>
    <div id="contentcontrol" runat="server" style="width: 100%; height: 600px; margin-top: 50px; padding: 4%;">
        <div class="col-md-2 col-sm-2 col-xm-2" runat="server" >
            <svg width="20%" height="350" viewBox="0 0 200 150">
                <path d="m 100,0 0,150" />
                <text x="100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100" y="50 80 110 140 170 200 230 260 290 320 350 380 410 440 470 500" color="blue"
                    style="font-size: 35px; text-anchor: middle; color: blue;">Post treatment</text>
            </svg>
        </div>
        <div class="col-md-10 col-sm-10 col-xm-10" id="chart_class">
            <div class="col-md-10 col-sm-10 col-xm-10 text-center">
                <h4 style="color: blue;">PAR Nomogram</h4>
            </div>
            <svg class="col-md-10 col-sm-10 col-xm-10" id="chart_svg" height="400px">
            </svg>
            <div class="col-md-10 col-sm-10 col-xm-10 text-left" style="margin-left:100px;" >
                <asp:Label runat="server" Font-Size="15px" Style="color: blue;" Text="Pre treatment"></asp:Label>
            </div>
        </div>
    </div>
    <asp:Label runat="server" ID="pretreatment" Style="color: white;">
    </asp:Label>
    <asp:Label runat="server" ID="posttreatment" Style="color: white;" />
    <asp:HiddenField ID="hdnImageData" runat="server" />
    <script src="Charts/ChartCreatingFile.js"></script>
    <script src="Scripts/Ajax.min.js"></script>
    <script type="text/javascript">
        function bubbleChart() {
            var _chart = {};
            var _width = 310, _height = 400,
                _margins = { top: 30, left: 30, right: 0, bottom: 30 },
                _x, _y, _r, // <-A
                _data = [],
                _colors = d3.scale.category10(),
                _svg,
                _bodyG;
            _chart.render = function () {
                if (!_svg) {
                    _svg = d3.select(document.getElementById("chart_svg"));
                    renderAxes(_svg);
                    defineBodyClip(_svg);
                }
                renderBody(_svg);
            };
            function renderAxes(svg) {
                var axesG = svg.append("g")
                    .attr("class", "axes");
                var xAxis = d3.svg.axis()
                    .scale(_x.range([0, quadrantWidth()]))
                    .orient("bottom");
                var yAxis = d3.svg.axis()
                    .scale(_y.range([quadrantHeight(), 0]))
                    .orient("left");
                axesG.append("g")
                    .attr("class", "axis")
                    .attr("transform", function () {
                        return "translate(" + xStart() + "," + yStart() + ")";
                    })
                    .call(xAxis);
                axesG.append("g")
                    .attr("class", "axis")
                    .attr("transform", function () {
                        return "translate(" + xStart() + "," + yEnd() + ")";
                    })
                    .call(yAxis);
            }
            function defineBodyClip(svg) {
                var padding = 0;
                svg.append("defs")
                    .append("clipPath")
                    .attr("id", "body-clip")
                    .append("rect")
                    .attr("x", 0)
                    .attr("y", 0)
                    .attr("width", quadrantWidth() + 2 * padding)
                    .attr("height", quadrantHeight());
            }
            function renderBody(svg) {
                if (!_bodyG)
                    _bodyG = svg.append("g")
                        .attr("class", "body")
                        .attr("transform", "translate("
                            + xStart()
                            + ","
                            + yEnd() + ")")
                        .attr("clip-path", "url(#body-clip)");
                renderBubbles();
            }
            function renderBubbles() {
                _r.range([0, 50]); // <-B
                _data.forEach(function (list, i) {
                    _bodyG.selectAll("circle._" + i)
                        .data(list)
                        .enter()
                        .append("circle") // <-C
                        .attr("class", "bubble _" + i);
                    _bodyG.selectAll("circle._" + i)
                        .data(list)
                        .style("stroke", function (d, j) {
                            return _colors(j);
                        })
                        .style("fill", function (d, j) {
                            return _colors(j);
                        })
                        .transition()
                        .attr("cx", function (d) {
                            return _x(d.x); // <-D
                        })
                        .attr("cy", function (d) {
                            return _y(d.y); // <-E
                        })
                        .attr("r", function (d) {
                            return _r(d.r); // <-F
                        });
                });
            }
            function xStart() {
                return _margins.left;
            }
            function yStart() {
                return _height - _margins.bottom;
            }
            function xEnd() {
                return _width - _margins.right;
            }
            function yEnd() {
                return _margins.top;
            }
            function quadrantWidth() {
                return _width - _margins.left - _margins.right;
            }
            function quadrantHeight() {
                return _height - _margins.top - _margins.bottom;
            }
            _chart.width = function (w) {
                if (!arguments.length) return _width;
                _width = w;
                return _chart;
            };
            _chart.height = function (h) {
                if (!arguments.length) return _height;
                _height = h;
                return _chart;
            };
            _chart.margins = function (m) {
                if (!arguments.length) return _margins;
                _margins = m;
                return _chart;
            };
            _chart.colors = function (c) {
                if (!arguments.length) return _colors;
                _colors = c;
                return _chart;
            };
            _chart.x = function (x) {
                if (!arguments.length) return _x;
                _x = x;
                return _chart;
            };
            _chart.y = function (y) {
                if (!arguments.length) return _y;
                _y = y;
                return _chart;
            };
            _chart.r = function (r) {
                if (!arguments.length) return _r;
                _r = r;
                return _chart;
            };
            _chart.addSeries = function (series) {
                _data.push(series);
                return _chart;
            };
            return _chart;
        }
        var numberOfSeries = 1,
            numberOfDataPoint = 11,
            data = [];
        var pretreatment = document.getElementById('<%=pretreatment.ClientID %>').innerHTML;
        var posttreatment = document.getElementById('<%=posttreatment.ClientID %>').innerHTML;
        // Bubble Loop
        for (var i = 0; i < numberOfSeries; ++i)
            data.push(d3.range(numberOfDataPoint).map(function (i) {
                return { x: pretreatment, y: posttreatment, r: 4 };
            }));
        //first line loop
        var k = 0;
        for (var b = 0; b < 1; b += 3)
            data.push(d3.range(0, 70, 1.5).map(function (b) {
                k++;
                return { x: b, y: k, r: 1 };
            }));
        //second line loop
        var j = 0;
        for (var i = 22; i < 100; i += 2)
            data.push(d3.range(22, 70, 1.1).map(function (i) {
                j++;
                return { x: i, y: j, r: 1 };
            }));
        var chart = bubbleChart()
            .x(d3.scale.linear().domain([0, 70]))
            .y(d3.scale.linear().domain([0, 45]))
            .r(d3.scale.pow().exponent(2).domain([0, 10]));
        data.forEach(function (series) {
            chart.addSeries(series);
        });
        chart.render();
    </script>

</asp:Content>
