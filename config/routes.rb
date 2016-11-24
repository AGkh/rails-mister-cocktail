Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails, only: [:show, :index, :new, :create] do
    resources :doses, only: [:create]
  end
  delete "doses/:id" => "doses#destroy"
  resources :ingredients, only: [:show]
  root "cocktails#index"
end
