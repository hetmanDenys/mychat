class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received, class_name: 'Message', foreign_key: :recipient_id

  devise :database_authenticatable, :registerable

  self.skip_session_storage = %i[http_auth params_auth]
  validates :email, presence: true, length: { minimum: 5 }
  paginates_per 5
end
