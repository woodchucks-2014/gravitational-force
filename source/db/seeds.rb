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

Rating.create(value: 93, rating_user: drew.id
  rated_user: ben.id, trait: programming.id)
