

    
function bubbleChart() {

    var _chart = {};

    var _width = 440, _height = 400,
        _margins = { top: 70, left: 30, right: 0, bottom: 50 },
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
var pretreatment = document.getElementById('<%= pretreatment.ClientID %>').innerHTML;
var posttreatment = document.getElementById('<%= posttreatment.ClientID %>').innerHTML;
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
