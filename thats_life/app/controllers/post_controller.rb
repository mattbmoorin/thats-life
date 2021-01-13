class PostController < ApplicationController
    get '/posts' do 
        logged_in_user_check
        @random_post = random_post
        erb :"posts/index"
    end

    # renders view
    get '/posts/new' do
        logged_in_user_check
        erb :"posts/new"
    end

    get '/posts/:id' do
        @post = current_post
        missing_post
        erb :"posts/show"
    end

    # creates action for above view
    post '/posts' do
        logged_in_user_check
        post = Post.create({
            body: params["body"], 
            author_name: current_username,
            user_id: session[:user_id], 
            post_time: Time.now.ctime
            })
        redirect '/posts'
    end

    #renders view form to update a post
    get '/posts/:id/edit' do
        @post = current_post
        missing_post
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

    get '/random' do
        @random_post = random_post
        redirect '/posts'
    end

    private

    def current_post
        Post.find_by_id(params["id"])
    end 

    def missing_post
        unless current_post != nil
            redirect '/posts'
        end
    end

    def random_post
        Post.find(Post.all.sample.id)
    end

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