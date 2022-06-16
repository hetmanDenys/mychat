class MyChannel < Channel
  def subscribed
    # stream_from "user_id=#{params[:user_id]}"
    stream_from "1"
  end
end


