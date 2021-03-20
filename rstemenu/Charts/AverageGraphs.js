    //<!-- Average item per order start code-->
          $(document).ready(function () {
                var labelItemOrder = [];
              var labelDataItemOrder = [];
              var AvgItemPerorder = $('[id*="lbl_AvgItemPerorder"]').html();
              var MaxItems = $('[id*="MaxItemsSale"]').html();
            if(AvgItemPerorder > 0 || MaxItems > 0){
                labelItemOrder[0] = "Max Items Order";
                labelItemOrder[1] = "Avg Items Per Order";
               var AvgPerItem=0;
               var MaxPerItem=0;
               var sum = parseInt(MaxItems) + parseInt(AvgItemPerorder);
                 if(sum > 100 )
                  {
                      AvgPerItem = (AvgItemPerorder * (100/MaxItems));
                      MaxPerItem = (MaxItems*100/MaxItems) - AvgPerItem; 
                  }else if((sum)<=100)
                  {
                      AvgPerItem = (AvgItemPerorder * (100/100));
                      MaxPerItem = (MaxItems*100/100) - AvgPerItem; 
                  }
                   labelDataItemOrder[0] = MaxPerItem.toFixed(0);
                   labelDataItemOrder[1] = AvgPerItem.toFixed(0);
                }
              var items = "item";
              if(AvgItemPerorder > 1 || AvgItemPerorder == 0)
                     items = "items";
/*              Chart.pluginService.register({
                  beforeDraw: function (chart) {
                      if (chart.config.options.elements.center) {
                          //Get ctx from string
                          var ctx = chart.chart.ctx;

                          //Get options from the center object in options
                          var centerConfig = chart.config.options.elements.center;
                          var fontStyle = centerConfig.fontStyle || 'Arial';
                          var txt = centerConfig.text;
                          var color = centerConfig.color || '#000';
                          var sidePadding = centerConfig.sidePadding || 20;
                          var sidePaddingCalculated = (sidePadding / 100) * (chart.innerRadius * 2)
                          //Start with a base font of 30px
                          ctx.font = "30px " + fontStyle;

                          //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
                          var stringWidth = ctx.measureText(txt).width;
                          var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

                          // Find out how much the font can grow in width.
                          var widthRatio = elementWidth / stringWidth;
                          var newFontSize = Math.floor(30 * widthRatio);
                          var elementHeight = (chart.innerRadius * 2);

                          // Pick a new font size so it will not be larger than the height of label.
                          var fontSizeToUse = Math.min(newFontSize, elementHeight);

                          //Set font settings to draw it correctly.
                          ctx.textAlign = 'center';
                          ctx.textBaseline = 'middle';
                          
                          var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
                          var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
                          ctx.font = fontSizeToUse + "px " + fontStyle;
                          ctx.fillStyle = color;

                          //Draw text in center
                          ctx.fillText(txt, centerX, centerY);
                      }
                  }
              });
              var config = {
                  type: 'doughnut',
                  data: {
                      labels: [
				  "Max Items Order",
                  "Avg Items Per Order"
				],
                      datasets: [{
//                         data: [MaxItems, AvgItemPerorder],
                           data: [50, 10],
                          backgroundColor: [
					   "#F0F0F0",
                      "#0099CC",
					],
                          hoverBackgroundColor: [
					   "#F0F0F0",
                      "#0099CC",
					]
                      }]
                  },
                  options: {
                      elements: {
                          center: {
                              text: '' + AvgItemPerorder + ' ' + items,
                              color: '#FF6384', // Default is #000000
                              fontStyle: 'Arial', // Default is Arial
                              sidePadding: 20 // Defualt is 20 (as a percentage)
                          }
                      },
                      responsive: true,
                        legend: {
                            display: false
                         },
                  }
              };
              var ctx = document.getElementById("avgperitem").getContext("2d");
              var myChart = new Chart(ctx, config);
              */

              //---------------------------------

              	// round corners
	/*Chart.pluginService.register({
		afterUpdate: function (chart) {
			if (chart.config.options.elements.arc.roundedCornersFor !== undefined) {
				var arc = chart.getDatasetMeta(0).data[chart.config.options.elements.arc.roundedCornersFor];
				arc.round = {
					x: (chart.chartArea.left + chart.chartArea.right) / 2,
					y: (chart.chartArea.top + chart.chartArea.bottom) / 2,
					radius: (chart.outerRadius + chart.innerRadius) / 2,
					thickness: (chart.outerRadius - chart.innerRadius) / 2 - 1,
					backgroundColor: arc._model.backgroundColor
				}
			}
		},

		afterDraw: function (chart) {
			if (chart.config.options.elements.arc.roundedCornersFor !== undefined) {
				var ctx = chart.chart.ctx;
				var arc = chart.getDatasetMeta(0).data[chart.config.options.elements.arc.roundedCornersFor];
				var startAngle = Math.PI / 2 - arc._view.startAngle;
				var endAngle = Math.PI / 2 - arc._view.endAngle;

				ctx.save();
				ctx.translate(arc.round.x, arc.round.y);
				console.log(arc.round.startAngle)
				ctx.fillStyle = arc.round.backgroundColor;
				ctx.beginPath();
				ctx.arc(arc.round.radius * Math.sin(startAngle), arc.round.radius * Math.cos(startAngle), arc.round.thickness, 0, 2 * Math.PI);
				ctx.arc(arc.round.radius * Math.sin(endAngle), arc.round.radius * Math.cos(endAngle), arc.round.thickness, 0, 2 * Math.PI);
				ctx.closePath();
				ctx.fill();
				ctx.restore();
			}
		},
	});*/

	// write text plugin
   /* var plugin_inside_graph = {
                   beforeDraw: function (chart) {
                      if (chart.config.options.elements.center) {
                          //Get ctx from string
                          var ctx = chart.chart.ctx;

                          //Get options from the center object in options
                          var centerConfig = chart.config.options.elements.center;
                          var fontStyle = centerConfig.fontStyle || 'Arial';
                          var txt = centerConfig.text;
                          var color = centerConfig.color || '#000';
                          var sidePadding = centerConfig.sidePadding || 20;
                          var sidePaddingCalculated = (sidePadding / 100) * (chart.innerRadius * 2)
                          //Start with a base font of 30px
                          ctx.font = "30px " + fontStyle;

                          //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
                          var stringWidth = ctx.measureText(txt).width;
                          var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

                          // Find out how much the font can grow in width.
                          var widthRatio = elementWidth / stringWidth;
                          var newFontSize = Math.floor(30 * widthRatio);
                          var elementHeight = (chart.innerRadius * 2);

                          // Pick a new font size so it will not be larger than the height of label.
                          var fontSizeToUse = Math.min(newFontSize, elementHeight);

                          //Set font settings to draw it correctly.
                          ctx.textAlign = 'center';
                          ctx.textBaseline = 'middle';
                          var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
                          var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
                          ctx.font = fontSizeToUse + "px " + fontStyle;
                          ctx.fillStyle = color;

                          //Draw text in center
                          ctx.fillText(txt, centerX, centerY);
                      }
                  }
        }*/
//--- Plugins and Options---------
    var plugin1;
    var clr = "";
    if(labelItemOrder.length === 0 && labelDataItemOrder.length === 0){
            labelItemOrder[0] =  "No data available";
            labelDataItemOrder[0] = 1;
            clr = "gray";
            plugin1 = {
                afterDatasetsDraw: function(chartInstance, easing) {
                if (chartInstance.config.type == "doughnut") {
                    var ctx = chartInstance.chart.ctx;
                    var sum = 0;
                    chartInstance.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.getDatasetMeta(i);
                        if (!meta.hidden) {
                            meta.data.forEach(function(element, index) {
                                ctx.fillStyle = '#FF6384';
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
       }else{
             optionsUsingPlugin1 = {
                               legend: {
                        display:false,
                    },
              tooltips: {
                     callbacks: {
                            label: function(tooltipItem, data) {
                                var value = data.datasets[0].data[tooltipItem.index];
                                var str = data.labels[tooltipItem.index];
                                    if(str.toString() == "Max Items Order")
                                        return  "Max Items: " + MaxItems;
                                    else
                                        return  "Avg Items: " + AvgItemPerorder;
		                        }
    	                   } // end callbacks:
                    },// end tooltips:
			elements: {
				arc: {
					roundedCornersFor: 0
				},
				center: {
					// the longest text that could appear in the center
                             text: '' + AvgItemPerorder + ' ' + items,
                               color: '#FF6384', // Default is #000000
                              fontStyle: 'Arial', // Default is Arial
                              sidePadding: 20 // Defualt is 20 (as a percentage)
				},
			}
                    }
             plugin1 = {
                  beforeDraw: function (chart) {
                      if (chart.config.options.elements.center) {
                          //Get ctx from string
                          var ctx = chart.chart.ctx;

                          //Get options from the center object in options
                          var centerConfig = chart.config.options.elements.center;
                          var fontStyle = centerConfig.fontStyle || 'Arial';
                          var txt = centerConfig.text;
                          var color = centerConfig.color || '#000';
                          var sidePadding = centerConfig.sidePadding || 20;
                          var sidePaddingCalculated = (sidePadding / 100) * (chart.innerRadius * 2)
                          //Start with a base font of 30px
                          ctx.font = "30px " + fontStyle;

                          //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
                          var stringWidth = ctx.measureText(txt).width;
                          var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

                          // Find out how much the font can grow in width.
                          var widthRatio = elementWidth / stringWidth;
                          var newFontSize = Math.floor(30 * widthRatio);
                          var elementHeight = (chart.innerRadius * 2);

                          // Pick a new font size so it will not be larger than the height of label.
                          var fontSizeToUse = Math.min(newFontSize, elementHeight);

                          //Set font settings to draw it correctly.
                          ctx.textAlign = 'center';
                          ctx.textBaseline = 'middle';
                          var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
                          var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
                          ctx.font = fontSizeToUse + "px " + fontStyle;
                          ctx.fillStyle = color;

                          //Draw text in center
                          ctx.fillText(txt, centerX, centerY);
                      }
                  }

             }


       }

//-------------------------------
	var config = {
		type: 'doughnut',
        plugins: plugin1,
		data: {
                      labels: labelItemOrder,
			datasets: [{
				data: labelDataItemOrder,
                          backgroundColor: [
					   "#F0F0F0",
                      "#0099CC",
					],
                          hoverBackgroundColor: [
					   "#F0F0F0",
                      "#0099CC",
					]
			}]
		},
		options:optionsUsingPlugin1, 

	};
		var ctx = document.getElementById("avgperitem").getContext("2d");
		var myChart = new Chart(ctx, config);
              //-----------------------------------

          });
    //<!-- Average item per order end code-->

   // <!-- Avg Sale Perorder Start Code -->
          $(document).ready(function () {
           var CurrencySign = $('[id*="CurrencySign"]').html();
              var labelSaleOrder = [];
              var labelDataSaleOrder = [];
              var AvgSalePerorder = $('[id*="lbl_AvgSalePerorder"]').html();
              var TotalGrosssale = $('[id*="MaxSales"]').html();
            if(AvgSalePerorder > 0 || TotalGrosssale > 0){
                labelSaleOrder[0] = "Maximum Sale Per Order";
                labelSaleOrder[1] = "Average Sale Per Order";
                //labelDataSaleOrder[0] = TotalGrosssale;
               // labelDataSaleOrder[1] = AvgSalePerorder;
               var AvgPerSale=0;
               var MaxPerSale=0;
               var sum = parseInt(TotalGrosssale) + parseInt(AvgSalePerorder);
                 if(sum > 100 )
                  {
                      AvgPerSale = (AvgSalePerorder * (100/TotalGrosssale));
                      MaxPerSale = (TotalGrosssale*100/TotalGrosssale) - AvgPerSale; 
                  }else if((sum)<=100)
                  {
                      AvgPerSale = (AvgSalePerorder * (100/100));
                      MaxPerSale = (TotalGrosssale*100/100) - AvgPerSale; 
                  }
                   labelDataSaleOrder[0] = MaxPerSale.toFixed(0);
                   labelDataSaleOrder[1] = AvgPerSale.toFixed(0);
                }

    var plugin;
    var clr = "";
    if(labelSaleOrder.length === 0 && labelDataSaleOrder.length === 0){
            labelSaleOrder[0] =  "No data available";
            labelDataSaleOrder[0] = 1;
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
                                ctx.fillStyle = '#FF6384';
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
       }else{
             optionsUsingPlugin1 = {
                                              elements: {
                          center: {
                              text: CurrencySign + AvgSalePerorder,
                              color: '#FF6384', // Default is #000000
                              fontStyle: 'Arial', // Default is Arial
                              sidePadding: 20 // Defualt is 20 (as a percentage)
                          }
                      },
                      responsive: true,
                        legend: {
                            display: false
                         },
                        tooltips: {
			                          callbacks: {
					                        label: function(tooltipItem, data) {
					                        var value = data.datasets[0].data[tooltipItem.index];
                                            var str = data.labels[tooltipItem.index];
                                                if(str.toString() == "Maximum Sale Per Order")
                                                       return "Max Sale: " + CurrencySign + Math.round(TotalGrosssale).toFixed(2);
                                                else
                                                       return "Avg Sale: " + CurrencySign + Math.round(AvgSalePerorder).toFixed(2);
					                        }
			                          } // end callbacks:
			                        },// end tooltips:
                    }
             plugin = {
                  beforeDraw: function (chart) {
                      if (chart.config.options.elements.center) {
                          //Get ctx from string
                          var ctx = chart.chart.ctx;

                          //Get options from the center object in options
                          var centerConfig = chart.config.options.elements.center;
                          var fontStyle = centerConfig.fontStyle || 'Arial';
                          var txt = centerConfig.text;
                          var color = centerConfig.color || '#000';
                          var sidePadding = centerConfig.sidePadding || 20;
                          var sidePaddingCalculated = (sidePadding / 100) * (chart.innerRadius * 2)
                          //Start with a base font of 30px
                          ctx.font = "30px " + fontStyle;

                          //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
                          var stringWidth = ctx.measureText(txt).width;
                          var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

                          // Find out how much the font can grow in width.
                          var widthRatio = elementWidth / stringWidth;
                          var newFontSize = Math.floor(30 * widthRatio);
                          var elementHeight = (chart.innerRadius * 2);

                          // Pick a new font size so it will not be larger than the height of label.
                          var fontSizeToUse = Math.min(newFontSize, elementHeight);

                          //Set font settings to draw it correctly.
                          ctx.textAlign = 'center';
                          ctx.textBaseline = 'middle';
                          var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
                          var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
                          ctx.font = fontSizeToUse + "px " + fontStyle;
                          ctx.fillStyle = color;

                          //Draw text in center
                          ctx.fillText(txt, centerX, centerY);
                      }
                  }

             }


       }
              var config = {
                  type: 'doughnut',
                  plugins: plugin,
                  data: {
                      labels: labelSaleOrder,
                      datasets: [{
                         data: labelDataSaleOrder,
                          backgroundColor: [
					  "#F0F0F0",
                      "#FF6D31",
					],
                          hoverBackgroundColor: [
					   "#F0F0F0",
                      "#FF6D31",
					]
                      }]
                  },
                  options:optionsUsingPlugin1,
              };


              var ctx = document.getElementById("AvgSalePerorder").getContext("2d");
              var myChart = new Chart(ctx, config);

          });
   // <!-- Avg Sale Perorder end -->
        //<!-- Average Processing Time Start Code-->
          $(document).ready(function () {
              var label = [];
              var labelData = [];
              var AvgOrderProcessingTime = $('[id*="AvgOrderProcessingTime"]').html();
              var MaxMinutes = $('[id*="MaxMinutes"]').html();
           

               if(AvgOrderProcessingTime > 0 || MaxMinutes > 0){
                label[0] = "Maximum Processing Time";
                label[1] = "Average Processing Time";
                labelData[0] = MaxMinutes;
                labelData[1] = AvgOrderProcessingTime;
               var AvgPerSale=0;
               var MaxPerSale=0;
               var sum = parseInt(MaxMinutes) + parseInt(AvgOrderProcessingTime);
                 if(sum > 100 )
                  {
                      AvgPerSale = (AvgOrderProcessingTime * (100/MaxMinutes));
                      MaxPerSale = (MaxMinutes*100/MaxMinutes) - AvgPerSale; 
                  }else if((sum)<=100)
                  {
                      AvgPerSale = (AvgOrderProcessingTime * (100/100));
                      MaxPerSale = (MaxMinutes*100/100) - AvgPerSale; 
                  }
                   labelData[0] = MaxPerSale;
                   labelData[1] = AvgPerSale;
                }



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
                                ctx.fillStyle = '#FF6384';
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
       }else{
             optionsUsingPlugin2 = {
                        elements: {
                          center: {
                              text: '' + AvgOrderProcessingTime + ' Minutes',
                              color: '#FF6384', // Default is #000000
                              fontStyle: 'Arial', // Default is Arial
                              sidePadding: 20 // Defualt is 20 (as a percentage)
                          }
                      },
                      responsive: true,
                        legend: {
                            display: false
                         },
                           tooltips: {
			                          callbacks: {
					                        label: function(tooltipItem, data) {
					                        var value = data.datasets[0].data[tooltipItem.index];
                                            var str = data.labels[tooltipItem.index];
                                                if(str.toString() == "Maximum Processing Time"){
                                                    if(value > 1)
                                                       return "Max time: " + MaxMinutes + " Minutes";
                                                    else
                                                       return "Max time: " + MaxMinutes + " Minute";
                                                  }else{
                                                    if(value > 1)
                                                       return "Avg time: " + AvgOrderProcessingTime + " Minutes";
                                                    else
                                                       return "Avg time: " + AvgOrderProcessingTime + " Minute";
                                                  }
				                        }
			                          } // end callbacks:
			                        },// end tooltips:
                        }
             plugin = {
                  beforeDraw: function (chart) {
                      if (chart.config.options.elements.center) {
                          //Get ctx from string
                          var ctx = chart.chart.ctx;

                          //Get options from the center object in options
                          var centerConfig = chart.config.options.elements.center;
                          var fontStyle = centerConfig.fontStyle || 'Arial';
                          var txt = centerConfig.text;
                          var color = centerConfig.color || '#000';
                          var sidePadding = centerConfig.sidePadding || 20;
                          var sidePaddingCalculated = (sidePadding / 100) * (chart.innerRadius * 2)
                          //Start with a base font of 30px
                          ctx.font = "30px " + fontStyle;

                          //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
                          var stringWidth = ctx.measureText(txt).width;
                          var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

                          // Find out how much the font can grow in width.
                          var widthRatio = elementWidth / stringWidth;
                          var newFontSize = Math.floor(30 * widthRatio);
                          var elementHeight = (chart.innerRadius * 2);

                          // Pick a new font size so it will not be larger than the height of label.
                          var fontSizeToUse = Math.min(newFontSize, elementHeight);

                          //Set font settings to draw it correctly.
                          ctx.textAlign = 'center';
                          ctx.textBaseline = 'middle';
                          var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
                          var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
                          ctx.font = fontSizeToUse + "px " + fontStyle;
                          ctx.fillStyle = color;

                          //Draw text in center
                          ctx.fillText(txt, centerX, centerY);
                      }
                  }

             }


       }
              //-----------------
              var config = {
                  type: 'doughnut',
                  plugins: plugin,
                  data: {
                      labels: label,
                      datasets: [{
                             data: labelData,
                          backgroundColor: [
					  "#F0F0F0",
					  "#FF9900",
					],
                          hoverBackgroundColor: [
					  "#F0F0F0",
					  "#FF9900",
					]
                      }]
                  },
                  options: optionsUsingPlugin2,         
                   };
              var ctx = document.getElementById("AvgOrderProcessingTime").getContext("2d");
              var myChart = new Chart(ctx, config);

          });
        //<!-- Average Processing Time End -->
