Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :admin do
    get :dashboard, to: 'dashboard#index', as: :dashboard

    resources :adapters, only: [:index] do
      collection do
        put 'update/:adapter', to: 'adapters#update', as: :update
      end
    end

    resources :visitors
  end
end
