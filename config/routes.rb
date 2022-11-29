Rails.application.routes.draw do

  resources :groups do 
    resources :items
  end

  resources :splash, only: %i[index]
  devise_for :users, sign_out_via: %i[get]


  # Defines the root path route ("/")
  root "splash#index"
end
