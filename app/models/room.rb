class Room < ApplicationRecord
  has_many :messages
  has_many :user_rooms
  has_many :users, through: :user_rooms

  validates_presence_of     :title
  validates_uniqueness_of   :title
end
