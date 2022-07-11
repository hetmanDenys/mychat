Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users
    post '/login', to: 'api/v1/application#login'
    post :message_create, to: 'api/v1/message_create#create'
    post '/chat', to: 'chat#chat'
    post 'auth_user' => 'authentication#authenticate_user'
    get :user_chat, to: 'user_chat#user_chat'
    post :user_create, to: 'user_chat#create'
    # post :message_create, to: 'user_chat#message_create'
    get :chat, to: 'chat#chat'
    root to: 'chat#chat'
  end
end
