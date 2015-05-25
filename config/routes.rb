Rails.application.routes.draw do
  root to: "materials#index"

  resources :materials, only: [:new, :create, :show, :index]
end
