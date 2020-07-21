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
        img_url: "my face",
        belt: "brown"
    },
    {
        email: "lucy@schnauz.com",
        password: "kale",
        name: "Lucy Langlinais",
        isAdmin: true,
        age: 12,
        img_url: "my face",
        belt: "black"
    },
    {
        email: "ashton@holy.com",
        password: "marcelo",
        name: "Ashton Ellis",
        isAdmin: true,
        age: 33,
        img_url: "my face",
        belt: "black"
    },
    {
        email: "steve@parsley.com",
        password: "lit",
        name: "Steven Parsons",
        isAdmin: true,
        age: 22,
        img_url: "my face",
        belt: "white"
    }
]

topics = [
    {
        name: "Guard",
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
    }
]

categories = [
    {
        name: "Kids 5-10"
    },
    {
        name: "Kids 11-15"
    },
    {
        name: "Adults Fundamentals"
    },
    {
        name: "Adults Advanced"
    },
    
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
        user_id: rand(1..User.all.count)
    )
}

30.times {
    Enrollment.create(
        user_id: rand(1..User.all.count),
        session_id: rand(1..Session.all.count)
    )
}