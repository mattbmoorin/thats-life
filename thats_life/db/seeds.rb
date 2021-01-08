require "faker"
require "pry"

10.times do
    posts = Post.create(
        body: Faker::Quote.matz,
        post_time: Time.now,
        user_id: rand(1..99)
    )
    #binding.pry
   #posts.save
end