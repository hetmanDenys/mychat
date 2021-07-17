class UserChatController < ApplicationController
  def create
    recipient = User.find params[:message][:user_id]
    @message = current_user.sent.create(recipient: recipient, body: message_params[:body])
    @message.save

    redirect_to user_chat_path(user_id: recipient.id)
  end

  def user_chat
    @user = User.find params[:user_id]
    @my_messages = current_user.sent.where(recipient_id: @user.id)
    @your_messages = current_user.received.where(sender_id: @user.id)
  end

  def save_messages
    render json: user_chat
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
