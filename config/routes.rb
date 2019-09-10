Rails.application.routes.draw do
  resources :achievement_categories
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :killed_monsters
      resources :monsters

      resources :users do
        resources :achievements
        resources :collected_coins
        resources :deaths
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
