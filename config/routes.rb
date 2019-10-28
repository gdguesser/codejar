require 'sidekiq/web'

Rails.application.routes.draw do
  get 'blog/index'
  get 'marketplace/index'
  get 'dashboard/index'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

    resources :dashboard, only: [:index]
    resources :marketplace, only: [:index]
    resources :blog, only: [:index]

  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
