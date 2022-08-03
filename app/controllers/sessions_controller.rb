class SessionsController < Devise::SessionsController
  skip_before_action :token, only: :new
end
