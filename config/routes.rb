Rails.application.routes.draw do
  require 'sidekiq/web'
  devise_for :admins
  authenticate :admin do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount RailsAdmin::Engine => '/', as: 'rails_admin'
  telegram_webhook TelegramController
end
