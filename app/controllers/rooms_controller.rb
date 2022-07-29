class RoomsController < ApplicationController
  before_action :message_sent, only: [:create_message]
  before_action :user_and_room, only: [:room]

  def show; end

  def room
    @messages = Message.where(recipient_id: @recipient.id, user_id: current_user.id, room_id: params[:room_id])
                       .or(Message.where(user_id: @recipient.id, recipient_id: current_user.id, room_id: params[:room_id]))
    if [] === Message.where(user_id: current_user.id, room_id: params[:room_id])
                     .or(Message.where(user_id: params[:id], room_id: params[:room_id]))
      Message.create(recipient_id: @recipient.id, user_id: current_user.id,
                     body: "#{@user_name} joined to room", room_id: params[:room_id])
      Message.create(recipient_id: current_user.id, user_id: @recipient.id,
                     body: "#{@recipient_user_name} joined to room", room_id: params[:room_id])
    end
    @old_time = begin
      Message.last.created_at
    rescue StandardError
      'newer'
    end
  end

  def user_and_room
    @recipient = User.find params[:recipient_id]
    @room = current_user.rooms.find(params[:room_id])
    @recipient_user_name = if @recipient.user_name == ''
                             @recipient.email
                           else
                             @recipient.user_name
                           end
  end

  def message_sent
    message = current_user.sent_messages.create(recipient: @recipient, body: params[:body], file: params[:file])
    message.save
  end

  def create_message
    @old_time = l(Message.last.created_at, format: :message_time)
    ActionCable.server.broadcast('MyChannel',
                                 { body: params[:body], current_user_id: current_user.id, created_at: @old_time,
                                   file: params[:file] })

    head :ok
  end

  def create
    pp params
    room = current_user.rooms.create(user_id: current_user.id, title: params[:title])
    if room.save
      redirect_to user_room_path(id: current_user, room_id: room, recipient_id: params[:id])
    else
      pp 11111
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :file)
  end
end
