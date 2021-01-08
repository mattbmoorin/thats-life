class PostController < ApplicationController
    get '/posts' do 
        @posts = Post.all #grabbed from model
        #binding.pry
        erb :"posts/index"
    end

    # renders view
    get '/posts/new' do
        erb :"posts/new"
    end

    get '/posts/:id' do
        @post = current_post
        erb :"posts/show"
    end

    # creates action for above view
    post '/posts' do
        #post = Post.create(params)
        #binding.pry
        post = Post.create({
            body: params["body"], 
            user_id: "Anonymous", 
            post_time: Time.now
            })
        redirect '/posts'
    end

    #renders view form to update 1 particular post
    get '/posts/:id/edit' do
        @post = current_post
         erb :"posts/edit"
    end
    #creates action for above view
    put '/posts/:id' do
        @post = current_post
        #binding.pry
        @post.update(params["post"])
        redirect "/posts/#{@post.id}"
    end

    delete '/posts/:id' do
        @post = current_post
        @post.destroy
        redirect '/posts'
    end

    helpers do
        def current_post
            Post.find(params["id"])
        end 
    end
end