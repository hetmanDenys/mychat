Rails.application.routes.draw do
  devise_for :users

  get :user_chat, to: 'user_chat#user_chat'
  post :user_create, to: 'user_chat#create'
  get :chat, to: 'chat#chat'
  root to: 'chat#chat'
end