class User < ApplicationRecord

  has_many :sent, class_name: 'Message', foreign_key: :sender_id
  has_many :received, class_name: 'Message', foreign_key: :recipient_id

  devise :database_authenticatable, :registerable

  validates :email, presence: true, length: { minimum: 5 }
end
