Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es/ do  
    resources :paymments
    devise_for :users
    resources :books
    resources :pictures
    resources :reports
    resources :comments
    resources :notifications
    resources :ranks
    resources :orders
    resources :posts
    resources :categories
    resources :addresses
    resources :genders
    resources :users
    resources :cities
    resources :countries
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
    root to: "web#index"

    #AJAX 
    get '/cities_country/:id', to: 'cities#index', as: 'cities_country'
    post '/cities_country', to: 'cities#index'
  end
  
  
end
