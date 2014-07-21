function makeUsers(data){


	return users = [{
            x: data.self_score_1,
            y: data.self_score_2,
            z: data.name,
            size: 6
        }, {
            x: data.user_score_1,
            y: data.user_score_2,
            z: "Users",
            size: dotSize(data)
        }]
}

function dotSize(data){
    var size = (6 + data.num_votes_1 + data.num_votes_2) * .75

    if(size > 12){
        size = 12;
    }
    return size;
}