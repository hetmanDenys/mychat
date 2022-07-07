class ChatController < ApplicationController
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def chat
    @first_user = User.first
    @user_count = User.count
    @user_id = current_user.id
    @users_show = User.order(:id).page params[:page]
  end
end
