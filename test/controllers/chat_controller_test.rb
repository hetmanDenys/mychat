require 'test_helper'

class ChatControllerTest < ActionDispatch::IntegrationTest
  test 'should get users' do
    get chat_chat_url
    assert_response :success
  end
end
