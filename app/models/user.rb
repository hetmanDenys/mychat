class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: :user_id
  has_many :received, class_name: 'Message', foreign_key: :recipient_id
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable

  validates_presence_of     :email
  validates_uniqueness_of   :email
  paginates_per 5
end
