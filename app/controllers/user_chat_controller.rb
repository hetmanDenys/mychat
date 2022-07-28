class UserChatController < ApplicationController
  before_action :message_sent, only: [:create]
  before_action :user_and_room, only: [:user_chat]

  def create
    @recipient = User.find params[:user_id]
    @old_time = l(Message.last.created_at, format: :message_time)
    ActionCable.server.broadcast('MyChannel',
                                 { body: params[:body], current_user_id: current_user.id, created_at: @old_time,
                                   file: params[:file] })

    head :ok
  end

  def user_and_room
    @room = Room.find params[:room_id]
    @user = User.find params[:id]
    @recipient_user_name = if @user.user_name == ''
                             @user.email
                           else
                             @user.user_name
                           end
  end

  def user_chat
    @messages = Message.where(recipient_id: @user.id, sender_id: current_user.id)
                       .or(Message.where(sender_id: @user.id, recipient_id: current_user.id))
    if [] === Message.where(sender_id: current_user.id, room_id: params[:room_id])
                     .or(Message.where(sender_id: @user.id, room_id: params[:room_id]))
      Message.create(recipient_id: @user.id, sender_id: current_user.id,
                     body: "#{@user_name} joined to room", room_id: params[:room_id])
      Message.create(recipient_id: current_user.id, sender_id: @user.id,
                     body: "#{@recipient_user_name} joined to room", room_id: params[:room_id])
    end
    @old_time = begin
      Message.last.created_at
    rescue StandardError
      'newer'
    end
  end

  def message_sent
    message = current_user.sent_messages.create(recipient: @recipient, body: params[:body], file: params[:file])
    message.save
  end

  private

  def message_params
    params.require(:message).permit(:body, :file)
  end
end
