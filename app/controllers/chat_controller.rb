class ChatController < ApplicationController
  # before_action :authorized, only: [:auto_login]

  def chat
    @users = User.all
    @user_id = current_user.id
    @login = if current_user.user_name
               current_user.user_name
             else
               current_user.email
             end
  end

  def update
    pp params
    if (@user_create = current_user.update(params.permit(:user_name, :age, :country)),
      current_user.avatar.attach(params[:avatar])
    )
      redirect_to '/'
    else

    end
  end

  def auto_login
    render json: @user
  end
end
