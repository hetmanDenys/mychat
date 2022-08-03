# class MyChannel < Channel
#   def subscribed
#     stream_from 'MyChannel'
#   end
#
#   def receive(data)
#     recipient = User.find data['recipient_id']
#     # TODO
#     current_user_id = data['current_user_id']
#     current_user = User.find current_user_id
#
#     message = current_user.sent_messages.create(recipient: recipient, body: data['body'])
#     message.save
#
#     ActionCable.server.broadcast('MyChannel',
#                                  { body: data['body'], current_user_id: current_user_id })
#   end
# end
