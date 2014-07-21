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
        },{
            x: data.my_score_1,
            y: data.my_score_2,
            z: "Your Rating",
            size: 6
        },{
            x: data.my_rating_1,
            y: data.my_rating_2,
            z: "Users Rated You",
            size: 6
        }]
}

function dotSize(data){
    var size = (6 + data.num_votes_1 + data.num_votes_2) * .75

    if(size > 12){
        size = 12;
    }
    return size;
}