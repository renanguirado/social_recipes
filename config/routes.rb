Rails.application.routes.draw do
  resources :recipes, only: [:new]
end
