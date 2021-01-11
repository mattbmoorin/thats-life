require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "0xDe783jfu9eDSilr90e235REit6"
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user_id
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_username
      current_user_id.username
    end
  end

end
