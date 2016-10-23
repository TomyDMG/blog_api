# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create(nickname: FFaker::Name.name, email: FFaker::Internet.email, password: "123123123")
end

User.all.each do |u|
  rand(1..30).times do
    u.posts.create(title: FFaker::Lorem.sentence, body: FFaker::Lorem.paragraph, created_at: Time.now - rand(1..100).hours)
  end

  rand(1..30).times do
    u.comments.create(body: FFaker::Lorem.paragraph, post: Post.offset(rand(Post.count)).first, created_at: Time.now - rand(1..100).hours)
  end
end
