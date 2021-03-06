Rails.application.routes.draw do
  get 'admin' => 'admin#index'

    controller :sessions do
        get 'login' => :new
        post 'login' => :create
        delete 'logout' => :destroy
    end

  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users

  resources :orders do
    resources :fulfillments
  end


  resources :line_items do
     member do
      put 'increase'
      put 'decrease'
     end
     put 'increase', on: :member
     put 'decrease', on: :member
   end

  resources :carts
  root 'store#index', as: 'store_index'

  resources :products



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
