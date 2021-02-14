Rails.application.routes.draw do
  
  namespace :api do
    resources :users, only: [:create, :delete]
    resources :campaigns do 
      resources :discussion_topics
      resources :comments
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match "*unmatched", to: "application#routing_error", via: :all
end

