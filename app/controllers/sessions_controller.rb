class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to new_album_path
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end

    private

    def login(user)
      session[:user_id] = user.id
    end
  
    def logout
      session[:user_id] = nil
    end
  end
  