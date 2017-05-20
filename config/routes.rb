Rails.application.routes.draw do
  root to: 'home#show'
  resources :users, only: [:new, :create, :show, :update]
  namespace :messages do
    namespace :twilio do
      post :users, to: 'users#update'
    end
  end
end
