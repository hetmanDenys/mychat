module Api
  module V1
    class MessageCreateController < Api::V1::ApplicationController
      before_action :users, only: [:create]
      before_action :message_sent, only: [:create]

      def create
        messages = Message.where(recipient_id: @recipient.id, sender_id: @current_user.id)
                          .or(Message.where(sender_id: @recipient.id, recipient_id: @current_user.id))
        messages.each do |m|
          m.body = Obscenity.replacement(:stars).sanitize(m.body) if Obscenity.profane?(m.body)
        end
        old_time = I18n.l(Message.last.created_at, format: :short)
        ActionCable.server.broadcast('MyChannel',
                                     { current_user_id: @current_user.id, created_at: old_time,
                                       messages: messages })

        head :ok
      end

      def message_sent
        message = if params[:file]
                    @current_user.sent_messages.create(recipient: @recipient, body: params[:body],
                                                       file: params[:file].original_filename)
                  else
                    @current_user.sent_messages.create(recipient: @recipient, body: params[:body])
                  end

        message.save
      end

      private

      def user_params
        params.permit(:body, :user_id, :current_user_id, :file)
      end

      def users
        @recipient = User.find params[:user_id]
      end
    end
  end
end
