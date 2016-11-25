Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails do
    resources :doses, only: [:create, :destroy]
  end
  # delete "doses/:id" => "doses#destroy"
  resources :ingredients, only: [:show]
  root "cocktails#index"
end
