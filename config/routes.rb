Rails.application.routes.draw do
  resources :clientes
  resources :funcionarios
  devise_for :users, :skip => [:registrations] , controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
