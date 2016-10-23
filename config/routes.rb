Rails.application.routes.draw do
  namespace :api, constraints: { format: :json }, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :create
      resources :posts, only: [:index, :show, :create]
      post '/upload_avatar', to: 'users#upload_avatar'
      post '/authenticate', to: 'authentication#authenticate'
       namespace :reports do
         post '/by_author', to: 'reports#by_author'
       end
    end
  end

  root 'web_pages#upload'
end
