Rails.application.routes.draw do
  root to: "materials#index"

  resources :materials, only: [:new, :create, :show, :index] do
    resources :practices, only: [:create], module: :material
    resources :completions, only: [:create], module: :material
  end
end
