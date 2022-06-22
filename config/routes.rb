Rails.application.routes.draw do
  devise_for :users

  post 'auth_user' => 'authentication#authenticate_user'
  get :user_chat, to: 'user_chat#user_chat'
  post :user_create, to: 'user_chat#create'
  post :message_create, to: 'user_chat#message_create'
  get :chat, to: 'chat#chat'
  root to: 'chat#chat'
end
