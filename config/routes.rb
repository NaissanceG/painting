Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: "paintings#index"

  resources :paintings do
    resources :comments
  end
  
end
