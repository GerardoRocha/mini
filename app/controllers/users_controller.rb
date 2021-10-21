class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    p params
    User.create(username: params[:username])
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      render json: { user: @user.id, token: JWT.encode({ user_id: @user.id }, 'SECRET')}
    else
      render json: { error: 'Invalid username or password' }
    end
  end
end