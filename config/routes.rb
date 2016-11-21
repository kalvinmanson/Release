Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

    scope "(:locale)", locale: /en|es/ do  
        #Personal links
        get '/books/my', to: 'books#my'

        resources :paymments
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
        resources :conversations, only: [:index, :show, :new, :create] do
            member do
              post :reply
              post :trash
              post :untrash
            end
        end
        # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
        root to: "web#index"



        #AJAX 
        get '/cities_country/:id', to: 'cities#index', as: 'cities_country'
        post '/cities_country', to: 'cities#index'
    end
  
  
end
