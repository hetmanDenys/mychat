Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users
    resources :users, only: %i[update edit create]
    resources :rooms, only: %i[edit delete show create new]
    post '/login', to: 'api/v1/application#login'
    post :message_create, to: 'api/v1/message_create#create'
    post 'auth_user' => 'authentication#authenticate_user'
    # get :download_file, to: 'rooms#download'
    post :message_sent, to: 'messages#message_sent'
    get :user, to: 'users#show'
    root to: 'users#show'
  end
end
