class UserChat < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_user_chats, -> { where(is_private: false) }
  after_create_commit { broadcast_append_to 'user_chats' }
end
