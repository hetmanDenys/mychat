class Room < ApplicationRecord
  has_many :messages
  has_many :users, class_name: 'User', through: :messages

  validates_presence_of     :title
  validates_uniqueness_of   :title
end
