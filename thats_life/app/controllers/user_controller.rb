class UserController < ApplicationController
    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        user = User.new(params)
            if user.save
                flash[:notice] = "You have succesfully signed up!"
                session[:user_id] = user.id
                redirect '/posts'
            else
                flash.now[:error] = "Something went wrong, please try again"
                redirect '/signup'
            end
    end

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        user = User.find_by_email(params[:email])
        #unless user.try!(:authenticate, params[:password])
            unless user&.authenticate(params[:password])
                redirect '/login'
            end
        session[:user_id] = user.id
        redirect '/posts'
    end
        
    #change to session.delete(PARAMS) when adding cookie functionality
    get '/logout' do
        session.clear
        redirect '/posts'
    end
end
