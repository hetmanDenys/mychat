class MyChannel < Channel
  def subscribed
    # stream_from "user_id=#{params[:user_id]}"
    # stream_from "1"
    stream_from "MyChannel"
  end

  def receive(data)
    user_id = data["recipient_id"]
    # ActionCable.server.broadcast("my", data)
    recipient = User.find user_id
    @message = current_user.sent.create(recipient: recipient, body: data["body"])
    @message.save
    @old_time = l(Message.last.created_at, format: :short)

    ActionCable.server.broadcast("my", { body: data["body"], current_user_id: current_user.id, created_at: @old_time })

    head :ok
  end
end


