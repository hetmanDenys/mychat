class ChatController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def chat
    @users = User.all
    @user_id = current_user.id
  end

  def auto_login
    render json: @user
  end
end
