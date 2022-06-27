class MyChannel < Channel
  def subscribed
    # stream_from "user_id=#{params[:user_id]}"
    # stream_from "1"
    stream_from "MyChannel"
  end

  def receive(data)
    # ActionCable.server.broadcast("my", data)

    recipient = User.find data["recipient_id"]
    # TODO
    current_user_id = data["current_user_id"]

    @message = current_user.sent.create(recipient: recipient, body: data["body"])
    @message.save
    @old_time = I18n.l(@message.created_at, format: :short)

    ActionCable.server.broadcast("MyChannel", { body: data["body"], current_user_id: current_user_id, created_at: @old_time,  })
  end
end


