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
        password_digest: "potato",
        name: "Justin Langlinais",
        isAdmin: true,
        age: 37,
        img_url: "my face",
        belt: "brown"
    },
    {
        email: "lucy@schnauz.com",
        password_digest: "kale",
        name: "Lucy Langlinais",
        isAdmin: true,
        age: 12,
        img_url: "my face",
        belt: "black"
    },
    {
        email: "ashton@holy.com",
        password_digest: "marcelo",
        name: "Ashton Ellis",
        isAdmin: true,
        age: 33,
        img_url: "my face",
        belt: "black"
    },
    {
        email: "steve@parsley.com",
        password_digest: "lit",
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
        time: Faker::Date.between(from: 2.days.ago, to: Date.today),
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