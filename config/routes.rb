Rails.application.routes.draw do
  root "tasks#index"
  devise_for :users

  resources :tasks do
    patch "move", on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
