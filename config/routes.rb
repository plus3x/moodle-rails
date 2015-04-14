Rails.application.routes.draw do
  root to: 'sessions#new', as: :root

  resources :users

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
