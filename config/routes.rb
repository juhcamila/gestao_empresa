Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comentarios, only: [:new, :create]
  end

  resources :clientes
  resources :funcionarios
  devise_for :users, :skip => [:registrations] , controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
