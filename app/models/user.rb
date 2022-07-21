class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received, class_name: 'Message', foreign_key: :recipient_id
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable

  validates_presence_of     :email
  validates_uniqueness_of   :email
end
