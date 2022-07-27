class RoomsController < ApplicationController
  def show; end

  def create
    room = Room.create(title: params[:title], user_id: current_user.id)
    redirect_to user_chat_path(id: params[:id], room_id: params[:room_id]) if room.save
  end
end
