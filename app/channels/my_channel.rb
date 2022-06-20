class MyChannel < Channel
  def subscribed
    # stream_from "user_id=#{params[:user_id]}"
    # stream_from "1"
    stream_from "my"
  end
  def received(data)
    ActionCable.server.broadcast("1", data)
  end
end


