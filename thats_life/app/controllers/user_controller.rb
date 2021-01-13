class UserController < ApplicationController
    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        valid_signup
    end

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
       valid_login
    end
        
    #change to session.delete(PARAMS) when adding cookie functionality
    get '/logout' do
        session.clear
        redirect '/'
    end

    private

    def valid_login
        user = User.find_by_email(params[:email])
            unless user&.authenticate(params[:password])
                redirect '/login'
            end
        session[:user_id] = user.id
        redirect '/'
    end

    def valid_signup
        user = User.new(params)
            unless user.save
                redirect '/signup'
            end
        session[:user_id] = user.id
        redirect '/'
    end
end
