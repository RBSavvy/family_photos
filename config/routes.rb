Johnsonators::Application.routes.draw do

  resources :families do
    member do
      delete :leave
    end
    resources :albums do
      resources :photos
    end
  end

  resources :users

  get  'login'  => 'sessions#new'
  post 'login'  => 'sessions#create'
  get  'logout' => 'sessions#destroy'


  root to: 'families#index'


end
