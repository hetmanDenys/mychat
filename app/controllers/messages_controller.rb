class MessagesController < ApplicationController
  before_action :message_sent, only: [:create_message]

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

  private

  def message_params
    params.require(:message).permit(:body, :file)
  end
end
