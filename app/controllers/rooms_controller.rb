class RoomsController < ApplicationController
  def show; end

  def create
    room = current_user.rooms.new(title: params[:title])
    if room.save
      redirect_to user_chat_path(id: current_user, room_id: room)
    else
      pp 11111
    end
  end
end
