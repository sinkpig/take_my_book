Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/profile", to: "pages#profile"
  # definir o que tera na home (opcao para o index dos livros, para publicar um livro etc)

  resources :books do
    resources :trades, only: [:new, :create]
    patch :change_availability_to_true, on: :member
    resources :reviews, only: :create
  end

  resources :trades, only: [:destroy, :index]
end
