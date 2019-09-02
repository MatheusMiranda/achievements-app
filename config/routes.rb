Rails.application.routes.draw do
  resources :deaths
  resources :killed_monsters
  resources :monsters
  resources :collected_coins
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
