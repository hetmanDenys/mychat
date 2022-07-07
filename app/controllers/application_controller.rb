class ApplicationController < ActionController::Base
  # before_action :extract_locale_from_tld
  before_action :authenticate_user!
end
