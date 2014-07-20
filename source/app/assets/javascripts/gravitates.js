
$(document).ready(function() {
  var gdata = ''
  $("#graph_it").submit(function(e){
    gdata = ''
    $('#scatter-load').html("")
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
        $("#filters").html("<button id = 'delusion'>Most Deluded Person in " + data.skill_1_name + "</button>")
    });


        $("#filters").on("click", "#delusion", function(e){

          $.get('/filter_request/deluded', {skill_1: gdata.trait_1_id, skill_2: gdata.trait_1_id}, 'json')
            .done(function(data){
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
          console.log("fu 2")
          $('#scatter-load').html("")
          showScatterPlot(users, data);
            })
        })

  });
});



