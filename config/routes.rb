Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users
    resources :users, only: %i[update edit]
    post '/login', to: 'api/v1/application#login'
    post :message_create, to: 'api/v1/message_create#create'
    post 'auth_user' => 'authentication#authenticate_user'
    get :user_chat, to: 'user_chat#user_chat'
    get :download_file, to: 'user_chat#download'
    post :user_create, to: 'user_chat#create'
    get :user, to: 'users#show'
    root to: 'users#show'
  end
end
