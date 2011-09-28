Gratefuldeed::Application.routes.draw do
  resources :stories

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" } do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  get 'home/how_it_works'
  get 'home/deeds'
  get 'home/about'
  get 'home/contactus'
  post 'home/contactus'
  get 'home/privacy'
  get 'home/faq'
  get 'home/wall'
  
  resources :deeds do
    member do
      get 'purchase'
    end
  end
  resources :sponsors
  resources :charities
  resource  :dashboard
  resources  :purchases do
    collection do
      get 'success'
    end
  end
  
  namespace :admin do
    resource :dashboard
    resources :users
    resources  :purchases
    resources :giveons
    resources :deeds do
      member do
        get 'activate'
        get 'cancel'
        get 'freeze'
        get 'spotify'
      end
    end
    resources :stories
    resources :sponsors do
      member do
        get 'verify'
        get 'deny'
      end
    end
    resources :charities
    
  end
  
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
