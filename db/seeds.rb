require "faker"
require "pry"



100.times do
    users = User.create(
        username: Faker::Games::Pokemon.name,
        email: Faker::Internet.email,
        password_digest: SecureRandom.alphanumeric
    )
end

100.times do
   posts = Post.create(
        body: Faker::Quote.famous_last_words,
        post_time: Time.now,
        user_id: rand(1..100),
        author_name: Faker::Games::Pokemon.name
    )
    #binding.pry
   #posts.save
end