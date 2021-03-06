Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :achievement_categories
      resources :killed_monsters, except: [:create]
      post '/monster/:monster_id/user/:user_id', to: 'killed_monsters#create'
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
