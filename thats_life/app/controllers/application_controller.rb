require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    # register Sinatra::Flash
    set :session_secret, "0xDe783jfu9eDSilr90e235REit6"
  end

  # get "/" do
  #   erb :welcome
  # end

  def logged_in_check
    if logged_in?
      redirect to '/posts' 
    else
      erb :'user/signup'
    end
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def authenticate
      if !logged_in?
        redirect '/login'
      end
    end
  end

end
