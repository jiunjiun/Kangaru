Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users

  namespace :admin do
    get :dashboard, to: 'dashboard#index', as: :dashboard

    resources :adapters, only: [:index] do
      collection do
        put 'update/:adapter', to: 'adapters#update', as: :update
      end
    end

    resources :visitors
  end

  root 'home#index'
  post 'callback/:company_token/:adapter', to: 'callback#index', as: :callback
end
