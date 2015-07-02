Rails.application.routes.draw do
  root to: "practice#show"
  resource :practice, controller: "practice", only: :show

  resources :materials, only: [:new, :create, :show] do
    resources :practices, only: [:create], module: :material
    resource :completion, only: [:create, :destroy], module: :material
  end
end
