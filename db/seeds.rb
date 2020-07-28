# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    {
        email: "justin@credible.com",
        password: "potato",
        name: "Justin Langlinais",
        isAdmin: true,
        age: 37,
        img_url: "https://i.imgur.com/G5CqsGR.jpg",
        belt: "brown"
    },
    {
        email: "swizzlez@joeybaby.org",
        password: "grotcha",
        name: "Joe Peterson",
        isAdmin: false,
        age: 40,
        img_url: "https://i.imgur.com/QEkoFYc.jpg",
        belt: "blue"
    },
    {
        email: "ashton@holy.com",
        password: "marcelo",
        name: "Ashton Ellis",
        isAdmin: true,
        age: 33,
        img_url: "https://i.imgur.com/AovDURF.jpg",
        belt: "black"
    },
    {
        email: "steve@parsley.com",
        password: "lit",
        name: "Steven Parsons",
        isAdmin: false,
        age: 22,
        img_url: "https://i.imgur.com/eu2Zju0.jpg",
        belt: "white"
    },
    {
        email: "harry@richard.edu",
        password: "yea",
        name: "Harris Richardson",
        isAdmin: false,
        age: 34,
        img_url: "https://i.imgur.com/hBzM1Is.jpg",
        belt: "blue"
    },
    {
        email: "nick@heuthdogs.com",
        password: "comeupjustin",
        name: "Nick Heuth",
        isAdmin: true,
        age: 47,
        img_url: "https://i.imgur.com/weLHjXA.jpg",
        belt: "black"
    },
    {
        email: "brian@nwjja.net",
        password: "brian",
        name: "Brian Johnson",
        isAdmin: true,
        age: 47,
        img_url: "https://i.imgur.com/wNCqvxd.jpg",
        belt: "black"
    },
    {
        email: "ryan@youngandhandsome.org",
        password: "youngandhandsome",
        name: "Ryan Davis",
        isAdmin: true,
        age: 23,
        img_url: "https://i.imgur.com/71qStAw.jpg",
        belt: "purple"
    },
    {
        email: "kamau@kambui.com",
        password: "kambui",
        name: "Kamau Kambui",
        isAdmin: true,
        age: 46,
        img_url: "https://i.imgur.com/rqmqbyd.jpg",
        belt: "black"
    }
]

topics = [
    {
        name: "Closed Guard",
        vid_url: "youtube"
    },
    {
        name: "Side Control",
        vid_url: "youtube"
    },
    {
        name: "Kneeride",
        vid_url: "youtube"
    },
    {
        name: "Back Mount",
        vid_url: "youtube"
    },
    {
        name: "Top Control",
        vid_url: "youtube"
    },
    {
        name: "North South",
        vid_url: "youtube"
    },
    {
        name: "Open Guard",
        vid_url: "youtube"
    },
    {
        name: "Mount",
        vid_url: "youtube"
    },
    {
        name: "Worm Guard",
        vid_url: "youtube"
    },
    {
        name: "Leg Drags",
        vid_url: "youtube"
    },
    {
        name: "Guillotines",
        vid_url: "youtube"
    }
]

categories = [
    {
        name: "Kids - 5-10"
    },
    {
        name: "Kids - 11-15"
    },
    {
        name: "Adults - Fundamentals"
    },
    {
        name: "Adults - Advanced"
    }
]

users.each do |user|
    User.create(user)
end

topics.each do |topic|
    Topic.create(topic)
end

categories.each do |category|
    Category.create(category)
end

10.times {
    Session.create(
        # .strftime("%A, %B%e - %l:%M%P")
        time: Faker::Time.between(from: DateTime.now - 3, to: DateTime.now + 5, format: :long),
        category_id: rand(1..Category.all.count),
        topic_id: rand(1..Topic.all.count),
        user_id: User.instructors[rand(0..User.instructors.count - 1)].id
    )
}

20.times {
    Enrollment.create(
        user_id: rand(1..User.all.count),
        session_id: rand(1..Session.all.count)
    )
}