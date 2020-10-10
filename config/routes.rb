Rails.application.routes.draw do
  resources :clientes
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
