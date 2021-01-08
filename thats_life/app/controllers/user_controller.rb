class UserController < ApplicationController
    get '/signup' do
        logged_in_check
    end

    # post '/signup' do
    #     user = User.new(params)
    #         if user.save
    #             session[:user_id]
    #             redirect to '/projects'
    #         else
    #             erb :'users/signup'
    #         end
    #     end
    # end

    get '/login' do
        logged_in_check
    end
end
