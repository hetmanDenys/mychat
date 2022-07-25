class ApplicationController < ActionController::Base
  before_action :user_name

  def user_name
    if current_user
      @user_name = if current_user.user_name == ''
                     current_user.email
                   else
                     current_user.user_name
                   end
    end
  end
end
