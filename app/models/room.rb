class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_rooms
  has_many :users, through: :user_rooms

  scope :public_rooms, -> { where(is_private: false) }

  validates_presence_of     :title
  validates_uniqueness_of   :title
end
