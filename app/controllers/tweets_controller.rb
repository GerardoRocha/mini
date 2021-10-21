class TweetsController < ApplicationController
  before_action :authorized
  before_action :user_validation

  def create
    @tweet = user.tweets.create(content: params[:content], likes: 0)
    render json: @tweet
  end

private
  def user
    User.find(@token_info[0]['user_id'])
  end

  def user_validation
    render json: { message: 'Wrong token' } if @token_info[0]['user_id'].to_s != params[:user_id]
  end

  def authorized
    render json: { message: 'Log in please' } unless token

    @token_info = JWT.decode(token, 'SECRET')
  rescue JWT::DecodeError
    render json: { message: 'Log in please' }
  end

  def token
    request.headers['Authorization'].split(' ')[1]
  end
end
