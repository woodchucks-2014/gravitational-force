
$(document).ready(function() {
  var methods = ['perception', 'individual', 'accurate', 'deluded'];
  var gdata = ''
  $("#graph_it").submit(function(e){
    gdata = ''
    $('#scatter-load').html("")
    $('#filters').html("")
      e.preventDefault();

      $.post('/gravitate', $("#graph_it").serialize(), 'json')

        .done(function(data){
          gdata = data;
          users = makeUsers(data);
          showScatterPlot(users, data);

          $.each(methods, function(i, method){
            randNum = Math.floor((Math.random() * 10000) + 1 * i);
            $("#filters").append("<button id =" + method + randNum + ">Most " + method + " Person in " + gdata.skill_1_name + " and " + gdata.skill_2_name+ "</button>")
            $("#filters").on("click", "#"+method+randNum, function(e){
              
              $.get('/filter_request/'+method, {skill_1: gdata.trait_1_id, skill_2: gdata.trait_2_id}, 'json')
                
                .done(function(data){
                  users = makeUsers(data);
                  $('#scatter-load').html("")
                  showScatterPlot(users, gdata);
                })
          })
        })
  });
});

  $('#scatter-load').on('mouseover', '.dot', function(e){
    console.log('fuck it')
  })
});



