# frozen_string_literal: true

class Api::UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    respond_with :api, User.create(user_params)
  end

  def destroy
    respond_with User.destroy(params[:id])
  end

  def update
    user = User.find(params['id'])
    user.update(user_params)
    respond_with User, json: user
  end

  def signup
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "signup"
  end

  def signin
    respond_with create
  end
  private

  def user_params
    params.require(:user).permit(
      :id,
      :username,
      :password
    )
  end
end
