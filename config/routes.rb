Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[update edit]

  # namespace :Api do
  #   namespace :V1 do
  #     post :message_create, to: 'api/v1/message_create#create'
  #   end
  # end

  post '/login', to: 'api/v1/application#login'
  post :message_create, to: 'api/v1/message_create#create'
  post 'auth_user' => 'authentication#authenticate_user'
  get :user_chat, to: 'user_chat#user_chat'
  get :download_file, to: 'user_chat#download'
  post :user_create, to: 'user_chat#create'
  # patch :user_update, to: 'user_page#update'
  # post :message_create, to: 'user_chat#message_create'
  get :user, to: 'users#show'
  # get :user_page, to: 'user_page#user_page'
  root to: 'users#show'
end
