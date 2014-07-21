ben = User.create(name: "Ben Brostoff",
            email: "ben.brostoff@gmail.com",
            password: "test",
            password_confirmation: "test")

greg = User.create(name: "Greg Picollo",
            email: "gregf@gmail.com",
            password: "test",
            password_confirmation: "test")

katie = User.create(name: "Katie Reiner",
            email: "katie@gmail.com",
            password: "test",
            password_confirmation: "test")

drew = User.create(name: "Drew Teter",
            email: "drew@gmail.com",
            password: "test",
            password_confirmation: "test")

programming = Trait.create(name: "Programming")
sports = Trait.create(name: "Sports")
guitar = Trait.create(name: "Guitar")
social = Trait.create(name: "Sociability")

users = [ben,greg,katie,drew]
#traits = [programming, sports, guitar, social]


def loop_it(users, trait)
    users.each do |user|
        users.each do |boozer|
            rand_num = rand(1..100)
            Rating.create(value: rand_num, rater_id: user.id, ratee_id: boozer.id, trait_id: trait.id)
        end
    end
end

[programming, sports, guitar, social].each do |trait|
    loop_it(users, trait)
end
