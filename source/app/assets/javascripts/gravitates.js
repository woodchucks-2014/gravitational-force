
$(document).ready(function() {
  var methods = ['perception', 'individual', 'accurate', 'deluded'];
  var gdata = ''
  $("#graph_it").submit(function(e){
    $('#scatter-load').html("")
    $('#filters').html("")
      e.preventDefault();

      $.post('/gravitate', $("#graph_it").serialize(), 'json')

        .done(function(data){
          gdata = data;
          users = makeUsers(data);
          showScatterPlot(users, data);

          $("#filters").html("<h2>" + gdata.skill_1_name + " and " + gdata.skill_2_name + "</h2>")
          $.each(methods, function(i, method){
            randNum = Math.floor((Math.random() * 10000) + 1 * i);
            $("#filters").append("<button id =" + method + randNum + ">" + method + "</button>")
            $("#filters").on("click", "#"+method+randNum, function(e){

              $.get('/filter_request/'+method, {skill_1: gdata.trait_1_id, skill_2: gdata.trait_2_id}, 'json')

                .done(function(data){
                  gdata = data;
                  users = makeUsers(data);
                  $('#scatter-load').html("")
                  showScatterPlot(users, data);
                })
          })
        })
  });
});

  $('#scatter-load').on('click', '#self', function(e){
    $('#dot_data').html("")
    $('#dot_data').append(gdata.name + " self-rated "+gdata.skill_1_name+": "+ gdata.self_score_1+"<br>")
    if(gdata.skill_1_name != gdata.skill_2_name){
      $('#dot_data').append(gdata.name + " self-rated "+gdata.skill_2_name+": "+ gdata.self_score_2+"<br>")
    }
  })
  $('#scatter-load').on('click', '#users', function(e){
    $('#dot_data').html("")
    $('#dot_data').html(gdata.num_votes_1+" users rated "+gdata.name+" a "+ gdata.user_score_1 + " in " + gdata.skill_1_name + "<br>");
    if(gdata.skill_1_name != gdata.skill_2_name){
    $('#dot_data').append(gdata.num_votes_2+" users rated "+gdata.name+" a "+ gdata.user_score_2 + " in " + gdata.skill_2_name + "<br>");
    }
  })
  $('#scatter-load').on('click', '#me', function(e){
    $('#dot_data').html("")
    $('#dot_data').html("You rated "+gdata.name+" a "+ gdata.my_score_1 + " in " + gdata.skill_1_name + "<br>");
    if(gdata.skill_1_name != gdata.skill_2_name){
      $('#dot_data').append("You rated "+gdata.name+" a "+ gdata.my_score_2 + " in " + gdata.skill_2_name + "<br>");
  }
  })
  $('#scatter-load').on('click', '#you', function(e){
    $('#dot_data').html("")
    $('#dot_data').html("You were rated a "+ gdata.my_rating_1 + " in " + gdata.skill_1_name + " by users<br>");
    if(gdata.skill_1_name != gdata.skill_2_name){
      $('#dot_data').append("You were rated a "+ gdata.my_rating_2 + " in " + gdata.skill_2_name + " by users<br>");
  }
})
  $('#scatter-load').on('mouseover', '#self', function(e){
    var selected = d3.select('#self');
    selected.attr('r', 12);
    selected.style("stroke-width", 2)
    selected.style("stroke", "black")
    selected.style('fill', 'red');
  })
  $('#scatter-load').on('mouseout', '#self', function(e){
    var selected = d3.select('#self');
    selected.attr('r', 6);
    selected.style('fill', 'blue');
    selected.style("stroke-width", 0);
  })
  $('#scatter-load').on('mouseover', '#users', function(e){
    var selected = d3.select('#users');
    selected.attr('r', 12);
    selected.style("stroke-width", 2)
    selected.style("stroke", "black")
    selected.style('fill', 'red');
  })
  $('#scatter-load').on('mouseout', '#users', function(e){
    var selected = d3.select('#users');
    selected.attr('r', dotSize(gdata));
    selected.style('fill', 'orange');
    selected.style("stroke-width", 0);
  })
  $('#scatter-load').on('mouseover', '#me', function(e){
    var selected = d3.select('#me');
    selected.attr('r', 12);
    selected.style("stroke-width", 2)
    selected.style("stroke", "black")
    selected.style('fill', 'red');
  })
  $('#scatter-load').on('mouseout', '#me', function(e){
    var selected = d3.select('#me');
    selected.attr('r', 6);
    selected.style('fill', 'green');
    selected.style("stroke-width", 0);
  })
  $('#scatter-load').on('mouseover', '#you', function(e){
  var selected = d3.select('#you');
  selected.attr('r', 12);
  selected.style("stroke", "black")
  selected.style("stroke-width", 2);
})
$('#scatter-load').on('mouseout', '#you', function(e){
  var selected = d3.select('#you');
  selected.attr('r', 6);
  selected.style('fill', 'red');
  selected.style("stroke-width", 0);
})
//   $('#scatter-load').on('mouseover', '#line', function(e){
//   var selected = d3.select('#line');
//   selected.style("stroke-width", 4)
//   selected.style('fill', 'red');
// })
// $('#scatter-load').on('mouseout', '#line', function(e){
//   var selected = d3.select('#line');
//   selected.attr('r', dotSize(gdata));
//   selected.style("stroke-width", 2);
// })
});



