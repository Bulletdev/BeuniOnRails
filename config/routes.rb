require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Página inicial pública
  get 'home/index'

  # Dashboard para usuários autenticados
  authenticate :user do
    get 'dashboard', to: 'dashboard#index'
  end

  # Root depende se o usuário está logado
  root to: 'home#index'
end