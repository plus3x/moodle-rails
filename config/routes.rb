Rails.application.routes.draw do
  root to: 'sessions#new', as: :root

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :courses
end
