class UsersController < ApplicationController
    get '/signup' do
        logged_in_check
    end

    # post '/signup' do
        
    # end
end
