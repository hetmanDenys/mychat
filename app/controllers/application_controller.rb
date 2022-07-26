class ApplicationController < ActionController::Base
  before_action :user_name
  before_action :jwt_token
  before_action :authenticate_user!
  around_action :switch_locale

  def user_name
    if current_user
      @user_name = if current_user.user_name == ''
                     current_user.email
                   else
                     current_user.user_name
                   end
    end
  end

  def jwt_token
    gon.token = JWT.encode({ user_id: current_user.id }, 's3cr3t')
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def set_locale
    if params[:locale].present?
      cookies.permanent[:locale] = params[:locale] # save cookies
    end
  end
end
