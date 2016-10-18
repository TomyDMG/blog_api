Rails.application.routes.draw do

  namespace :api, constraints: { format: :json }, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :posts, only: [:index, :show, :create]
      post 'authenticate', to: 'authentication#authenticate'
    end
  end
end
