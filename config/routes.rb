Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :main, only: [:index]
  namespace :management do
    resources :product, only:[:index, :new] do
      collection do
        get :search, :edit
        post :create
        patch :update
        delete :destroy
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
  namespace :shop do
    resources :customer, only: [:index] do
      collection do
        get :search
        post :add_to_cart
      end
    end
  end
  resources :login, only:[:index, :new] do
    collection do
      post :login, :create
      get :logout
    end
  end
  resources :cart, only: [:index] do
    collection do
      get :show_data, :check_out
      patch :update
      delete :destroy
    end
  end
end
