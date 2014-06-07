Rails.application.routes.draw do
  resources :retailers, only: [:index]
end
