class PostController < ApplicationController
    get '/posts' do 
        @posts = Post.all #grabbed from model
        erb :"posts/index"
    end

    # renders view
    get '/posts/new' do
        logged_in_user_check
        erb :"posts/new"
    end

    get '/posts/:id' do
        @post = current_post
        erb :"posts/show"
    end

    # creates action for above view
    post '/posts' do
        #post = Post.create(params)
        logged_in_user_check
        post = Post.create({
            body: params["body"], 
            author_name: current_username,
            user_id: session[:user_id], 
            post_time: Time.now
            })
        redirect '/posts'
    end

    #renders view form to update 1 particular post
    get '/posts/:id/edit' do
        @post = current_post
        logged_in_user_check
        post_belongs_to_user?
         erb :"posts/edit"
    end
    #creates action for above view
    put '/posts/:id' do
        @post = current_post
        logged_in_user_check
        post_belongs_to_user?
        @post.update(params["post"])
        redirect "/posts/#{@post.id}"
    end

    delete '/posts/:id' do
        @post = current_post
        logged_in_user_check
        post_belongs_to_user?
        @post.destroy
        redirect '/posts'
    end

    helpers do
        def current_post
            Post.find(params["id"])
        end 
    end

    private

    def post_belongs_to_user?
        unless @post.user_id == session[:user_id]
          redirect '/login'
        end
    end

    def logged_in_user_check
        unless logged_in?
          redirect '/login'
        end
    end
end