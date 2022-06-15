class ChatController < ApplicationController
  def chat
    @users = User.all
    @user_id = current_user.id
  end
end
