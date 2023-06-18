Rails.application.routes.draw do
  root "home#index"
  resources :consulta
  resources :medicos

  resources :pacientes do
    resources :enderecos
  end

  resources :pacientes do
    post 'agendar_consulta', on: :member
  end

  #root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
