class ChatController < ApplicationController
  def chat
    @users = User.all
  end
end
