function makeUsers(data){
	return users = [{
            x: data.self_score_1,
            y: data.self_score_2,
            z: data.name,
            size: 6
        }, {
            x: data.user_score_1,
            y: data.user_score_2,
            size: 6 + data.num_votes * (.5)
        }]
}