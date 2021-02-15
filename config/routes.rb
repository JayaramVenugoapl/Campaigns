Rails.application.routes.draw do

  namespace :api do
    resources :campaigns do 
      resource :discussion_topic
      resources :comments
    end
    post "signup", :to => "users#create"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match "*unmatched", to: "application#routing_error", via: :all
end

