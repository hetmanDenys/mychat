class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :user_id
  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id
  belongs_to :room

  after_create_commit  { |o| broadcast_prepend_to target: o.room,  partial: "messages/message", locals: { message: o } }

  validates :body, presence: true
  validates_with MyValidator
end
