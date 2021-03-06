Rails.application.routes.draw do
  root to: 'sessions#new', as: :root

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  get 'dashboard' => 'dashboard#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :upload_files
  resources :submissions

  resources :courses do
    resources :discussions do
      resources :comments
    end
    resources :learning_units do
      resources :activities
    end
  end
end
