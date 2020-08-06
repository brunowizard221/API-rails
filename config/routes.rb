Rails.application.routes.draw do
  resources :kinds

  resources :contacts do
    resource :phone, only: [:update, :create, :destroy]
    resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'

    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'

    resource :kind, only: [:show, :update]
    resource :kind, only: [:show, :update], path: 'relationships/kind'

    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
