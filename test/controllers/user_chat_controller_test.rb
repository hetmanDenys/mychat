require 'test_helper'

class UserChatControllerTest < ActionDispatch::IntegrationTest
  test 'should get user_chat' do
    get user_chat_user_chat_url
    assert_response :success
  end
end
