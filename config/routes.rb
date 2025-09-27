require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboard#index"
end