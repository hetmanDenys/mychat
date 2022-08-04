class MessagesController < ApplicationController
  before_action :message_sent, only: [:create_message]
  before_action :set_room, only: [:message_sent]
  before_action :set_messages, only: [:message_sent]

  def message_sent
    message = if params[:file]
                current_user.sent_messages.create(recipient_id: params[:recipient_id], body: params[:body],
                                                  file: params[:file].original_filename, room_id: params[:room_id])
              else
                current_user.sent_messages.create(recipient_id: params[:recipient_id], body: params[:body],
                                                  room_id: params[:room_id])
              end

    if message.save
      render turbo_stream: turbo_stream.append(:messages, message)
    else
      pp 111111111111111
    end
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_messages
    @recipient = User.find params[:recipient_id]
    @messages = Message.where(recipient_id: @recipient.id, user_id: current_user.id, room_id: params[:room_id])
                       .or(Message.where(user_id: @recipient.id, recipient_id: current_user.id,
                                         room_id: params[:room_id]))
  end

  def create_message
    @old_time = l(Message.last.created_at, format: :message_time)
    ActionCable.server.broadcast('MyChannel',
                                 { body: params[:body], current_user_id: current_user.id, created_at: @old_time,
                                   file: params[:file] })

    head :ok
  end

  private

  def message_params
    params.permit(:body, :room_id)
  end
end
