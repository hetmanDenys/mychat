class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id
  belongs_to :room

  validates :body, presence: true
  validates_with MyValidator
end
