Rails.application.routes.draw do
  root "home#index"
  resources :consulta
  resources :medicos

  resources :pacientes do
    resources :enderecos
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
