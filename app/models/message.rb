class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :user_id
  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id
  belongs_to :room
  broadcasts_to :room

  # after_create_commit do
  #   broadcast_append_to 'messages', target: 'messages', partial: 'messages/message', locals: { message: self }
  # end

  # validates :body, presence: true
  # validates_with MyValidator
end
