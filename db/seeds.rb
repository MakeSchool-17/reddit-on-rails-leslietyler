# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Example User",
             username: "exampleUser",
             email: "example@reddit.org",
             password: "foobar")

9.times do |n|
    name = Faker::Name.name
    username = "example-#{n+1}"
    email = "example-#{n+1}@reddit.org"
    password = "password"
    User.create!(name: name,
                 username: username,
                 email: email,
                 password: password)
end

users = User.order(:created_at).take(6)

Subreddit.create!(title: "Subreddit Title Ex",
                  description: "Example Description")

50.times do
    title = Faker::Lorem.sentence(5)
    content = Faker::Lorem.sentence(5)
    subreddit = Subreddit.all.first
    users.each { |user| user.posts.create!(title: title, content: content, subreddit_id: subreddit.id) }
end
