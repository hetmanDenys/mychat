class UserChatController < ApplicationController
  def create
    recipient = User.find params[:user_id]
    @message = current_user.sent.create(recipient: recipient, body: params[:body])
    @message.save
    #
    # @user = User.find params[:user_id]
     @old_time = l(Message.last.created_at, format: :short)
    # @messages += Message.where(recipient_id: @user.id, sender_id: current_user.id, created_at: @old_time)
    #                                                      .or(Message.where(sender_id: @user.id, recipient_id: current_user.id, created_at: @old_time))

    ActionCable.server.broadcast("MyChannel", { body: params[:body], current_user_id: current_user.id, created_at: @old_time })

    head :ok

    # redirect_to user_chat_path(user_id: recipient.id)
  end

  def user_chat
    @user = User.find params[:user_id]
    @messages = Message.where(recipient_id: @user.id, sender_id: current_user.id)
                       .or(Message.where(sender_id: @user.id, recipient_id: current_user.id))
    @old_time = Message.last.created_at rescue 'newer'
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
