Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comentarios, only: [:new, :create]
  end

  root to: "posts#index"

  resources :clientes, except: [:destroy, :index, :show]
  resources :funcionarios
  devise_for :users, :skip => [:registrations] , controllers: {
      sessions: 'users/sessions'
  }

  %w(404 422 500).each do |code|
    get code, :to => "erros#show", :code => code
  end

  get '*unmatched_route', to: 'application#raise_not_found'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
