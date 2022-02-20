Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :main, only: [:index]
  namespace :management do
    resources :pet, only:[] do
      collection do
        
      end
    end    
  end
  namespace :rabbit do
    resources :info, only: [:index] do
      collection do
        get :feed
      end
    end
  end
  resources :login, only:[:index, :new, :create] do
    collection do
      post :login
    end
  end
end
