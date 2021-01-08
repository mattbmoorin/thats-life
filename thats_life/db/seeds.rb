require "faker"
require "pry"

10.times do
    posts = Post.create(
        body: Faker::Quote.matz,
        post_time: Time.now,
        user_id: "Anonymous"
    )
    #binding.pry
   #posts.save
end