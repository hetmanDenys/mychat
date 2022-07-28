class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received, class_name: 'Message', foreign_key: :recipient_id
  has_many :messages
  has_many :room, class_name: 'Room', through: :messages
  has_many :user_room
  has_many :rooms, through: :user_rooms
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable

  validates_presence_of     :email
  validates_uniqueness_of   :email
  paginates_per 5
end
