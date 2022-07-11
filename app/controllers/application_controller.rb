class ApplicationController < ActionController::Base
  # before_action :extract_locale_from_tld
  before_action :authenticate_user!
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def localization
    pp params
  end
end
