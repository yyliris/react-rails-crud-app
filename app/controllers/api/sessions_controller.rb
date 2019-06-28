class Api::SessionsController < ApplicationController
    respond_to :json

    def index
        if session[:current_user_id]
            user = User.find_by(id: session[:current_user_id])
            respond_with User, json: user
        else
            render json: {:session_UID => session[:current_user_id]}
        end
    end
  
    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:current_user_id] = user.id
            respond_with User, json: {:login => user.username}
        else
            session[:current_user_id] = nil
            render json: {:status => 'login failed'}
        end
    end
  
    def destroy
    end

end