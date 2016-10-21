Rails.application.routes.draw do
  namespace :api, constraints: { format: :json }, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :posts, only: [:index, :show, :create]
      post '/upload_avatar', to: 'users#upload_avatar'
      post 'authenticate', to: 'authentication#authenticate'
    end
  end

  root 'web_pages#upload'
end
