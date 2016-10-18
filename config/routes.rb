Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  namespace :v1 do
    resources :users
  end
end
