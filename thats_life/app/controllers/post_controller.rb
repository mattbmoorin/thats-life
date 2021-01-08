class PostController < ApplicationController
    #homepage displays all posts
    get '/' do 
        @post = Post.all #grabbed from model
        #binding.pry
        erb :"posts/index"
    end

    #get page to create post
    get '/posts/new' do
        erb :"posts/new"
    end

    #CREATE post
    post '/posts' do
        post = Post.new(params)
        post.save
        redirect '/posts'
    end

    #view one post
    # get '/posts/:id'
    # end

    #view form to update 1 particular post
    get '/posts/:id/edit' do
         @post = Post.find(params["id"])
         erb :"posts/edit"
    end


end