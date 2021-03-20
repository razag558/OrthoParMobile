//Gross Sales Code Start
        $(document).ready(function () {
            var d = new Date();
            var Session = $('[id*="session"]').html();
            var compId = $('[id*="compId"]').html();
            var StartDate = $('[id*="fromDate"]').html();
            var EndDate = $('[id*="toDate"]').html();
            var mon = (1 + d.getMonth());
            if(Session == 'custom'){
                    StartDate = $('[id*="fromDate"]').html()
                    EndDate = $('[id*="toDate"]').html()
                }
            else{
                    StartDate = "";
                    EndDate = "";
                }          
          var SessionDate = $('[id*="lbl_selectdate"]').html();
          var day = (d.getDate());
          var year = d.getFullYear();
            $.ajax({
                url: 'Graphs.asmx/displayGraph',
                data: { month: mon, day: day, year: year, fromDate:StartDate, toDate:EndDate, compID: compId, session: Session },
              //  data: { month: '2', day: '21', year: '2018', fromDate:'', toDate:'', compID: '30', session: 'week' },
                type: 'POST',
                dataType: 'json',
                success: function (data) {
                    var JsonArray = JSON.stringify(data); //Convert Json into array
                    var JsonString = JSON && JSON.parse(JsonArray) || $.parseJSON(JsonArray); //Convets into String
                    var count = JsonString.length;
                    var counter = 0;
                    var LabelResult = [];
                    var DaySession = '';
                    var DataResult = [];
                    if (Session == 'today') {
                    DaySession = "Today";
                        while (count > 0) {
                            LabelResult[counter] = [JsonString[counter].start] + ":00" + " - " + [JsonString[counter].end] + ":00";
                            DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                            if(count > 8){
                                LabelResult[counter] = "0"+[JsonString[counter].start] + ":00" + " - 0" + [JsonString[counter].end] + ":00";
                            }
                            else if(count == 8)
                                LabelResult[counter] = "0"+[JsonString[counter].start] + ":00" + " - " + [JsonString[counter].end] + ":00";
                            else if(count == 1)
                                LabelResult[counter] = [JsonString[counter].start] + ":00" + " - 0" + [JsonString[counter].end] + ":00";
                              //  alert(LabelResult[counter] + " ," + DataResult[counter]);
                           counter++;
                           count--;
                        }
                    }
                    else if (Session == 'week') {
                    DaySession = "Weekly";
                        while (count > 0) {
                            LabelResult[counter] = [JsonString[counter].weekdays];
                            DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                        //    alert(LabelResult[counter] + " ," + DataResult[counter]);
                            counter++;
                            count--;
                        }
                    } 
                    else if (Session == 'month') {
                    DaySession = "Monthly";
                        while (count > 0) {
                            LabelResult[counter] = [JsonString[counter].day];
                            DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                            counter++;
                            count--;
                        }
                    }
                 else if (Session == 'custom') {
                    DaySession = SessionDate;
                   // alert('custom' + Session);
                        while (count > 0) {
                            LabelResult[counter] = [JsonString[counter].day];
                            DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                            counter++;
                            count--;
                        }
                    }
                    var ctx = document.getElementById('LineGraph').getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: LabelResult,
                            datasets: [{
                                label: DaySession,
                                backgroundColor: "rgb(54, 162, 235)",
                                borderColor: "rgb(54, 162, 235)",
                                data: DataResult,
                                fill: false,
                                //backgroundColor: "rgba(153,255,51,0.6)"
                            }]
                        },
                        options: {
                            responsive: true,
                            legend: {
                                display: false
                             },
                             tooltips: {
			                          callbacks: {
					                        label: function(tooltipItem, data) {
						                        var value = data.datasets[0].data[tooltipItem.index];
                                                    if(value > 1000 && value < 100000)
                                                        return "£" + Math.round(value/1000).toFixed(0) + "K";
                                                    else if(value > 1000000 && value < 100000)
                                                        return "£" + Math.round(value/1000).toFixed(0) + "M";
                                                    return "£" + Math.round(value).toFixed(0);
					                        }
			                          } // end callbacks:
			                        },// end tooltips:
                                    title: {
                                        display: true,
                                        text: "Gross Sales Report ( "+DaySession+" )",
                                    },
                                scales: {
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true,
                                            callback: function(value) {
                                                if (value % 1 === 0) {
                                                    if(value > 1000 && value < 100000)
                                                        return "£" + Math.round(value/1000).toFixed(0) + "K";
                                                    else if(value > 1000000 && value < 100000)
                                                        return "£" + Math.round(value/1000).toFixed(0) + "M";
                                                    return "£" + Math.round(value).toFixed(0);
                                                }
                                            }
                                        },// ticks function ends
                                        scaleLabel: {
                                        display: true,
                                        labelString: 'Gross Sales'
                                        }
                                    }]
                            }//Scales end

                        }
                    });
                },
                error: function (request, error) {
                    // This callback function will trigger on unsuccessful action                
                    alert('Error!');
                }
            });

        });
    //<!-- Gross Sales Line Graph End -->
    //----- Kitchen Performance Report Graph -------
        $(document).ready(function () {
            var d = new Date();
            var compId = $('[id*="compId"]').html();
            var Session = $('[id*="session"]').html();
              var StartDate = $('[id*="fromDate"]').html();
              var EndDate = $('[id*="toDate"]').html();
              var mon = (1 + d.getMonth());
                if(Session == 'custom'){
                    StartDate = $('[id*="fromDate"]').html()
                    EndDate = $('[id*="toDate"]').html()
                    }
                else{
                    StartDate = "";
                    EndDate = "";
                    }
          var SessionDate = $('[id*="lbl_selectdate"]').html();
            var da = (d.getDate());
            var y = d.getFullYear();
            $.ajax({
                url: 'Graphs.asmx/displayOrderGraph',
                data: { month: mon, day: da, year: y, fromDate:StartDate, toDate:EndDate, compID: compId , session: Session },
                type: 'POST',
                dataType: 'json',
                success: function (data) {
                    var JsonArray = JSON.stringify(data); //Convert Json into array
                    var JsonString = JSON && JSON.parse(JsonArray) || $.parseJSON(JsonArray); //Convets into String
                    var count = JsonString.length;
                    var counter = 0;
                    var LabelResult = [];
                    var DataResult = [];
                     var DaySession = '';
                    if (Session == 'today') {
                    DaySession = "Hours";
                        while (count > 0) {
                           LabelResult[counter] = [JsonString[counter].start] + ":00" + " - " + [JsonString[counter].end] + ":00";
                            DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                             if(count > 8){
                                LabelResult[counter] = "0"+[JsonString[counter].start] + ":00" + " - 0" + [JsonString[counter].end] + ":00";
                            }
                            else if(count == 8)
                                LabelResult[counter] = "0"+[JsonString[counter].start] + ":00" + " - " + [JsonString[counter].end] + ":00";
                            else if(count == 1)
                                LabelResult[counter] = [JsonString[counter].start] + ":00" + " - 0" + [JsonString[counter].end] + ":00";
                            counter++;
                            count--;
                        }
                    }
                    else if (Session == 'week') {
                    DaySession = "Weekly";
                        while (count > 0) {
                            LabelResult[counter] = [JsonString[counter].weekdays];
                            DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                            counter++;
                            count--;
                        }
   
                    }
                    else if (Session == 'month') {
                    DaySession = "Monthly";
                        while (count > 0) {
                            LabelResult[counter] = [JsonString[counter].day];
                            DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                            counter++;
                            count--;
                        }
   
                    }
                    else if (Session == 'custom') {
                    DaySession = SessionDate;
                        while (count > 0) {
                            LabelResult[counter] = [JsonString[counter].day];
                            DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                            counter++;
                            count--;
                        }
   
                    }
 //                   alert('week' + Session);
                    /*while (count > 0) {
                    LabelResult[counter] = [JsonString[counter].start] + " - " + [JsonString[counter].end];
                    DataResult[counter] = parseFloat(Math.round([JsonString[counter].total] * 100) / 100).toFixed(2);
                    counter++;
                    count--;
                    }*/
                    var ctx = document.getElementById('kitLineGraph').getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: LabelResult,
                            datasets: [{
                                label:  DaySession,
                                backgroundColor: "rgb(54, 162, 235)",
                                borderColor: "rgb(54, 162, 235)",
                                data: DataResult,
                                fill: false,
                                //backgroundColor: "rgba(153,255,51,0.6)"
                            }]
                        },
                        options: {
                        responsive: true,
                        legend: {
                            display: false
                         },
                            tooltips: {
			                      callbacks: {
					                    label: function(tooltipItem, data) {
						                    var value = data.datasets[0].data[tooltipItem.index];
                                                if(value > 60)
        						                    return Math.round(value/60).toFixed(0) + " hr";
		    				                    return Math.round(value).toFixed(0) + " m";
					                    }
			                      } // end callbacks:
			                    },// end tooltips:
                            title: {
                                display: false
                            },
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true,
                                        callback: function(value) {
                                            if (value % 1 === 0) {
                                                if(value > 60)
        						                    return Math.round(value/60).toFixed(0) + " hr";
                                            return value + " m";
                                            }
                                        }
                                    },
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Minutes'
                                        }

                                }],

                            },
                            title: {
                                        display: true,
                                        text: "Kitchen  ( "+DaySession+" )",
                                    },
                        }
                    });
                },
                error: function (request, error) {
                    // This callback function will trigger on unsuccessful action                
                    alert('Error!');
                }
            });

        });
   //<!-- kitchen Order Performance Line Graph -->

   //Donut Shape Graphs

       // <!-- Payment Split Donut Graph Start -->
        $(document).ready(function () {
            var label = [];
            var labelData = [];
            var grossSalesCard = $('[id*="lbl_GrossCardSale"]').html();
            var grossSalesCash = $('[id*="lbl_GrosscashSale"]').html();
            if(grossSalesCash > 0 || grossSalesCard > 0){
                label[0] = "Cash Payment";
                label[1] = "Card Payment";
                labelData[0] = grossSalesCard;
                labelData[1] = grossSalesCash;
            }
            //-------------------------------
    var plugin;
    var clr = "";
    if(label.length === 0 && labelData.length === 0){
            label[0] =  "No data available";
            labelData[0] = 1;
            clr = "gray";
            plugin = {
                afterDatasetsDraw: function(chartInstance, easing) {
                if (chartInstance.config.type == "doughnut") {
                    var ctx = chartInstance.chart.ctx;
                    var sum = 0;
                    chartInstance.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.getDatasetMeta(i);
                        if (!meta.hidden) {
                            meta.data.forEach(function(element, index) {
                                ctx.fillStyle = 'white';

                                var fontSize = 15;
                                var fontStyle = 'normal';
                                var fontFamily = 'Helvetica Neue';
                       
                                ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
                                var dataString = chartInstance.data.labels[index];
          //                      var dataString2 = dataset.data[index];

                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'middle';

                                var padding = 5;
                                var position = element.tooltipPosition();
                                ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
        //                        ctx.fillText(dataString2, position.x, position.y - (fontSize / 2) - padding + fontSize);
                                sum += dataset.data[index];
                            });
                        }
                    });
                }
            }
        }//end of plugin
            optionsUsingPlugin2 = {
                        legend: {
                              display:false,
                            },
	                    tooltips: {enabled: false},
                        hover: {mode: null},
                    }
       }
       else{
            optionsUsingPlugin2 = {
                    responsive: true,
                        legend: {
                              position: "bottom",
                              tooltips: {enabled: false},
                            },
                    tooltips: {
                        callbacks: {
                            label: function (tooltipItem, data) {
                                var value = data.datasets[0].data[tooltipItem.index];
                                return "£" + value;
                            }
                        } // end callbacks:
                    } // end tooltips:
                        }
        }//end of else statement

            //------------------------------
            var ctx = document.getElementById("myChart2").getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                plugins: plugin,
                data: {
                    labels: label,
                    datasets: [{
                        data: labelData,
                        backgroundColor: ["#2ecc71","#3498db"]
                    }]
                },
                options: optionsUsingPlugin2,
                

            });
      });
    // <!---------------------------------------- Payment Split Donut Graph End ----------------------------------------------------->


  //<!----------------------------------------- Top 5 Selling Items Donut Graph Start -------------------------->
        $(document).ready(function () {
            var StartDate = $('[id*="startDate"]').html();
            var fromdate = $('[id*="fromDate"]').html();
            var todate = $('[id*="toDate"]').html();
            var Session = $('[id*="session"]').html();
            var compId = $('[id*="compId"]').html();
            $.ajax({
                url: 'Graphs.asmx/TopSelling4Items',
                data: { SearchType: Session, currentdate: StartDate, startdate: fromdate, enddate: todate, CompID: compId, ClientID: '0' },
                type: 'POST',
                dataType: 'json',
                success: function (data) {
                    var JsonArray = JSON.stringify(data); //Convert Json into array
                    var JsonString = JSON && JSON.parse(JsonArray) || $.parseJSON(JsonArray); //Convets into String
                    var count = JsonString.length;
                    var counter = 0;
                    var LabelResult = [];
                    var tempLabel = [];
                    var DataResult = [];
                    while (count > 0) {
                   if([JsonString[counter].itemName].toString().length > 13)
                        LabelResult[counter] = [JsonString[counter].itemName].toString().substr(0, 13) + "..";
                  else
 //                 else if([JsonString[counter].itemName].toString().length <= 14)
//                       var len = [JsonString[counter].itemName].toString().length;
                        LabelResult[counter] = [JsonString[counter].itemName].toString();
                        tempLabel[counter] = [JsonString[counter].itemName];
                        DataResult[counter] = [JsonString[counter].qty];
                        counter++;
                        count--;
                    }
    //Function to display full name on Mouse Hover
    function DisplayFullNames(arr, str) {
     var subst = "";
     if(str.toString().length > 13){
            subst = str.toString().substr(0,13);
            for (var i = 0; i < arr.length; i++) {
                if(arr[i].toString().match(subst)){
                    return arr[i].toString();
                    break;
                }
            }
        }else
        return str;

}
 //---------------------------

 //Function to add spaces
 function addSpaces(arr) {
        for (var i = 0; i < arr.length; i++) {
            if(arr[i].toString().length < 10){
            var len = 13 - arr[i].toString().length;
                for (var s = 0; s < len; s++) {
                    arr[i] += " ";
                }
            }
        }
        return arr;
    }
    //end of spacing functions
    
//    LabelResult = addSpaces(LabelResult);

     
var plg = {
afterDraw: function (chart) {
                if (chart.data.datasets[0].data.length === 0) {
                    // No data is present
                    var ctx = chart.chart.ctx;
                    var width = chart.chart.width;
                    var height = chart.chart.height
                    chart.clear();

                    ctx.save();
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'middle';
                    ctx.font = "40px normal 'Helvetica Nueue'";
                    ctx.fillText('No data to display', width / 2, height / 2);
                    ctx.restore();
                }

            }
}
    
    //data when there is no data available
    var plugin;
    var clr = "";
    if(LabelResult.length == 0 && DataResult.length == 0){
            LabelResult[0] = "No data available";
            DataResult[0] = 1;
            clr = "gray";
            plugin = {
                afterDatasetsDraw: function(chartInstance, easing) {
                if (chartInstance.config.type == "doughnut") {
                    var ctx = chartInstance.chart.ctx;
                    var sum = 0;
                    chartInstance.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.getDatasetMeta(i);
                        if (!meta.hidden) {
                            meta.data.forEach(function(element, index) {
                                ctx.fillStyle = 'white';

                                var fontSize = 15;
                                var fontStyle = 'normal';
                                var fontFamily = 'Helvetica Neue';
                       
                                ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
                                var dataString = chartInstance.data.labels[index];
          //                      var dataString2 = dataset.data[index];

                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'middle';

                                var padding = 5;
                                var position = element.tooltipPosition();
                                ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
        //                        ctx.fillText(dataString2, position.x, position.y - (fontSize / 2) - padding + fontSize);
                                sum += dataset.data[index];
                            });
                        }
                    });
                }
            }
        }//end of plugin
            optionsUsingPlugin1 = {
                        legend: {
                              display:false,
                            },
	                    tooltips: {enabled: false},
                        hover: {mode: null},
                    }
       }
       else{
                plugin = {
                afterDatasetsDraw: function(chartInstance, easing) {
                if (chartInstance.config.type == "doughnut") {
                    var ctx = chartInstance.chart.ctx;
                    var sum = 0;
                    chartInstance.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.getDatasetMeta(i);
                        if (!meta.hidden) {
                            meta.data.forEach(function(element, index) {
                                ctx.fillStyle = 'white';

                                var fontSize = 15;
                                var fontStyle = 'normal';
                                var fontFamily = 'Helvetica Neue';
                       
                                ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
          //                      var dataString = chartInstance.data.labels[index];
                                var dataString2 = dataset.data[index];

                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'middle';

                                var padding = 5;
                                var position = element.tooltipPosition();
        //                        ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
                                ctx.fillText(dataString2, position.x, position.y - (fontSize / 2) - padding + fontSize);
                                sum += dataset.data[index];
                            });
                        }
                    });
                }
            }
        }
// end of plugin
       clr = '';
            optionsUsingPlugin1 = {
                        legend: {
                                   position: "bottom",
                                   onClick: function(event, legendItem) {},
                                   //display:false,
                                    // And any other config options you are already using
                                    },
                        tooltips: {
	                        callbacks: {
		                                label: function(tooltipItem, data) {
				                        var value = data.datasets[0].data[tooltipItem.index];
                                        var str = data.labels[tooltipItem.index];
                                        var fullItemNames = DisplayFullNames(tempLabel, str);
                                          return  fullItemNames + " : " + Math.round(value).toFixed(0);
				                               }
			                            } // end callbacks:
			                       },// end tooltips:
                        }
        }//end of else statement

                    //-----------------------------
                    var ctx = document.getElementById("myChart").getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: 'doughnut',
                        plugins: plugin,
                        data: {
//                            labels:LabelResult,
                              labels:LabelResult,
                            datasets: [{
                                data: DataResult,
                                backgroundColor: [
                                    "#46BFBD",
                                    "#F7464A",
                                    "#FDB45C",
                                    "#2ecc71",
                                    "#3498db",
                                      ]
                            }]
                        },
                        options: optionsUsingPlugin1,
                    });
                },
                error: function (request, error) {
                    // This callback function will trigger on unsuccessful action                
                    alert('Error!');
                }
            });
        });
    //<!-- Top 5 Selling Items Donut Graph end -->
   
   /*

        $(document).ready(function () {
            var StartDate = $('[id*="startDate"]').html();
            var fromdate = $('[id*="fromDate"]').html();
            var todate = $('[id*="toDate"]').html();
            var Session = $('[id*="session"]').html();
            var CompId = "30";// $.trim($('[id*="Label5"]').html());
            $.ajax({
                url: 'Graphs.asmx/TopSelling4Items',
                data: { SearchType: Session, currentdate: StartDate, startdate: fromdate, enddate: todate, CompID: '30', ClientID: '0' },
                type: 'POST',
                dataType: 'json',
                success: function (data) {
                    var JsonArray = JSON.stringify(data); //Convert Json into array
                    var JsonString = JSON && JSON.parse(JsonArray) || $.parseJSON(JsonArray); //Convets into String
                    var count = JsonString.length;
                    var counter = 0;
                    var LabelResult = [];
                    var DataResult = [];
                    while (count > 0) {
                        LabelResult[counter] = [JsonString[counter].itemName];
                        DataResult[counter] = [JsonString[counter].qty];
                        counter++;
                        count--;
                    }
                    //alert(JsonString[1].itemName + " parse");
                    //alert(LabelResult + " array");
                    // alert('Worked');

                    //----------------
                    var inc = 0;
                    Chart.defaults.doughnutLabels = Chart.helpers.clone(Chart.defaults.doughnut);

var helpers = Chart.helpers;
var defaults = Chart.defaults;

Chart.controllers.doughnutLabels = Chart.controllers.doughnut.extend({
	updateElement: function(arc, index, reset) {
    var _this = this;
    var chart = _this.chart,
        chartArea = chart.chartArea,
        opts = chart.options,
        animationOpts = opts.animation,
        arcOpts = opts.elements.arc,
        centerX = (chartArea.left + chartArea.right) / 2,
        centerY = (chartArea.top + chartArea.bottom) / 2,
        startAngle = opts.rotation, // non reset case handled later
        endAngle = opts.rotation, // non reset case handled later
        dataset = _this.getDataset(),
        circumference = reset && animationOpts.animateRotate ? 0 : arc.hidden ? 0 : _this.calculateCircumference(dataset.data[index]) * (opts.circumference / (2.0 * Math.PI)),
        innerRadius = reset && animationOpts.animateScale ? 0 : _this.innerRadius,
        outerRadius = reset && animationOpts.animateScale ? 0 : _this.outerRadius,
        custom = arc.custom || {},
        valueAtIndexOrDefault = helpers.getValueAtIndexOrDefault;
    helpers.extend(arc, {
      // Utility
      _datasetIndex: _this.index,
      _index: index,

      // Desired view properties
      _model: {
        x: centerX + chart.offsetX,
        y: centerY + chart.offsetY,
        startAngle: startAngle,
        endAngle: endAngle,
        circumference: circumference,
        outerRadius: outerRadius,
        innerRadius: innerRadius,
        label: valueAtIndexOrDefault(dataset.label, index, chart.data.labels[index])
      },

      draw: function () {
      	var ctx = this._chart.ctx,
						vm = this._view,
						sA = vm.startAngle,
						eA = vm.endAngle,
						opts = this._chart.config.options;
				
					var labelPos = this.tooltipPosition();
					var segmentLabel = vm.circumference / opts.circumference * 100;
					
					ctx.beginPath();
					
					ctx.arc(vm.x, vm.y, vm.outerRadius, sA, eA);
					ctx.arc(vm.x, vm.y, vm.innerRadius, eA, sA, true);
					
					ctx.closePath();
					ctx.strokeStyle = vm.borderColor;
					ctx.lineWidth = vm.borderWidth;
					
					ctx.fillStyle = vm.backgroundColor;
					
					ctx.fill();
					ctx.lineJoin = 'bevel';
					
					if (vm.borderWidth) {
						ctx.stroke();
					}
					
					if (vm.circumference > 0.15) { // Trying to hide label when it doesn't fit in segment
						ctx.beginPath();
						ctx.font = helpers.fontString(opts.defaultFontSize, opts.defaultFontStyle, opts.defaultFontFamily);
						ctx.fillStyle = "#fff";
						ctx.textBaseline = "top";
						ctx.textAlign = "center";
                    
                    // Round percentage in a way that it always adds up to 100%
					ctx.fillText(segmentLabel.toFixed(0) + "%", labelPos.x, labelPos.y);
					}
      }
    });

    var model = arc._model;
    model.backgroundColor = custom.backgroundColor ? custom.backgroundColor : valueAtIndexOrDefault(dataset.backgroundColor, index, arcOpts.backgroundColor);
    model.hoverBackgroundColor = custom.hoverBackgroundColor ? custom.hoverBackgroundColor : valueAtIndexOrDefault(dataset.hoverBackgroundColor, index, arcOpts.hoverBackgroundColor);
    model.borderWidth = custom.borderWidth ? custom.borderWidth : valueAtIndexOrDefault(dataset.borderWidth, index, arcOpts.borderWidth);
    model.borderColor = custom.borderColor ? custom.borderColor : valueAtIndexOrDefault(dataset.borderColor, index, arcOpts.borderColor);

    // Set correct angles if not resetting
    if (!reset || !animationOpts.animateRotate) {
      if (index === 0) {
        model.startAngle = opts.rotation;
      } else {
        model.startAngle = _this.getMeta().data[index - 1]._model.endAngle;
      }

      model.endAngle = model.startAngle + model.circumference;
    }

    arc.pivot();
  }
});

var config = {
  type: 'doughnutLabels',
  data: {
    datasets: [{
      data: DataResult,
      backgroundColor: [
        "#F7464A",
        "#46BFBD",
        "#FDB45C",
        "#949FB1",
        "#4D5360",
      ],
      label: 'Dataset 1'
    }],
    labels: LabelResult
  },
  options: {
    responsive: true,
    legend: {
      position: 'top',
    },
    animation: {
      animateScale: true,
      animateRotate: true
    }
  }
};

var ctx = document.getElementById("myChart").getContext("2d");
new Chart(ctx, config);





                    //---------------
                    
                },
                error: function (request, error) {
                    // This callback function will trigger on unsuccessful action                
                    alert('Error!');
                }
            });
        });


    //--------------------------------------------
   */