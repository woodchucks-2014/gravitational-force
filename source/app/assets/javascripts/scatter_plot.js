function showScatterPlot(data, all_data) {
      // just to have some space around items.
      var margins = {
              "left": 100,
              "right": 100,
              "top": 100,
              "bottom": 100
      };

      var width = 550;
      var height = 550;

      // this will be our colour scale. An Ordinal scale.
      var colors = d3.scale.category10();

      // we add the SVG component to the scatter-load div
      var svg = d3.select("#scatter-load").append("svg").attr("width", width).attr("height", height).append("g")
          .attr("transform", "translate(" + margins.left + "," + margins.top + ")");

      // this sets the scale that we're using for the X axis.
      // the domain define the min and max variables to show. In this case, it's the min and max prices of items.
      // this is made a compact piece of code due to d3.extent which gives back the max and min of the price variable within the dataset
      var x = d3.scale.linear()
          .domain([0,100])

      // the range maps the domain to values from 0 to the width minus the left and right margins (used to space out the visualization)
      .range([0, width - margins.left - margins.right]);

      // this does the same as for the y axis but maps from the rating variable to the height to 0.
      var y = d3.scale.linear()
          .domain([0,100])
      // Note that height goes first due to the weird SVG coordinate system
      .range([height - margins.top - margins.bottom, 0]);

      // we add the axes SVG component. At this point, this is just a placeholder. The actual axis will be added in a bit
      svg.append("g").attr("class", "x axis").attr("transform", "translate(0," + y.range()[0] + ")");
      svg.append("g").attr("class", "y axis");

      // this is our X axis label. Nothing too special to see here.
      svg.append("text")
          .attr("fill", "#414241")
          .attr("text-anchor", "end")
          .attr("x", (width - margins.left) / 2)
          .attr("y", height - margins.top - 65)
          .text(all_data.skill_1_name);

      svg.append("text")
          .attr("class", "y label")
          .attr("text-anchor", "end")
          .attr("x", -90)
          .attr("y", -50)
          .attr("dy", ".75em")
          .attr("transform", "rotate(-90)")
          .text(all_data.skill_2_name)


      // this is the actual definition of our x and y axes. The orientation refers to where the labels appear - for the x axis, below or above the line, and for the y axis, left or right of the line. Tick padding refers to how much space between the tick and the label. There are other parameters too - see https://github.com/mbostock/d3/wiki/SVG-Axes for more information
      var xAxis = d3.svg.axis().scale(x).orient("bottom").tickPadding(2);
      var yAxis = d3.svg.axis().scale(y).orient("left").tickPadding(2);

      // this is where we select the axis we created a few lines earlier. See how we select the axis item. in our svg we appended a g element with a x/y and axis class. To pull that back up, we do this svg select, then 'call' the appropriate axis object for rendering.
      svg.selectAll("g.y.axis").call(yAxis);
      svg.selectAll("g.x.axis").call(xAxis);

      // now, we can get down to the data part, and drawing stuff. We are telling D3 that all nodes (g elements with class node) will have data attached to them. The 'key' we use (to let D3 know the uniqueness of items) will be the name. Not usually a great key, but fine for this example.
      var user = svg.selectAll("g.node").data(data, function (d) {
          return d.x;
      });

      // we 'enter' the data, making the SVG group (to contain a circle and text) with a class node. This corresponds with what we told the data it should be above.

      var userGroup = user.enter().append("g").attr("class", "node")
      // this is how we set the position of the items. Translate is an incredibly useful function for rotating and positioning items
      .attr('transform', function (d) {
          return "translate(" + x(d.x) + "," + y(d.y) + ")";
      });

      // we add our first graphics element! A circle!
      
       userGroup.append("circle")
          .attr("r", function(d) {return d.size})
          .attr("class", "dot") 
          .attr("id", function(d, i) { if(i===0){
                                        return 'self';
                                        }
                                        if(i===1){
                                        return 'users';
                                        }})
          .style("fill", function (d) {
          // remember the ordinal scales? We use the colors scale to get a colour for our manufacturer. Now each node will be coloured
          // by who makes the chocolate.
          return colors(d.z);
      });

      // now we add some text, so we can see what each item is.
      userGroup.append("text")
          .style("text-anchor", "middle")
          .attr("dy", -10)
          .text(function (d) {
          // this shouldn't be a surprising statement.
          return d.z;
      });

      var line = d3.svg.line()
        .x(function(d){return x(d.x);})
        .y(function(d){return y(d.y);})
        .interpolate("basis");

      svg.append("path")
        .attr("d", function(d) { return line(data)})
        .attr("transform", "translate(0,0)")
        .style("stroke-width", 2)
        .style("stroke", "black")
        .style("fill", "none");

  }
