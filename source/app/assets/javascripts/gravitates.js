
$(document).ready(function() {
  var methods = ['low_esteem', 'high_esteem', 'accurate', 'deluded']
  var gdata = ''
  $("#graph_it").submit(function(e){
    gdata = ''
    $('#scatter-load').html("")
    $('#filters').html("")
      e.preventDefault();
      $("#delusion").remove();
      $.post('/gravitate', $("#graph_it").serialize(), 'json')
        .done(function(data){
          gdata = data;
        users = [{
            x: data.self_score_1,
            y: data.self_score_2,
            z: data.name,
            size: 6
        }, {
            x: data.user_score_1,
            y: data.user_score_2,
            z: data.name_perceived,
            size: 6 + data.num_votes * (.5)
        }]

        showScatterPlot(users, data);
    
      $.each(methods, function(i, method){
        randNum1 = Math.floor((Math.random() * 100) + 1);
        $("#filters").append("<button id =" + method + randNum1 + ">Most " + method + " Person in " + gdata.skill_1_name + "</button>")
        //$("#filters").append("<button id =" + method + i + ">Most" + method + " Person in " + gdata.skill_2_name + "</button>")
        
        $("#filters").on("click", "#"+method+randNum1, function(e){
          $.get('/filter_request/'+method, {skill_1: gdata.trait_1_id, skill_2: gdata.trait_1_id}, 'json')
            .done(function(data){
              console.log('did it')
            users = [{
            x: data.self_score_1,
            y: data.self_score_2,
            z: data.name,
            size: 6
        }, {
            x: data.user_score_1,
            y: data.user_score_2,
            z: data.name_perceived,
            size: 6 + data.num_votes * (.5)
        }]
          $('#scatter-load').html("")
          showScatterPlot(users, data);
            })
        })
        })
  });
  });
});



