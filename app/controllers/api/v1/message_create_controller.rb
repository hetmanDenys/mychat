class Api::V1::MessageCreateController < ApplicationController
  before_action :authorized

  def create
    #crete messages
  end

  private

  def user_params
    params.permit(:body)
  end
end
