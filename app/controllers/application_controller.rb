class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  around_action :switch_locale

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
